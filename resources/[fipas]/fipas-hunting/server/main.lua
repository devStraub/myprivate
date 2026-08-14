local RSGCore = exports['rsg-core']:GetCoreObject()
local processed = {}
local lastSale = {}
local butcherCoords = {}

lib.locale()

local function notify(src, key, notifyType, ...)
    TriggerClientEvent('ox_lib:notify', src, { title = 'Caça', description = locale(key, ...), type = notifyType or 'inform' })
end

local function normalizeItem(name)
    return tostring(name):lower():gsub('%s+', '_')
end

local function isProcessed(key)
    local expires = processed[key]
    if not expires then return false end
    if expires <= os.time() then processed[key] = nil return false end
    return true
end

local function markProcessed(key)
    processed[key] = os.time() + Config.ProcessedTtlSeconds
end

local function nearButcher(src)
    local ped = GetPlayerPed(src)
    if not ped or ped == 0 then return false end
    local coords = GetEntityCoords(ped)
    for _, location in ipairs(butcherCoords) do
        if #(coords - location) <= Config.ButcherDistance + 2.0 then return true end
    end
    return false
end

local function validNearbyEntity(src, netId, model, maxDistance, mustBeDead)
    local entity = NetworkGetEntityFromNetworkId(tonumber(netId) or 0)
    if not entity or entity == 0 or not DoesEntityExist(entity) then return nil end
    if model and GetEntityModel(entity) ~= model then return nil end
    local ped = GetPlayerPed(src)
    if not ped or #(GetEntityCoords(ped) - GetEntityCoords(entity)) > maxDistance then return nil end
    if mustBeDead and not IsEntityDead(entity) then return nil end
    return entity
end

local function buildRewards(animal)
    local rewards = {}
    for index, itemName in ipairs(animal.givenItem or {}) do
        local amount = (animal.givenAmount or {})[index] or 1
        if type(amount) == 'table' then amount = math.random(tonumber(amount[1]) or 1, tonumber(amount[2]) or 1)
        elseif amount <= 0 then amount = math.random(Config.ItemQuantity.Min, Config.ItemQuantity.Max) end
        rewards[#rewards + 1] = { name = normalizeItem(itemName), amount = amount }
    end
    return rewards
end

local function canReceive(src, rewards)
    local totalWeight = 0
    for _, reward in ipairs(rewards) do
        local item = RSGCore.Shared.Items[reward.name]
        if not item or not exports['rsg-inventory']:CanAddItem(src, reward.name, reward.amount) then return false end
        totalWeight = totalWeight + item.weight * reward.amount
    end
    return exports['rsg-inventory']:GetFreeWeight(src) >= totalWeight
end

local function giveRewards(src, animal)
    local player = RSGCore.Functions.GetPlayer(src)
    if not player then return false end
    local rewards = buildRewards(animal)
    if not canReceive(src, rewards) then notify(src, 'inventory_full', 'error') return false end
    local labels = {}
    for _, reward in ipairs(rewards) do
        player.Functions.AddItem(reward.name, reward.amount, false, false, 'fipas-hunting')
        labels[#labels + 1] = ('%sx %s'):format(reward.amount, RSGCore.Shared.Items[reward.name].label)
    end
    if #labels > 0 then notify(src, 'skin_received', 'success', table.concat(labels, ', ')) end
    return true
end

local function qualityMultiplier(animal, quality)
    if quality == animal.poor then return animal.poorQualityMultiplier or 1.0 end
    if quality == animal.good then return animal.goodQualityMultiplier or 1.5 end
    if quality == animal.perfect then return animal.perfectQualityMultiplier or 2.0 end
    return 1.0
end

RegisterNetEvent('fipas-hunting:server:skinned', function(data)
    local src = source
    if type(data) ~= 'table' then return end
    local netId, model = tonumber(data.netId), tonumber(data.model)
    local animal = model and Config.SkinnableAnimals[model]
    if not animal or not netId or isProcessed('skin:' .. netId) then return notify(src, 'already_rewarded', 'error') end
    if not validNearbyEntity(src, netId, model, Config.SkinRewardDistance, true) then return notify(src, 'security_rejected', 'error') end
    markProcessed('skin:' .. netId)
    giveRewards(src, animal)
end)

RegisterNetEvent('fipas-hunting:server:sell', function(data)
    local src = source
    local now = os.time()
    if lastSale[src] and now - lastSale[src] < Config.SaleRateLimitSeconds then return end
    lastSale[src] = now
    if type(data) ~= 'table' or not nearButcher(src) then return notify(src, 'too_far', 'error') end
    local netId, model = tonumber(data.netId), tonumber(data.model)
    local animal = model and Config.Animals[model]
    if not animal or not netId then return notify(src, 'invalid_animal', 'error') end
    local saleKey = 'sale:' .. netId
    if isProcessed(saleKey) then return notify(src, 'already_rewarded', 'error') end
    local entity
    if data.context == 'carcass' then
        entity = validNearbyEntity(src, netId, model, Config.ButcherDistance + 3.0, true)
    elseif data.context == 'pelt' and tonumber(data.quality) then
        local quality = tonumber(data.quality)
        if quality ~= animal.poor and quality ~= animal.good and quality ~= animal.perfect then return notify(src, 'invalid_animal', 'error') end
        entity = validNearbyEntity(src, netId, nil, Config.ButcherDistance + 3.0, false)
    end
    if not entity then return notify(src, 'security_rejected', 'error') end

    local rewards = buildRewards(animal)
    if not canReceive(src, rewards) then return notify(src, 'inventory_full', 'error') end
    local player = RSGCore.Functions.GetPlayer(src)
    if not player then return end
    markProcessed(saleKey)
    local money = tonumber(animal.money) or 0
    if data.context == 'pelt' then money = money * qualityMultiplier(animal, tonumber(data.quality)) end
    if money > 0 then player.Functions.AddMoney('cash', money, 'fipas-hunting-sale') end
    giveRewards(src, animal)
    DeleteEntity(entity)
    TriggerClientEvent('fipas-hunting:client:saleResult', src, true, netId)
    notify(src, 'sold', 'success', money)
end)

AddEventHandler('playerDropped', function() lastSale[source] = nil end)

CreateThread(function()
    for _, butcher in ipairs(Config.Butchers) do butcherCoords[#butcherCoords + 1] = butcher.coords end
    local definitions = {}
    local function collect(tableData)
        for _, animal in pairs(tableData) do
            for index, itemName in ipairs(animal.givenItem or {}) do
                local name = normalizeItem(itemName)
                if not RSGCore.Shared.Items[name] and not definitions[name] then
                    local display = (animal.givenDisplay or {})[index] or name:gsub('_', ' ')
                    definitions[name] = display
                end
            end
        end
    end
    collect(Config.SkinnableAnimals); collect(Config.Animals)
    local count = 0
    for name, label in pairs(definitions) do
        local ok = RSGCore.Functions.AddItem(name, {
            name = name, label = label, weight = 150, type = 'item', image = 'good_pelt.png',
            unique = false, useable = false, shouldClose = false, description = 'Produto obtido durante a caça.'
        })
        if ok then count = count + 1 end
    end
    local skinCount, saleCount = 0, 0
    for _ in pairs(Config.SkinnableAnimals) do skinCount = skinCount + 1 end
    for _ in pairs(Config.Animals) do saleCount = saleCount + 1 end
    print(('[fipas-hunting] iniciado com %s animais esfolaveis, %s animais comerciais, %s acougues e %s novos itens.'):format(skinCount, saleCount, #Config.Butchers, count))
end)
