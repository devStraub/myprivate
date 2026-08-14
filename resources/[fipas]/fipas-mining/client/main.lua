local busy = false
local pickaxeObject
local rockHashes = {}

lib.locale()

local function notify(description, notifyType)
    lib.notify({ title = 'Mineração', description = description, type = notifyType or 'inform' })
end

local function isBlockedTown(coords)
    local townHash = Citizen.InvokeNative(0x43AD8FC02B429D33, coords.x, coords.y, coords.z, 1)
    if not townHash then return false end
    for town in pairs(Config.BlockedTowns) do
        if townHash == joaat(town) then return true end
    end
    return false
end

local function canMine(ped, coords)
    return not busy
        and not IsPedDeadOrDying(ped, false)
        and not IsPedOnMount(ped)
        and not IsPedInAnyVehicle(ped, false)
        and not IsEntityInWater(ped)
        and not isBlockedTown(coords)
end

local function removePickaxe()
    if pickaxeObject and DoesEntityExist(pickaxeObject) then DeleteEntity(pickaxeObject) end
    pickaxeObject = nil
    ClearPedTasks(cache.ped)
end

local function playMiningAnimation()
    local model = joaat('p_pickaxe01x')
    lib.requestModel(model)
    pickaxeObject = CreateObject(model, 0.0, 0.0, 0.0, false, false, false)
    AttachEntityToEntity(pickaxeObject, cache.ped, GetPedBoneIndex(cache.ped, 7966), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
    local dict = 'amb_work@world_human_pickaxe_new@working@male_a@trans'
    lib.requestAnimDict(dict)
    TaskPlayAnim(cache.ped, dict, 'pre_swing_trans_after_swing', 2.0, 2.0, Config.ActionDuration, 1, 0.0, false, false, false)
end

RegisterNetEvent('fipas-mining:client:mine', function(data)
    local ped = cache.ped
    local coords = GetEntityCoords(ped)
    if busy then return notify(locale('already_mining'), 'error') end
    if isBlockedTown(coords) then return notify(locale('town_blocked'), 'error') end
    if not canMine(ped, coords) then return notify(locale('invalid_position'), 'error') end

    local entity = data and data.entity
    if not entity or not DoesEntityExist(entity) then return notify(locale('invalid_position'), 'error') end
    local rockCoords = GetEntityCoords(entity)
    if #(coords - rockCoords) > Config.TargetDistance + 0.8 then return notify(locale('invalid_position'), 'error') end

    busy = true
    local token, reason = lib.callback.await('fipas-mining:server:begin', false, {
        x = rockCoords.x, y = rockCoords.y, z = rockCoords.z, model = GetEntityModel(entity)
    })
    if not token then busy = false return notify(locale(reason or 'security_rejected'), 'error') end

    local passed = lib.skillCheck(Config.SkillCheck, { 'a', 'd' })
    if not passed then
        TriggerServerEvent('fipas-mining:server:cancel', token)
        busy = false
        return notify(locale('failed'), 'error')
    end

    playMiningAnimation()
    local completed = lib.progressCircle({
        duration = Config.ActionDuration,
        label = locale('mining'),
        position = 'bottom',
        canCancel = true,
        disable = { move = true, combat = true, car = true }
    })
    removePickaxe()
    if completed then TriggerServerEvent('fipas-mining:server:complete', token)
    else TriggerServerEvent('fipas-mining:server:cancel', token) notify(locale('cancelled'), 'error') end
    busy = false
end)

CreateThread(function()
    for _, model in ipairs(Config.Rocks) do rockHashes[#rockHashes + 1] = joaat(model) end
    exports.ox_target:addModel(rockHashes, {{
        name = 'fipas_mining_rock',
        event = 'fipas-mining:client:mine',
        icon = 'fa-solid fa-hammer',
        label = locale('target_mine'),
        distance = Config.TargetDistance,
        canInteract = function(_, distance)
            local ped = cache.ped
            return distance <= Config.TargetDistance and canMine(ped, GetEntityCoords(ped))
        end,
    }})
end)

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    exports.ox_target:removeModel(rockHashes, 'fipas_mining_rock')
    removePickaxe()
end)
