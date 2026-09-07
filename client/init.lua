-- ============================================================================
-- BUCU Scripts Ecosystem — bucu_shared Client Service & Exports
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

exports('GetItems', Export_GetItems)
exports('GetItem', Export_GetItem)
exports('GetConfig', Export_GetConfig)
exports('ItemExists', Export_ItemExists)
exports('FormatWeight', Export_FormatWeight)
