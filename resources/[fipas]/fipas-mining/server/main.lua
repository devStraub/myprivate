local RSGCore = exports['rsg-core']:GetCoreObject()
local sessions = {}
local cooldowns = {}
local validModels = {}
local totalWeight = 0

lib.locale()

local function notify(src, key, notifyType, ...)
    TriggerClientEvent('ox_lib:notify', src, {
        title = 'Mineração', description = locale(key, ...), type = notifyType or 'inform'
    })
end

local function nodeKey(coords)
    return ('%.1f:%.1f:%.1f'):format(coords.x, coords.y, coords.z)
end

local function registerItems()
    for name, data in pairs(Config.Items) do
        if not RSGCore.Shared.Items[name] then
            local ok, reason = RSGCore.Functions.AddItem(name, {
                name = name, label = data.label, weight = data.weight, type = 'item', image = data.image,
                unique = false, useable = false, shouldClose = false, description = data.description
            })
            if not ok then print(('[fipas-mining] falha ao registrar %s: %s'):format(name, reason)) end
        end
    end
end

local function chooseReward()
    local roll = math.random(1, totalWeight)
    local cursor = 0
    for _, reward in ipairs(Config.Rewards) do
        cursor = cursor + reward.weight
        if roll <= cursor then return reward end
    end
end

local function validateDistance(src, coords, maxDistance)
    local ped = GetPlayerPed(src)
    if not ped or ped == 0 then return false end
    return #(GetEntityCoords(ped) - vector3(coords.x, coords.y, coords.z)) <= maxDistance
end

lib.callback.register('fipas-mining:server:begin', function(source, data)
    if sessions[source] then return false, 'already_mining' end
    if type(data) ~= 'table' or not tonumber(data.x) or not validModels[tonumber(data.model)] then return false, 'security_rejected' end
    local coords = vector3(data.x, data.y, data.z)
    if not validateDistance(source, coords, Config.TargetDistance + 1.2) then return false, 'invalid_position' end
    local player = RSGCore.Functions.GetPlayer(source)
    if not player or not player.Functions.GetItemByName(Config.Tool) then return false, 'no_pickaxe' end
    local key = nodeKey(coords)
    if cooldowns[key] and cooldowns[key] > os.time() then return false, 'rock_depleted' end
    local token = ('%s:%s:%s'):format(source, os.time(), math.random(100000, 999999))
    sessions[source] = { token = token, coords = coords, key = key, started = GetGameTimer() }
    return token
end)

RegisterNetEvent('fipas-mining:server:cancel', function(token)
    local src = source
    if sessions[src] and sessions[src].token == token then sessions[src] = nil end
end)

RegisterNetEvent('fipas-mining:server:complete', function(token)
    local src = source
    local session = sessions[src]
    sessions[src] = nil
    if not session or session.token ~= token then return notify(src, 'security_rejected', 'error') end
    if GetGameTimer() - session.started < Config.MinimumServerDuration then return notify(src, 'security_rejected', 'error') end
    if not validateDistance(src, session.coords, Config.TargetDistance + 1.8) then return notify(src, 'invalid_position', 'error') end
    local player = RSGCore.Functions.GetPlayer(src)
    if not player or not player.Functions.GetItemByName(Config.Tool) then return notify(src, 'no_pickaxe', 'error') end
    if cooldowns[session.key] and cooldowns[session.key] > os.time() then return notify(src, 'rock_depleted', 'error') end

    local reward = chooseReward()
    local amount = math.random(reward.min, reward.max)
    if not exports['rsg-inventory']:CanAddItem(src, reward.name, amount) then return notify(src, 'inventory_full', 'error') end
    if not player.Functions.AddItem(reward.name, amount, false, false, 'fipas-mining') then return notify(src, 'inventory_full', 'error') end
    cooldowns[session.key] = os.time() + Config.CooldownSeconds
    notify(src, 'received', 'success', amount, reward.label)

    if math.random(1, 100) <= Config.ToolBreakChance then
        player.Functions.RemoveItem(Config.Tool, 1, false, 'fipas-mining-tool-break')
        notify(src, 'pickaxe_broke', 'error')
    end
end)

AddEventHandler('playerDropped', function() sessions[source] = nil end)

CreateThread(function()
    for _, model in ipairs(Config.Rocks) do validModels[joaat(model)] = true end
    for _, reward in ipairs(Config.Rewards) do totalWeight = totalWeight + reward.weight end
    registerItems()
    print(('[fipas-mining] iniciado com %s modelos de rocha e %s recompensas.'):format(#Config.Rocks, #Config.Rewards))
end)
