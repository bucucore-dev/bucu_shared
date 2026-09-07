-- ============================================================================
-- BUCU Scripts Ecosystem — bucu_shared Server Service & Exports
-- ============================================================================

local function Export_GetItems()
    return BucuItems.List
end

local function Export_GetItem(itemName)
    return BucuItems.Get(itemName)
end

local function Export_GetConfig()
    return Config
end

local function Export_ItemExists(itemName)
    return BucuItems.Exists(itemName)
end

local function Export_FormatWeight(grams)
    return BucuSharedHelpers.FormatWeight(grams)
end

-- Daftarkan export FiveM
exports('GetItems', Export_GetItems)
exports('GetItem', Export_GetItem)
exports('GetConfig', Export_GetConfig)
exports('ItemExists', Export_ItemExists)
exports('FormatWeight', Export_FormatWeight)

-- Daftarkan juga di tabel global Bucu jika bucu_core aktif
AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    local count = 0
    for _ in pairs(BucuItems.List) do count = count + 1 end
    print('^2[bucu_shared]^0 Initialized with ' .. tostring(count) .. ' master items and database schemas ready.')
end)
