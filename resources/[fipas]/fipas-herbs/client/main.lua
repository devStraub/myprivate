local busy = false
local plantHashes = {}

lib.locale()

local function notify(description, notifyType)
    lib.notify({ title = 'Coleta', description = description, type = notifyType or 'inform' })
end

local function canPick(ped)
    return not busy
        and not IsPedDeadOrDying(ped, false)
        and not IsPedOnMount(ped)
        and not IsPedInAnyVehicle(ped, false)
        and not IsEntityInWater(ped)
end

local function playPickAnimation(coords)
    TaskTurnPedToFaceCoord(cache.ped, coords.x, coords.y, coords.z, 1000)
    Wait(700)
    local dict = 'mech_ransack@shelf@h150cm@d80cm@reach_up@pickup@vertical@right_50cm@a'
    lib.requestAnimDict(dict)
    TaskPlayAnim(cache.ped, dict, 'enter_rf', 8.0, 8.0, 900, 1, 0.0, false, false, false)
end

RegisterNetEvent('fipas-herbs:client:pick', function(data)
    if busy then return notify(locale('already_picking'), 'error') end
    if not canPick(cache.ped) then return notify(locale('invalid_position'), 'error') end
    local entity = data and data.entity
    if not entity or not DoesEntityExist(entity) then return notify(locale('invalid_position'), 'error') end
    local coords = GetEntityCoords(entity)
    if #(GetEntityCoords(cache.ped) - coords) > Config.TargetDistance + 0.8 then return notify(locale('invalid_position'), 'error') end

    busy = true
    local token, reason, plantName = lib.callback.await('fipas-herbs:server:begin', false, {
        x = coords.x, y = coords.y, z = coords.z, model = GetEntityModel(entity)
    })
    if not token then busy = false return notify(locale(reason or 'security_rejected'), 'error') end

    playPickAnimation(coords)
    local completed = lib.progressCircle({
        duration = Config.ActionDuration,
        label = locale('picking', plantName),
        position = 'bottom',
        canCancel = true,
        disable = { move = true, combat = true, car = true }
    })
    ClearPedTasks(cache.ped)
    if completed then TriggerServerEvent('fipas-herbs:server:complete', token)
    else TriggerServerEvent('fipas-herbs:server:cancel', token) notify(locale('cancelled'), 'error') end
    busy = false
end)

CreateThread(function()
    for _, plant in ipairs(Config.Plants) do plantHashes[#plantHashes + 1] = joaat(plant.model) end
    exports.ox_target:addModel(plantHashes, {{
        name = 'fipas_herbs_plant',
        event = 'fipas-herbs:client:pick',
        icon = 'fa-solid fa-seedling',
        label = locale('target_pick'),
        distance = Config.TargetDistance,
        canInteract = function(_, distance)
            return distance <= Config.TargetDistance and canPick(cache.ped)
        end,
    }})
end)

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    exports.ox_target:removeModel(plantHashes, 'fipas_herbs_plant')
    ClearPedTasks(cache.ped)
end)
