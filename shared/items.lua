-- ============================================================================
-- BUCU Scripts Ecosystem — Master Bilingual Items Catalogue
-- Supports: English (en) & Indonesian (id)
-- ============================================================================

BucuItems = BucuItems or {}

BucuItems.List = {
    -- ------------------------------------------------------------------------
    -- MAKANAN & MINUMAN (FOOD & DRINKS)
    -- ------------------------------------------------------------------------
    ['bread'] = {
        name = 'bread',
        label = { en = 'Bread', id = 'Roti' },
        description = { en = 'A loaf of fresh bakery bread to satisfy your hunger.', id = 'Sebongkah roti segar yang lezat untuk mengganjal rasa lapar.' },
        weight = 200,
        type = 'food',
        unique = false,
        usable = true,
        shouldClose = true,
        sound = 'rustle',
        hunger = 25.0,
        image = 'bread.png'
    },
    ['sandwich'] = {
        name = 'sandwich',
        label = { en = 'Club Sandwich', id = 'Roti Lapis (Sandwich)' },
        description = { en = 'A toasted sandwich filled with ham, egg, and fresh cheese.', id = 'Roti lapis panggang dengan isian daging, telur, dan keju gurih.' },
        weight = 250,
        type = 'food',
        unique = false,
        usable = true,
        shouldClose = true,
        sound = 'rustle',
        hunger = 35.0,
        image = 'sandwich.png'
    },
    ['steak'] = {
        name = 'steak',
        label = { en = 'Grilled Ribeye Steak', id = 'Steak Daging Panggang' },
        description = { en = 'Premium restaurant-grade steak. Fills your belly and slowly regenerates health.', id = 'Steak daging sapi premium. Mengenyangkan dan memulihkan HP secara perlahan.' },
        weight = 450,
        type = 'food',
        unique = false,
        usable = true,
        shouldClose = true,
        sound = 'rustle',
        hunger = 50.0,
        buff = {
            type = 'health_regen',
            duration = 60, -- 60 detik
            healPerSecond = 1 -- +1 HP / detik
        },
        image = 'steak.png'
    },
    ['water_bottle'] = {
        name = 'water_bottle',
        label = { en = 'Mineral Water Bottle', id = 'Botol Air Mineral' },
        description = { en = 'Clean and pure 500ml mineral water to quench your thirst.', id = 'Air mineral murni 500ml untuk menyegarkan tenggorokan yang haus.' },
        weight = 500,
        type = 'drink',
        unique = false,
        usable = true,
        shouldClose = true,
        sound = 'clink_glass',
        thirst = 35.0,
        image = 'water_bottle.png'
    },
    ['coffee'] = {
        name = 'coffee',
        label = { en = 'Hot Espresso Coffee', id = 'Kopi Espresso Panas' },
        description = { en = 'Hot aromatic coffee that restores thirst and grants a sprint stamina boost.', id = 'Kopi panas beraroma sedap yang menambah stamina lari selama 3 menit.' },
        weight = 250,
        type = 'drink',
        unique = false,
        usable = true,
        shouldClose = true,
        sound = 'clink_glass',
        thirst = 20.0,
        buff = {
            type = 'stamina_boost',
            duration = 180, -- 3 menit
            speedMultiplier = 1.1 -- +10% kecepatan
        },
        image = 'coffee.png'
    },
    ['energy_drink'] = {
        name = 'energy_drink',
        label = { en = 'Adrenaline Energy Drink', id = 'Minuman Energi Adrenalin' },
        description = { en = 'Caffeinated taurine booster that instantly replenishes 100% sprint stamina.', id = 'Minuman penambah energi yang seketika mengisi penuh stamina lari 100%.' },
        weight = 350,
        type = 'drink',
        unique = false,
        usable = true,
        shouldClose = true,
        sound = 'clink_glass',
        thirst = 25.0,
        buff = {
            type = 'instant_stamina',
            amount = 100
        },
        image = 'energy_drink.png'
    },
    ['beer'] = {
        name = 'beer',
        label = { en = 'Bottle of Beer', id = 'Bir Dingin' },
        description = { en = 'Cold alcoholic brew for unwinding with friends at the tavern.', id = 'Minuman bir beralkohol dingin untuk bersantai bersama teman di bar.' },
        weight = 400,
        type = 'drink',
        unique = false,
        usable = true,
        shouldClose = true,
        sound = 'clink_glass',
        thirst = 15.0,
        image = 'beer.png'
    },

    -- ------------------------------------------------------------------------
    -- PERLENGKAPAN MEDIS (MEDICAL SUPPLIES)
    -- ------------------------------------------------------------------------
    ['bandage'] = {
        name = 'bandage',
        label = { en = 'Sterile Bandage', id = 'Perban Steril' },
        description = { en = 'Stops bleeding wounds and restores a small amount of health.', id = 'Membalut luka robek, menghentikan pendarahan, dan memulihkan sedikit darah.' },
        weight = 100,
        type = 'item',
        unique = false,
        usable = true,
        shouldClose = true,
        sound = 'rustle',
        heal = 15,
        image = 'bandage.png'
    },
    ['medkit'] = {
        name = 'medkit',
        label = { en = 'First Aid Medkit', id = 'Kotak P3K Lengkap' },
        description = { en = 'Full emergency first aid kit with antiseptic and trauma gauze.', id = 'Kotak pertolongan pertama darurat lengkap dengan antiseptik dan kain kasa.' },
        weight = 800,
        type = 'item',
        unique = false,
        usable = true,
        shouldClose = true,
        sound = 'zip',
        heal = 50,
        image = 'medkit.png'
    },
    ['painkiller'] = {
        name = 'painkiller',
        label = { en = 'Trauma Painkillers', id = 'Obat Pereda Nyeri' },
        description = { en = 'Rapid pain relief pills that immediately eliminate blurry injured screen effects.', id = 'Obat pereda nyeri cepat yang menghilangkan efek layar buram saat terluka.' },
        weight = 50,
        type = 'item',
        unique = false,
        usable = true,
        shouldClose = true,
        sound = 'rustle',
        buff = {
            type = 'pain_relief',
            duration = 120 -- 2 menit
        },
        image = 'painkiller.png'
    },

    -- ------------------------------------------------------------------------
    -- DOKUMEN & KARTU IDENTITAS FISIK (PHYSICAL CARDS)
    -- ------------------------------------------------------------------------
    ['id_card'] = {
        name = 'id_card',
        label = { en = 'Citizen ID Card', id = 'KTP Warga San Andreas' },
        description = { en = 'Official government plastic card containing your photo and citizenship details.', id = 'Kartu identitas resmi kependudukan yang memuat nama, tanggal lahir, dan foto warga.' },
        weight = 20,
        type = 'card',
        unique = true,
        usable = true,
        shouldClose = false,
        sound = 'card',
        image = 'id_card.png'
    },
    ['driver_license'] = {
        name = 'driver_license',
        label = { en = 'State Driver License', id = 'SIM Mengemudi Kendaraan' },
        description = { en = 'Legal state certification permitting the operation of motor vehicles.', id = 'Surat izin resmi yang mengesahkan hak mengemudikan kendaraan di jalan raya.' },
        weight = 20,
        type = 'card',
        unique = true,
        usable = true,
        shouldClose = false,
        sound = 'card',
        image = 'driver_license.png'
    },
    ['weapon_license'] = {
        name = 'weapon_license',
        label = { en = 'Concealed Weapon License', id = 'Surat Izin Kepemilikan Senjata' },
        description = { en = 'Police department permit certifying legal carry of self-defense firearms.', id = 'Surat izin kepolisian yang mengesahkan hak membawa senjata bela diri secara legal.' },
        weight = 20,
        type = 'card',
        unique = true,
        usable = true,
        shouldClose = false,
        sound = 'card',
        image = 'weapon_license.png'
    },

    -- ------------------------------------------------------------------------
    -- ALAT BANTU & UTILITAS (TOOLS & UTILITIES)
    -- ------------------------------------------------------------------------
    ['phone'] = {
        name = 'phone',
        label = { en = 'Smartphone', id = 'Ponsel Pintar (HP)' },
        description = { en = 'Modern smartphone for calls, text messaging, and GPS navigation.', id = 'Ponsel pintar untuk telepon, SMS warga, dan penunjuk arah peta GPS.' },
        weight = 250,
        type = 'tool',
        unique = true,
        usable = true,
        shouldClose = true,
        sound = 'rustle',
        image = 'phone.png'
    },
    ['lockpick'] = {
        name = 'lockpick',
        label = { en = 'Lockpick Set', id = 'Set Kunci Pembobol (Lockpick)' },
        description = { en = 'A set of slender steel picks used to bypass vehicle and door lock cylinders.', id = 'Batang kawat baja presisi untuk membongkar silinder kunci mobil atau pintu.' },
        weight = 150,
        type = 'tool',
        unique = false,
        usable = true,
        shouldClose = true,
        sound = 'clink_metal',
        image = 'lockpick.png'
    },
    ['repair_kit'] = {
        name = 'repair_kit',
        label = { en = 'Roadside Repair Kit', id = 'Kotak Perkakas Bengkel' },
        description = { en = 'Wrenches, jacks, and spare hoses to repair a smoking vehicle engine.', id = 'Kunci pas dan perlengkapan darurat untuk memperbaiki mesin mobil yang mogok.' },
        weight = 2500,
        type = 'tool',
        unique = false,
        usable = true,
        shouldClose = true,
        sound = 'clink_metal',
        image = 'repair_kit.png'
    },
    ['jerry_can'] = {
        name = 'jerry_can',
        label = { en = 'Emergency Fuel Jerry Can', id = 'Jerigen Bensin Darurat (20L)' },
        description = { en = 'Heavy plastic tank containing 20 liters of emergency gasoline.', id = 'Wadah jerigen plastik berisi 20 liter bensin darurat untuk mengisi mobil mogok.' },
        weight = 4000,
        type = 'tool',
        unique = false,
        usable = true,
        shouldClose = true,
        sound = 'clink_glass',
        fuelAmount = 25, -- Mengisi +25% bensin
        image = 'jerry_can.png'
    },
    ['radio'] = {
        name = 'radio',
        label = { en = 'Two-Way Radio', id = 'Radio Komunikasi (Walkie-Talkie)' },
        description = { en = 'Handheld walkie-talkie for shortwave team frequencies and communication.', id = 'Perangkat radio genggam untuk koordinasi saluran frekuensi suara tim.' },
        weight = 400,
        type = 'tool',
        unique = false,
        usable = true,
        shouldClose = true,
        sound = 'clink_metal',
        image = 'radio.png'
    },

    -- ------------------------------------------------------------------------
    -- SENJATA & AMUNISI AWAL (STARTER WEAPONS & AMMO)
    -- ------------------------------------------------------------------------
    ['weapon_pistol'] = {
        name = 'weapon_pistol',
        label = { en = 'Standard 9mm Pistol', id = 'Pistol 9mm Standar' },
        description = { en = 'Semi-automatic handgun chambered in 9x19mm with serial number stamping.', id = 'Senjata genggam semi-otomatis kaliber 9mm dengan cap nomor seri pabrik.' },
        weight = 1200,
        type = 'weapon',
        unique = true,
        usable = true,
        shouldClose = true,
        sound = 'clink_metal',
        image = 'weapon_pistol.png'
    },
    ['ammo_pistol'] = {
        name = 'ammo_pistol',
        label = { en = 'Box of 9mm Ammunition', id = 'Kotak Peluru 9mm (x24)' },
        description = { en = 'Factory-sealed carton containing 24 rounds of 9mm hollow point ammunition.', id = 'Kotak amunisi tersegel berisi 24 butir peluru tajam 9mm.' },
        weight = 300,
        type = 'ammo',
        unique = false,
        usable = true,
        shouldClose = true,
        sound = 'clink_metal',
        image = 'ammo_pistol.png'
    },

    -- ------------------------------------------------------------------------
    -- PEKERJAAN & MATERIAL (JOBS & RESOURCES)
    -- ------------------------------------------------------------------------
    ['postal_package'] = {
        name = 'postal_package',
        label = { en = 'Go-Postal Delivery Box', id = 'Paket Kiriman Go-Postal' },
        description = { en = 'Sealed postal parcel with delivery barcode destined for a citizen address.', id = 'Kardus paket pengiriman bersegel barcode untuk diantar ke alamat warga.' },
        weight = 1500,
        type = 'item',
        unique = true,
        usable = false,
        shouldClose = false,
        sound = 'rustle',
        image = 'postal_package.png'
    },
    ['trash_bag'] = {
        name = 'trash_bag',
        label = { en = 'Sanitation Waste Bag', id = 'Kantong Sampah Kota' },
        description = { en = 'Collected city refuse bag to be loaded onto the municipal compactor truck.', id = 'Kantong sampah hitam hasil kutipan jalan untuk dimuat ke truk pemadat sampah.' },
        weight = 2000,
        type = 'item',
        unique = false,
        usable = false,
        shouldClose = false,
        sound = 'rustle',
        image = 'trash_bag.png'
    },
    ['metal_scrap'] = {
        name = 'metal_scrap',
        label = { en = 'Scrap Metal', id = 'Potongan Besi Tua' },
        description = { en = 'Salvaged automotive sheet metal and rebar useful for vehicle repairs.', id = 'Lempengan besi tua daur ulang yang berguna untuk perbaikan bodi mobil.' },
        weight = 500,
        type = 'item',
        unique = false,
        usable = false,
        shouldClose = false,
        sound = 'clink_metal',
        image = 'metal_scrap.png'
    },
    ['plastic'] = {
        name = 'plastic',
        label = { en = 'Polymer Plastic Scrap', id = 'Biji Plastik Polimer' },
        description = { en = 'Recycled raw plastic granules used in manufacturing consumer goods.', id = 'Biji plastik olahan yang digunakan sebagai bahan baku cetak industri.' },
        weight = 250,
        type = 'item',
        unique = false,
        usable = false,
        shouldClose = false,
        sound = 'rustle',
        image = 'plastic.png'
    },
    ['gold_bar'] = {
        name = 'gold_bar',
        label = { en = 'Certified Gold Bullion', id = 'Batangan Emas Murni 24K' },
        description = { en = 'Certified 99.9% pure gold bullion bar stamped by the Los Santos Mint.', id = 'Batangan emas murni 24 karat berstempel resmi Percetakan Uang Los Santos.' },
        weight = 1000,
        type = 'item',
        unique = true,
        usable = false,
        shouldClose = false,
        sound = 'clink_metal',
        image = 'gold_bar.png'
    }
}

-- Helper function: Mengambil data item berdasarkan nama teknis
function BucuItems.Get(itemName)
    if not itemName or type(itemName) ~= 'string' then
        return nil
    end
    return BucuItems.List[string.lower(itemName)]
end

-- Helper function: Memeriksa apakah item terdaftar di katalog
function BucuItems.Exists(itemName)
    return BucuItems.Get(itemName) ~= nil
end

-- Helper function: Mengambil label terjemahan item sesuai bahasa aktif
function BucuItems.GetLabel(itemName, lang)
    local item = BucuItems.Get(itemName)
    if not item then return itemName end
    local targetLang = lang or (Config and Config.Language) or 'en'
    if type(item.label) == 'table' then
        return item.label[targetLang] or item.label['en'] or itemName
    end
    return item.label or itemName
end

-- Helper function: Mengambil deskripsi terjemahan item sesuai bahasa aktif
function BucuItems.GetDescription(itemName, lang)
    local item = BucuItems.Get(itemName)
    if not item then return '' end
    local targetLang = lang or (Config and Config.Language) or 'en'
    if type(item.description) == 'table' then
        return item.description[targetLang] or item.description['en'] or ''
    end
    return item.description or ''
end
