-- ============================================================================
-- BUCU Scripts Ecosystem — Master Shared Configuration
-- ============================================================================

Config = Config or {}

-- Bahasa Utama (Dapat diatur 'en' atau 'id')
Config.Language = 'en'

-- Pengaturan Inventori (Saku & Kompartemen)
Config.Inventory = {
    MaxWeight = 30000,           -- Kapasitas saku default (30.000 gram / 30 kg)
    MaxSlots = 40,               -- Jumlah slot saku
    HotbarSlots = 5,             -- Jumlah slot akses cepat (tombol 1-5)
    DropDespawnMinutes = 15,     -- Item di tanah terhapus otomatis setelah 15 menit
    TrunkMaxWeight = 60000,      -- Kapasitas bagasi mobil (60 kg)
    TrunkSlots = 60,
    GloveboxMaxWeight = 5000,    -- Kapasitas laci mobil (5 kg)
    GloveboxSlots = 10,
    CloseOnUseDefault = true     -- Menutup NUI saat item digunakan
}

-- Pengaturan Efek Pembeda (Differentiators)
Config.Differentiators = {
    WebAudioHaptics = true,      -- Aktifkan efek suara haptik realistis WebAudio
    OptimisticUI = true,         -- Aktifkan drag & drop instan 0ms dengan rollback atomik
    PhysicalWorldSync = true,    -- Buka pintu bagasi mobil fisik di 3D world saat F2
    ContextMenuEnabled = true,   -- Aktifkan menu klik kanan kursor
    StreamerModeDefault = false  -- Mode privasi sensor saldo bank
}

-- Pengaturan Kebutuhan Tubuh (Needs Decay)
Config.Needs = {
    TickIntervalSeconds = 60,    -- Loop pengurangan setiap 60 detik
    HungerRate = 0.5,            -- Lapar berkurang 0.5% per menit
    ThirstRate = 0.7,            -- Haus berkurang 0.7% per menit
    SprintMultiplier = 1.5,      -- Pengurangan bertambah 1.5x saat lari
    BlurThreshold = 5.0,         -- Peringatan blur saat status <= 5%
    HealthDrainThreshold = 0.0,  -- Pengurangan HP dimulai saat status 0%
    HealthDrainAmount = 5        -- Berkurang 5 HP setiap 10 detik saat sekarat
}

-- Pengaturan Discord Audit Logger
Config.DiscordLogs = {
    Enabled = false,             -- Aktifkan jika URL webhook sudah diisi
    Webhooks = {
        ['banking'] = '',        -- Webhook transfer besar & mutasi ATM
        ['inventory'] = '',      -- Webhook drop senjata langka / stash
        ['deaths'] = '',         -- Webhook combat log & kematian
        ['admin'] = ''           -- Webhook tindakan developer & builder
    },
    ScrubPII = true              -- Otomatis sensor IP address sebelum dikirim
}
