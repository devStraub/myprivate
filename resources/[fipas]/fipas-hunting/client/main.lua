local spawnedButchers = {}
local busy = false

lib.locale()

local function notify(description, notifyType)
    lib.notify({ title = 'Caça', description = description, type = notifyType or 'inform' })
end

local function findAnimalByPelt(quality)
    for model, animal in pairs(Config.Animals) do
        if quality == animal.poor or quality == animal.good or quality == animal.perfect then return model end
    end
end

local function getCarriedEntity()
    local carried = Citizen.InvokeNative(0xD806CD2A4F2C2996, cache.ped)
    if carried and carried ~= 0 and DoesEntityExist(carried) then return carried end
    local horse = Citizen.InvokeNative(0x4C8B59171957BCF7, cache.ped)
    if horse and horse ~= 0 and DoesEntityExist(horse) and Citizen.InvokeNative(0xA911EE21EDF69DAF, horse) then
        carried = Citizen.InvokeNative(0xD806CD2A4F2C2996, horse)
        if carried and carried ~= 0 and DoesEntityExist(carried) then return carried end
    end
end

local function sellCarried()
    if busy then return end
    local entity = getCarriedEntity()
    if not entity then return notify(locale('not_holding'), 'error') end
    local netId = NetworkGetNetworkIdFromEntity(entity)
    if not netId or netId == 0 then return notify(locale('security_rejected'), 'error') end
    local model = GetEntityModel(entity)
    local context, animalModel, quality
    if Config.Animals[model] then
        context, animalModel = 'carcass', model
    else
        quality = Citizen.InvokeNative(0x31FEF6A20F00B963, entity)
        animalModel = quality and findAnimalByPelt(quality)
        if animalModel then context = 'pelt' end
    end
    if not context then return notify(locale('invalid_animal'), 'error') end
    busy = true
    TriggerServerEvent('fipas-hunting:server:sell', {
        context = context, netId = netId, model = animalModel, quality = quality
    })
    SetTimeout(1800, function() busy = false end)
end

RegisterNetEvent('fipas-hunting:client:saleResult', function(success, netId)
    busy = false
    if not success then return end
    local entity = NetworkGetEntityFromNetworkId(netId)
    if entity and entity ~= 0 and DoesEntityExist(entity) then
        SetEntityAsMissionEntity(entity, true, true)
        DeleteEntity(entity)
    end
end)

CreateThread(function()
    for index, butcher in ipairs(Config.Butchers) do
        local model = joaat(butcher.npcmodel)
        lib.requestModel(model)
        local ped = CreatePed(model, butcher.coords.x, butcher.coords.y, butcher.coords.z - 1.0, butcher.heading, false, false, false, false)
        Citizen.InvokeNative(0x283978A15512B2FE, ped, true)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        FreezeEntityPosition(ped, true)
        spawnedButchers[#spawnedButchers + 1] = ped
        exports.ox_target:addLocalEntity(ped, {{
            name = ('fipas_hunting_butcher_%s'):format(index),
            icon = 'fa-solid fa-drumstick-bite',
            label = locale('target_sell'),
            distance = Config.ButcherDistance,
            onSelect = sellCarried,
        }})
        if butcher.showblip then
            local blip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, butcher.coords)
            SetBlipSprite(blip, butcher.blip, true)
            Citizen.InvokeNative(0x9CB1A1623062F402, blip, butcher.butchername or locale('butcher_blip'))
        end
    end
end)

CreateThread(function()
    repeat Wait(1000) until LocalPlayer.state.IsInSession
    while true do
        Wait(0)
        local size = GetNumberOfEvents(0)
        for index = 0, size - 1 do
            if GetEventAtIndex(0, index) == `EVENT_LOOT_COMPLETE` then
                local eventData = DataView.ArrayBuffer(24)
                eventData:SetInt32(0, 0); eventData:SetInt32(8, 0); eventData:SetInt32(16, 0)
                if Citizen.InvokeNative(0x57EC5FA4D4D6AFCA, 0, index, eventData:Buffer(), 3) then
                    local looter, animal, completed = eventData:GetInt32(0), eventData:GetInt32(8), eventData:GetInt32(16)
                    if looter == cache.ped and completed == 1 and animal ~= 0 and DoesEntityExist(animal) then
                        local model = GetEntityModel(animal)
                        if Config.SkinnableAnimals[model] then
                            local netId = NetworkGetNetworkIdFromEntity(animal)
                            if netId and netId ~= 0 then
                                TriggerServerEvent('fipas-hunting:server:skinned', { netId = netId, model = model })
                            end
                        end
                    end
                end
            end
        end
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    for _, ped in ipairs(spawnedButchers) do
        if DoesEntityExist(ped) then exports.ox_target:removeLocalEntity(ped) DeleteEntity(ped) end
    end
end)
