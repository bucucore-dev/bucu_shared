-- ============================================================================
-- BUCU Scripts Ecosystem — Master Database Schema
-- Target: oxmysql (MySQL 8.0+ / MariaDB 10.5+)
-- Compatible with: BUCU Standalone, QBCore, ESX, and QBox
-- ============================================================================

-- 0. Tabel Karakter Warga & Identitas Utama
CREATE TABLE IF NOT EXISTS `bucu_characters` (
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `identifier` VARCHAR(64) NOT NULL,
    `firstname` VARCHAR(50) NOT NULL DEFAULT 'Citizen',
    `lastname` VARCHAR(50) NOT NULL DEFAULT 'FiveM',
    `date_of_birth` VARCHAR(20) NOT NULL DEFAULT '1990-01-01',
    `gender` VARCHAR(10) NOT NULL DEFAULT 'male',
    `phone_number` VARCHAR(20) DEFAULT NULL,
    `metadata` LONGTEXT DEFAULT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `last_seen` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `idx_identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `bucu_accounts` (
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `character_id` INT UNSIGNED NOT NULL,
    `account_type` VARCHAR(20) NOT NULL,
    `balance` BIGINT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_char_account` (`character_id`, `account_type`),
    CONSTRAINT `fk_bucu_accounts_character` FOREIGN KEY (`character_id`) REFERENCES `bucu_characters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `bucu_jobs` (
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `character_id` INT UNSIGNED NOT NULL,
    `job_name` VARCHAR(50) NOT NULL DEFAULT 'unemployed',
    `job_grade` INT NOT NULL DEFAULT 0,
    `on_duty` TINYINT(1) NOT NULL DEFAULT 1,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_char_job` (`character_id`),
    CONSTRAINT `fk_bucu_jobs_character` FOREIGN KEY (`character_id`) REFERENCES `bucu_characters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 1. Tabel Inventori (Saku, Tas, Trunk, Glovebox, Stash, Drop)
CREATE TABLE IF NOT EXISTS `bucu_inventories` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `owner_identifier` VARCHAR(64) NOT NULL COMMENT 'CitizenID karakter atau Plat mobil / Stash ID',
    `container_type` ENUM('pocket', 'trunk', 'glovebox', 'stash', 'drop') NOT NULL DEFAULT 'pocket',
    `slot` INT UNSIGNED NOT NULL COMMENT 'Nomor slot dalam kontainer (1 s/d N)',
    `item_name` VARCHAR(50) NOT NULL COMMENT 'Technical identifier item (cth: bread, water_bottle)',
    `count` INT UNSIGNED NOT NULL DEFAULT 1 COMMENT 'Jumlah item di dalam slot',
    `metadata` LONGTEXT DEFAULT NULL COMMENT 'JSON metadata (seri, durability, nomor kartu, info buff)',
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_container_slot` (`owner_identifier`, `container_type`, `slot`),
    INDEX `idx_owner_container` (`owner_identifier`, `container_type`),
    INDEX `idx_item_name` (`item_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 2. Tabel Kendaraan Pribadi (Garasi & Parkir)
CREATE TABLE IF NOT EXISTS `bucu_vehicles` (
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `citizenid` VARCHAR(64) NOT NULL COMMENT 'Identifier pemilik (relasi ke bucu_characters)',
    `plate` VARCHAR(12) NOT NULL COMMENT 'Nomor plat unik kendaraan',
    `vehicle_model` VARCHAR(50) NOT NULL COMMENT 'Model kendaraan (cth: sultan, adder)',
    `hash` INT DEFAULT NULL COMMENT 'Hash model kendaraan',
    `mods` LONGTEXT DEFAULT NULL COMMENT 'JSON modifikasi visual & performa kendaraan',
    `garage` VARCHAR(50) NOT NULL DEFAULT 'legion' COMMENT 'Nama garasi tempat mobil disimpan',
    `state` TINYINT NOT NULL DEFAULT 1 COMMENT '1 = Di garasi, 0 = Di jalan, 2 = Disita (impound)',
    `engine_health` FLOAT NOT NULL DEFAULT 1000.0 COMMENT 'Kondisi mesin (0.0 - 1000.0)',
    `body_health` FLOAT NOT NULL DEFAULT 1000.0 COMMENT 'Kondisi bodi (0.0 - 1000.0)',
    `fuel` INT UNSIGNED NOT NULL DEFAULT 100 COMMENT 'Sisa bensin (0 - 100%)',
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_plate` (`plate`),
    INDEX `idx_citizen_vehicles` (`citizenid`),
    INDEX `idx_garage_state` (`garage`, `state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 3. Tabel Mutasi & Audit Perbankan
CREATE TABLE IF NOT EXISTS `bucu_banking_transactions` (
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `citizenid` VARCHAR(64) NOT NULL,
    `target_citizenid` VARCHAR(64) DEFAULT NULL COMMENT 'Penerima jika transaksi transfer',
    `transaction_type` ENUM('deposit', 'withdraw', 'transfer_in', 'transfer_out', 'salary', 'purchase') NOT NULL,
    `amount` BIGINT NOT NULL COMMENT 'Nominal mutasi',
    `balance_after` BIGINT NOT NULL COMMENT 'Saldo rekening setelah transaksi selesai',
    `description` VARCHAR(255) DEFAULT 'Transaksi Bank',
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `idx_citizen_tx` (`citizenid`, `created_at`),
    INDEX `idx_type_amount` (`transaction_type`, `amount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 4. Tabel Status Kebutuhan Fisik (Lapar, Haus & Stres)
CREATE TABLE IF NOT EXISTS `bucu_player_needs` (
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `citizenid` VARCHAR(64) NOT NULL,
    `hunger` FLOAT NOT NULL DEFAULT 100.0 COMMENT 'Tingkat kenyang (0.0 s/d 100.0)',
    `thirst` FLOAT NOT NULL DEFAULT 100.0 COMMENT 'Tingkat hidrasi (0.0 s/d 100.0)',
    `stress` FLOAT NOT NULL DEFAULT 0.0 COMMENT 'Tingkat stres (0.0 s/d 100.0)',
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_citizen_needs` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 5. Tabel Kustomisasi Penampilan Karakter (Skins & Wardrobe)
CREATE TABLE IF NOT EXISTS `bucu_player_skins` (
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `citizenid` VARCHAR(64) NOT NULL,
    `model` VARCHAR(50) NOT NULL DEFAULT 'mp_m_freemode_01',
    `skin_data` LONGTEXT NOT NULL COMMENT 'JSON face features, overlays, pakaian, props',
    `outfits` LONGTEXT DEFAULT NULL COMMENT 'JSON array setelan pakaian lemari wardrobe',
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_citizen_skin` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 6. Tabel Kunci Kendaraan (Shared Keys)
CREATE TABLE IF NOT EXISTS `bucu_vehicle_keys` (
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `plate` VARCHAR(12) NOT NULL,
    `citizenid` VARCHAR(64) NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_plate_citizen` (`plate`, `citizenid`),
    INDEX `idx_citizen_keys` (`citizenid`),
    INDEX `idx_plate_keys` (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 7. Tabel Titik Lokasi Dunia Visual (/bucu World Builder)
CREATE TABLE IF NOT EXISTS `bucu_world_locations` (
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `location_type` ENUM('atm', 'shop', 'garage', 'stash', 'hospital', 'job') NOT NULL,
    `name` VARCHAR(100) NOT NULL COMMENT 'Nama label lokasi (misal: ATM Pasar Baru, 24/7 Grove St)',
    `coords` LONGTEXT NOT NULL COMMENT 'JSON vector4(x, y, z, h)',
    `metadata` LONGTEXT DEFAULT NULL COMMENT 'JSON opsi spesifik (katalog toko, tipe stash)',
    `created_by` VARCHAR(64) DEFAULT 'system',
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `idx_location_type` (`location_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
