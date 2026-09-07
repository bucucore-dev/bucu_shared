-- ============================================================================
-- BUCU Scripts Ecosystem — Shared Constants
-- ============================================================================

BucuConstants = BucuConstants or {}

-- Tipe Kompartemen / Wadah Penyimpanan
BucuConstants.ContainerType = {
    POCKET = 'pocket',
    TRUNK = 'trunk',
    GLOVEBOX = 'glovebox',
    STASH = 'stash',
    DROP = 'drop'
}

-- Kategori Tipe Item
BucuConstants.ItemType = {
    ITEM = 'item',
    FOOD = 'food',
    DRINK = 'drink',
    WEAPON = 'weapon',
    AMMO = 'ammo',
    CARD = 'card',
    TOOL = 'tool'
}

-- Tipe Buff Gameplay dari Konsumsi
BucuConstants.BuffType = {
    STAMINA_BOOST = 'stamina_boost',      -- Lari tidak lelah
    HEALTH_REGEN = 'health_regen',        -- Regenerasi HP per detik
    PAIN_RELIEF = 'pain_relief',          -- Hilangkan layar buram
    INSTANT_STAMINA = 'instant_stamina'   -- Isi stamina instan 100%
}

-- Batas Default Kapasitas Inventori
BucuConstants.DefaultLimits = {
    POCKET_SLOTS = 40,
    POCKET_MAX_WEIGHT = 30000,   -- 30 kg (dalam gram)
    TRUNK_SLOTS = 60,
    TRUNK_MAX_WEIGHT = 60000,    -- 60 kg
    GLOVEBOX_SLOTS = 10,
    GLOVEBOX_MAX_WEIGHT = 5000,  -- 5 kg
    DROP_SLOTS = 30,
    DROP_MAX_WEIGHT = 50000,     -- 50 kg
    HOTBAR_SLOTS = 5
}

-- Kode Error & Status Inventori
BucuConstants.Errors = {
    SUCCESS = 'SUCCESS',
    INVENTORY_FULL = 'INVENTORY_FULL',
    WEIGHT_EXCEEDED = 'WEIGHT_EXCEEDED',
    INVALID_SLOT = 'INVALID_SLOT',
    INVALID_COUNT = 'INVALID_COUNT',
    ITEM_NOT_FOUND = 'ITEM_NOT_FOUND',
    CONTAINER_LOCKED = 'CONTAINER_LOCKED',
    ANTI_DUPE_TRIGGERED = 'ANTI_DUPE_TRIGGERED',
    TARGET_FAR = 'TARGET_FAR',
    UNUSABLE_ITEM = 'UNUSABLE_ITEM',
    PERMISSION_DENIED = 'PERMISSION_DENIED'
}
