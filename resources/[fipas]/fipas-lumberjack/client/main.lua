local busy = false
local axeObject
local treeHashes = {}

lib.locale()

local function notify(description, notifyType)
    lib.notify({ title = 'Lenhador', description = description, type = notifyType or 'inform' })
end

local function isBlockedTown(coords)
    local townHash = Citizen.InvokeNative(0x43AD8FC02B429D33, coords.x, coords.y, coords.z, 1)
    if not townHash then return false end
    for town in pairs(Config.BlockedTowns) do
        if townHash == joaat(town) then return true end
    end
    return false
end

local function canChop(ped, coords)
    return not busy
        and not IsPedDeadOrDying(ped, false)
        and not IsPedOnMount(ped)
        and not IsPedInAnyVehicle(ped, false)
        and not IsEntityInWater(ped)
        and not isBlockedTown(coords)
end

local function removeAxe()
    if axeObject and DoesEntityExist(axeObject) then DeleteEntity(axeObject) end
    axeObject = nil
    ClearPedTasks(cache.ped)
end

local function playChoppingAnimation()
    local model = joaat('p_axe02x')
    lib.requestModel(model)
    axeObject = CreateObject(model, 0.0, 0.0, 0.0, false, false, false)
    AttachEntityToEntity(axeObject, cache.ped, GetPedBoneIndex(cache.ped, 7966), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
    local dict = 'amb_work@world_human_tree_chop_new@working@pre_swing@male_a@trans'
    lib.requestAnimDict(dict)
    TaskPlayAnim(cache.ped, dict, 'pre_swing_trans_after_swing', 2.0, 2.0, Config.ActionDuration, 1, 0.0, false, false, false)
end

RegisterNetEvent('fipas-lumberjack:client:chop', function(data)
    local ped = cache.ped
    local coords = GetEntityCoords(ped)
    if busy then return notify(locale('already_chopping'), 'error') end
    if isBlockedTown(coords) then return notify(locale('town_blocked'), 'error') end
    if not canChop(ped, coords) then return notify(locale('invalid_position'), 'error') end

    local entity = data and data.entity
    if not entity or not DoesEntityExist(entity) then return notify(locale('invalid_position'), 'error') end
    local treeCoords = GetEntityCoords(entity)
    if #(coords - treeCoords) > Config.TargetDistance + 0.8 then return notify(locale('invalid_position'), 'error') end

    busy = true
    local token, reason = lib.callback.await('fipas-lumberjack:server:begin', false, {
        x = treeCoords.x, y = treeCoords.y, z = treeCoords.z, model = GetEntityModel(entity)
    })
    if not token then busy = false return notify(locale(reason or 'security_rejected'), 'error') end

    local passed = lib.skillCheck(Config.SkillCheck, { 'a', 'd' })
    if not passed then
        TriggerServerEvent('fipas-lumberjack:server:cancel', token)
        busy = false
        return notify(locale('failed'), 'error')
    end

    playChoppingAnimation()
    local completed = lib.progressCircle({
        duration = Config.ActionDuration,
        label = locale('chopping'),
        position = 'bottom',
        canCancel = true,
        disable = { move = true, combat = true, car = true }
    })
    removeAxe()
    if completed then TriggerServerEvent('fipas-lumberjack:server:complete', token)
    else TriggerServerEvent('fipas-lumberjack:server:cancel', token) notify(locale('cancelled'), 'error') end
    busy = false
end)

CreateThread(function()
    for _, model in ipairs(Config.Trees) do treeHashes[#treeHashes + 1] = joaat(model) end
    exports.ox_target:addModel(treeHashes, {{
        name = 'fipas_lumberjack_tree',
        event = 'fipas-lumberjack:client:chop',
        icon = 'fa-solid fa-tree',
        label = locale('target_chop'),
        distance = Config.TargetDistance,
        canInteract = function(_, distance)
            local ped = cache.ped
            return distance <= Config.TargetDistance and canChop(ped, GetEntityCoords(ped))
        end,
    }})
end)

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    exports.ox_target:removeModel(treeHashes, 'fipas_lumberjack_tree')
    removeAxe()
end)
