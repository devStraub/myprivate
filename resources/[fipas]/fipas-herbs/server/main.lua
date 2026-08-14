local RSGCore = exports['rsg-core']:GetCoreObject()
local sessions = {}
local cooldowns = {}
local plantsByModel = {}

lib.locale()

local function notify(src, key, notifyType, ...)
    TriggerClientEvent('ox_lib:notify', src, {
        title = 'Coleta', description = locale(key, ...), type = notifyType or 'inform'
    })
end

local function nodeKey(coords)
    return ('%.1f:%.1f:%.1f'):format(coords.x, coords.y, coords.z)
end

local function validateDistance(src, coords, maxDistance)
    local ped = GetPlayerPed(src)
    if not ped or ped == 0 then return false end
    return #(GetEntityCoords(ped) - vector3(coords.x, coords.y, coords.z)) <= maxDistance
end

local function registerItems()
    for name, data in pairs(Config.Items) do
        if not RSGCore.Shared.Items[name] then
            local image = name == 'apple' and 'apple.png' or 'apple.png'
            local ok, reason = RSGCore.Functions.AddItem(name, {
                name = name, label = data.label, weight = data.weight, type = 'item', image = image,
                unique = false, useable = false, shouldClose = false,
                description = ('Ingrediente natural: %s.'):format(data.label)
            })
            if not ok then print(('[fipas-herbs] falha ao registrar %s: %s'):format(name, reason)) end
        end
    end
end

lib.callback.register('fipas-herbs:server:begin', function(source, data)
    if sessions[source] then return false, 'already_picking' end
    if type(data) ~= 'table' or not tonumber(data.x) then return false, 'security_rejected' end
    local plant = plantsByModel[tonumber(data.model)]
    if not plant then return false, 'security_rejected' end
    local coords = vector3(data.x, data.y, data.z)
    if not validateDistance(source, coords, Config.TargetDistance + 1.2) then return false, 'invalid_position' end
    if not RSGCore.Functions.GetPlayer(source) then return false, 'security_rejected' end
    local key = nodeKey(coords)
    if cooldowns[key] and cooldowns[key] > os.time() then return false, 'plant_depleted' end
    local token = ('%s:%s:%s'):format(source, os.time(), math.random(100000, 999999))
    sessions[source] = { token = token, coords = coords, key = key, plant = plant, started = GetGameTimer() }
    return token, nil, plant.name
end)

RegisterNetEvent('fipas-herbs:server:cancel', function(token)
    local src = source
    if sessions[src] and sessions[src].token == token then sessions[src] = nil end
end)

RegisterNetEvent('fipas-herbs:server:complete', function(token)
    local src = source
    local session = sessions[src]
    sessions[src] = nil
    if not session or session.token ~= token then return notify(src, 'security_rejected', 'error') end
    if GetGameTimer() - session.started < Config.MinimumServerDuration then return notify(src, 'security_rejected', 'error') end
    if not validateDistance(src, session.coords, Config.TargetDistance + 1.8) then return notify(src, 'invalid_position', 'error') end
    if cooldowns[session.key] and cooldowns[session.key] > os.time() then return notify(src, 'plant_depleted', 'error') end
    local player = RSGCore.Functions.GetPlayer(src)
    if not player then return end

    local item = session.plant.rewards[math.random(1, #session.plant.rewards)]
    local amount = math.random(session.plant.min or 1, session.plant.max or 1)
    local definition = Config.Items[item]
    if not definition or not exports['rsg-inventory']:CanAddItem(src, item, amount) then return notify(src, 'inventory_full', 'error') end
    if not player.Functions.AddItem(item, amount, false, false, 'fipas-herbs') then return notify(src, 'inventory_full', 'error') end
    cooldowns[session.key] = os.time() + (session.plant.cooldown or Config.DefaultCooldownSeconds)
    notify(src, 'received', 'success', amount, definition.label)
end)

AddEventHandler('playerDropped', function() sessions[source] = nil end)

CreateThread(function()
    for _, plant in ipairs(Config.Plants) do plantsByModel[joaat(plant.model)] = plant end
    registerItems()
    print(('[fipas-herbs] iniciado com %s especies e %s itens naturais.'):format(#Config.Plants, (function() local n=0 for _ in pairs(Config.Items) do n=n+1 end return n end)()))
end)
