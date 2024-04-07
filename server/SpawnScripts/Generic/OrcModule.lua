--[[
    Script Name    : SpawnScripts/Generic/OrcModule.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.05 03:01:35
    Script Purpose : 
                   : 
--]]

function OrcModule(NPC, Spawn, FactionID, ArmorType, ArmorRarity)
    armor = ArmorType
    rarity = ArmorRarity
    faction = FactionID
    class = GetClass(NPC)
    
    SpawnSet(NPC,"model_type",137)
    SpawnSet(NPC, "race", 19)
    OrcFaction(NPC, Spawn)
    OrcArmor(NPC, Spawn)
    OrcWeapons(NPC, Spawn)
end

function OrcFaction(NPC, Spawn)
    SpawnSet(NPC, "faction", faction)
    if faction == 0 or Faction == 1 then
        Generic(NPC)
    elseif faction == 119 then
        Deathfist(NPC)
    elseif faction == 120 then
        Bloodskull(NPC)
    elseif faction == 367 then
        Brokentusk(NPC)
    elseif faction == 366 then
        Lonetusk(NPC)
    elseif faction == 121 then
        Ree(NPC)
    end
        
end
    
function Deathfist(NPC, Spawn)

end

function Bloodskull(NPC, Spawn)

end

function Brokentusk(NPC, Spawn)
    SpawnSet(NPC, "skin_color", "110 75 75")
    SpawnSet(NPC, "eye_color", "98 63 28")
end

function Lonetusk(NPC, Spawn)
    SpawnSet(NPC, "skin_color", "92 52 52")
    SpawnSet(NPC, "eye_color", "98 63 28")
end

function Ree(NPC, Spawn)

end

function Generic(NPC, Spawn)
    SpawnSet(NPC, "skin_color", "75 100 75")
    SpawnSet(NPC, "eye_color", "98 63 28")

end

function OrcArmor(NPC, Spawn)
    
    if armor == 1 then
        VeryLightArmor(NPC, Spawn)
    elseif armor == 2 then
        LightArmor(NPC, Spawn)
    elseif armor == 3 then
        MediumArmor(NPC, Spawn)
    elseif armor == 4 then
        HeavyArmor(NPC, Spawn)
    else
        LightArmor(NPC, Spawn)
    end
end

function VeryLightArmor(NPC, Spawn)
    
end

function LightArmor(NPC, Spawn)
    --if rarity == 1 then
    Mismatched(NPC, Spawn)
    --end
    
end

function MediumArmor(NPC, Spawn)
    
end

function HeavyArmor(NPC, Spawn)

end

function OrcWeapons(NPC, Spawn)
    if class >= 1 and class <= 4 then
        FighterWeapons(NPC)
    elseif class >= 5 and class <=7 then
        BrawlerWeapons(NPC)
    elseif class >= 8 and class <= 10 then
        FighterWeapons(NPC)
    elseif class >= 11 and class <= 20 then
        PriestWeapons(NPC)
    elseif class >= 21 and class <= 30 then
        MageWeapons(NPC) 
    else
        ScoutWeapons(NPC) 
    end
end

function FighterWeapons(NPC, Spawn)
    local weapon = MakeRandomInt(1,10)
    if weapon == 1 then
        SetEquipment(NPC, Primary, 2228, 255, 255, 255, 255, 255, 255)
    elseif weapon == 2 then
        SetEquipment(NPC, Primary, 2237, 255, 255, 255, 255, 255, 255)
    elseif weapon == 3 then
        SetEquipment(NPC, Primary, 2240, 255, 255, 255, 255, 255, 255)
    elseif weapon == 4 then
        SetEquipment(NPC, Primary, 2296, 255, 255, 255, 255, 255, 255)
    elseif weapon == 5 then
        SetEquipment(NPC, Primary, 2319, 255, 255, 255, 255, 255, 255)
    elseif weapon == 6 then
        SetEquipment(NPC, Primary, 2548, 255, 255, 255, 255, 255, 255)
    elseif weapon == 7 then
        SetEquipment(NPC, Primary, 3242, 255, 255, 255, 255, 255, 255)
    elseif weapon == 8 then
        SetEquipment(NPC, Primary, 2282, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, Secondary, 3255, 255, 255, 255, 255, 255, 255)
    elseif weapon == 9 then
        SetEquipment(NPC, Primary, 2409, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, Secondary, 3255, 255, 255, 255, 255, 255, 255)
    elseif weapon == 10 then
        SetEquipment(NPC, Primary, 2240, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, Secondary, 3255, 255, 255, 255, 255, 255, 255)
    end

