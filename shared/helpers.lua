-- ============================================================================
-- BUCU Scripts Ecosystem — Shared Helpers
-- ============================================================================

BucuSharedHelpers = BucuSharedHelpers or {}

-- Format berat (gram) menjadi string rapi (cth: 350g atau 2.5kg)
function BucuSharedHelpers.FormatWeight(grams)
    if not grams or type(grams) ~= 'number' or grams < 0 then
        return '0g'
    end
    if grams >= 1000 then
        local kg = grams / 1000
        if kg == math.floor(kg) then
            return string.format('%dkg', math.floor(kg))
        else
            return string.format('%.1fkg', kg)
        end
    end
    return string.format('%dg', math.floor(grams))
end

-- Generate Serial Number Acak untuk Senjata (cth: W-74921)
function BucuSharedHelpers.GenerateWeaponSerial()
    local randomPart = math.random(10000, 99999)
    return string.format('W-%d', randomPart)
end

-- Generate Nomor Kartu Kependudukan / Citizen ID
function BucuSharedHelpers.GenerateCitizenNumber()
    local randomPart = math.random(100000, 999999)
    return string.format('BUCU-%d', randomPart)
end

-- Deep clone table untuk mencegah mutasi referensi tidak disengaja
function BucuSharedHelpers.DeepCopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[BucuSharedHelpers.DeepCopy(orig_key)] = BucuSharedHelpers.DeepCopy(orig_value)
        end
        setmetatable(copy, BucuSharedHelpers.DeepCopy(getmetatable(orig)))
    else
        copy = orig
    end
    return copy
end

-- Validasi apakah sebuah string adalah angka bulat positif
function BucuSharedHelpers.IsPositiveInteger(val)
    if type(val) ~= 'number' then return false end
    if val ~= math.floor(val) then return false end
    return val > 0
end