end

function PriestWeapons(NPC, Spawn)
    local weapon = MakeRandomInt(1,6)
    if weapon == 1 then
        SetEquipment(NPC, Primary, 3292, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, Secondary, 3255, 255, 255, 255, 255, 255, 255)
    elseif weapon == 2 then
        SetEquipment(NPC, Primary, 3843, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, Secondary, 3255, 255, 255, 255, 255, 255, 255)
    elseif weapon == 3 then
        SetEquipment(NPC, Primary, 2324, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, Secondary, 3255, 255, 255, 255, 255, 255, 255)
    elseif weapon == 4 then
        SetEquipment(NPC, Primary, 2287, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, Secondary, 3255, 255, 255, 255, 255, 255, 255)
    elseif weapon == 5 then
        SetEquipment(NPC, Primary, 2516, 255, 255, 255, 255, 255, 255)
    elseif weapon == 6 then
        SetEquipment(NPC, Primary, 2396, 255, 255, 255, 255, 255, 255)
    end
    
end

function MageWeapons(NPC, Spawn)
    local weapon = MakeRandomInt(1,4)
    if weapon == 1 then
        SetEquipment(NPC, Primary, 3642, 255, 255, 255, 255, 255, 255)
    elseif weapon == 2 or weapon == 3 then
        SetEquipment(NPC, Primary, 2426, 255, 255, 255, 255, 255, 255)
    elseif weapon == 4 then
        SetEquipment(NPC, Primary, 3675, 255, 255, 255, 255, 255, 255)
     end
    
end

function ScoutWeapons(NPC, Spawn)
    local weapon = MakeRandomInt(1,3)
    if weapon == 1 then
        SetEquipment(NPC, Primary, 2264, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, Secondary, 2264, 255, 255, 255, 255, 255, 255)
    elseif weapon == 2 then
        SetEquipment(NPC, Primary, 2312, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, Secondary, 2312, 255, 255, 255, 255, 255, 255)
    elseif weapon == 3 then
        SetEquipment(NPC, Primary, 3286, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, Secondary, 3286, 255, 255, 255, 255, 255, 255)
    end
    
end

function BrawlerWeapons(NPC, Spawn)
    local weapon = MakeRandomInt(1,4)
     if weapon == 1 then
        SetEquipment(NPC, Primary, 2536, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, Secondary, 2536, 255, 255, 255, 255, 255, 255)
    elseif weapon == 2 then
        SetEquipment(NPC, Primary, 2534, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, Secondary, 2534, 255, 255, 255, 255, 255, 255)
    elseif weapon == 3 then
        SetEquipment(NPC, Primary, 2274, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, Secondary, 2274, 255, 255, 255, 255, 255, 255)
    elseif weapon == 4 then
        SetEquipment(NPC, Primary, 3290, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, Secondary, 3290, 255, 255, 255, 255, 255, 255)
    end
end

function Mismatched(NPC, Spawn)
    local mismatch = MakeRandomInt(1,6)
    if mismatch == 1 then
        SetEquipment(NPC, Legs, 1084, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, Forearms, 1081, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, Feet, 1080, 255, 255, 255, 255, 255, 255)
    elseif mismatch ==2 then
        SetEquipment(NPC, Legs, 1084, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, Forearms, 1081, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, Feet, 1080, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, Chest, 1079, 255, 255, 255, 255, 255, 255)
    elseif mismatch == 3 then
        SetEquipment(NPC, Legs, 1084, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, Forearms, 1081, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, Feet, 1080, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, Head, 1083, 255, 255, 255, 255, 255, 255)
    elseif mismatch == 4 then
        SetEquipment(NPC, Legs, 1084, 255, 255, 255, 255, 255, 255)
    elseif mismatch == 5 then
        SetEquipment(NPC, Legs, 1084, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, Forearms, 1081, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, Feet, 1080, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, Head, 1083, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, Chest, 1079, 255, 255, 255, 255, 255, 255)
    elseif mismatch == 6 then
        SetEquipment(NPC, Legs, 1084, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, Feet, 1080, 255, 255, 255, 255, 255, 255)
    end
end


