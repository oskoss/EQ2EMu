--[[
    Script Name    : SpawnScripts/Generic/EquipmentModule.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.08 05:01:52
    Script Purpose : Equipment Appearance Presets for NPCModule
                   : 
--]]

function RandomWeapons(NPC, Spawn)  --randomize weapons based on class
    local class = GetClass(NPC)
    if class >= 1 and class <= 4 then
        RandomFighterWeapons(NPC)
    elseif class >= 5 and class <=7 then
        RandomBrawlerWeapons(NPC)
    elseif class >= 8 and class <= 10 then
        RandomFighterWeapons(NPC)
    elseif class >= 11 and class <= 20 then
        RandomPriestWeapons(NPC)
    elseif class >= 21 and class <= 30 then
        RandomMageWeapons(NPC) 
    elseif class >= 31 and class <= 40 then
        RandomScoutWeapons(NPC)
    else
        RandomFighterWeapons(NPC) 
    end
end

function RandomFighterWeapons(NPC, Spawn)
    local weapon = MakeRandomInt(1,10)
    if weapon == 1 then
        SetEquipment(NPC, 0, 2228, 255, 255, 255, 255, 255, 255)
    elseif weapon == 2 then
        SetEquipment(NPC, 0, 2237, 255, 255, 255, 255, 255, 255)
    elseif weapon == 3 then
        SetEquipment(NPC, 0, 2240, 255, 255, 255, 255, 255, 255)
    elseif weapon == 4 then
        SetEquipment(NPC, 0, 2296, 255, 255, 255, 255, 255, 255)
    elseif weapon == 5 then
        SetEquipment(NPC, 0, 2319, 255, 255, 255, 255, 255, 255)
    elseif weapon == 6 then
        SetEquipment(NPC, 0, 2548, 255, 255, 255, 255, 255, 255)
    elseif weapon == 7 then
        SetEquipment(NPC, 0, 3242, 255, 255, 255, 255, 255, 255)
    elseif weapon == 8 then
        SetEquipment(NPC, 0, 2282, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, 1, 3255, 255, 255, 255, 255, 255, 255)
    elseif weapon == 9 then
        SetEquipment(NPC, 0, 2409, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, 1, 3255, 255, 255, 255, 255, 255, 255)
    elseif weapon == 10 then
        SetEquipment(NPC, 0, 2240, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, 1, 3255, 255, 255, 255, 255, 255, 255)
    end

end

function RandomPriestWeapons(NPC, Spawn)
    local weapon = MakeRandomInt(1,6)
    if weapon == 1 then
        SetEquipment(NPC, 0, 3292, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, 1, 3255, 255, 255, 255, 255, 255, 255)
    elseif weapon == 2 then
        SetEquipment(NPC, 0, 3843, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, 1, 3255, 255, 255, 255, 255, 255, 255)
    elseif weapon == 3 then
        SetEquipment(NPC, 0, 2324, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, 1, 3255, 255, 255, 255, 255, 255, 255)
    elseif weapon == 4 then
        SetEquipment(NPC, 0, 2287, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, 1, 3255, 255, 255, 255, 255, 255, 255)
    elseif weapon == 5 then
        SetEquipment(NPC, 0, 2516, 255, 255, 255, 255, 255, 255)
    elseif weapon == 6 then
        SetEquipment(NPC, 0, 2396, 255, 255, 255, 255, 255, 255)
    end
    
end

function RandomMageWeapons(NPC, Spawn)
    local weapon = MakeRandomInt(1,4)
    if weapon == 1 then
        SetEquipment(NPC, 1, 3642, 255, 255, 255, 255, 255, 255)
    elseif weapon == 2 or weapon == 3 then
        SetEquipment(NPC, 1, 2426, 255, 255, 255, 255, 255, 255)
    elseif weapon == 4 then
        SetEquipment(NPC, 1, 3675, 255, 255, 255, 255, 255, 255)
     end
    
end

function RandomScoutWeapons(NPC, Spawn)
    local weapon = MakeRandomInt(1,3)
    if weapon == 1 then
        SetEquipment(NPC, 0, 2264, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, 1, 2264, 255, 255, 255, 255, 255, 255)
    elseif weapon == 2 then
        SetEquipment(NPC, 0, 2312, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, 1, 2312, 255, 255, 255, 255, 255, 255)
    elseif weapon == 3 then
        SetEquipment(NPC, 0, 3286, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, 1, 3286, 255, 255, 255, 255, 255, 255)
    end
    
end

function RandomBrawlerWeapons(NPC, Spawn)
    local weapon = MakeRandomInt(1,4)
     if weapon == 1 then
        SetEquipment(NPC, 0, 2536, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, 1, 2536, 255, 255, 255, 255, 255, 255)
    elseif weapon == 2 then
        SetEquipment(NPC, 0, 2534, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, 1, 2534, 255, 255, 255, 255, 255, 255)
    elseif weapon == 3 then
        SetEquipment(NPC, 0, 2274, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, 1, 2274, 255, 255, 255, 255, 255, 255)
    elseif weapon == 4 then
        SetEquipment(NPC, 0, 3290, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, 1, 3290, 255, 255, 255, 255, 255, 255)
    end
end

function OrcArmorCommon(NPC, Spawn)
    RandomWeapons(NPC)
    local mismatch = MakeRandomInt(1,5)
    if mismatch == 1 then
        SetEquipment(NPC, 7, 1084, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, 5, 1081, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, 8, 1080, 255, 255, 255, 255, 255, 255)
    elseif mismatch ==2 then
        SetEquipment(NPC, 7, 1084, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, 5, 1081, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, 8, 1080, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, 3, 1079, 255, 255, 255, 255, 255, 255)
    elseif mismatch == 3 then
        SetEquipment(NPC, 7, 1084, 255, 255, 255, 255, 255, 255)
    elseif mismatch == 4 then
        SetEquipment(NPC, 7, 1084, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, 5, 1081, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, 8, 1080, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, 2, 1083, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, 3, 1079, 255, 255, 255, 255, 255, 255)
    elseif mismatch == 5 then
        SetEquipment(NPC, 7, 1084, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, 8, 1080, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, 3, 1079, 255, 255, 255, 255, 255, 255)
    end
end

function GhostOrcArmorCommon(NPC, Spawn)
    local mismatch = MakeRandomInt(1,5)
    if mismatch == 1 then
        SetEquipment(NPC, 7, 3747, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, 5, 3744, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, 8, 3743, 255, 255, 255, 255, 255, 255)
    elseif mismatch ==2 then
        SetEquipment(NPC, 7, 3747, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, 5, 3744, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, 8, 3743, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, 3, 3742, 255, 255, 255, 255, 255, 255)
    elseif mismatch == 3 then
        SetEquipment(NPC, 7, 3747, 255, 255, 255, 255, 255, 255)
    elseif mismatch == 4 then
        SetEquipment(NPC, 7, 3747, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, 5, 3744, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, 8, 3743, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, 2, 3746, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, 3, 3742, 255, 255, 255, 255, 255, 255)
    elseif mismatch == 5 then
        SetEquipment(NPC, 7, 3747, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, 8, 3743, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, 3, 3742, 255, 255, 255, 255, 255, 255)
    end
end

function FreeportGuard(NPC, Spawn)
    SetEquipment(NPC, 0, 2261, 255, 255, 255, 255, 255, 255)
    SetEquipment(NPC, 2, 932, 255, 255, 255, 255, 255, 255)
    SetEquipment(NPC, 3, 928, 255, 255, 255, 255, 255, 255)
    SetEquipment(NPC, 4, 934, 255, 255, 255, 255, 255, 255)
    SetEquipment(NPC, 5, 930, 255, 255, 255, 255, 255, 255)
    SetEquipment(NPC, 6, 931, 255, 255, 255, 255, 255, 255)
    SetEquipment(NPC, 7, 933, 255, 255, 255, 255, 255, 255)
    SetEquipment(NPC, 8, 929, 255, 255, 255, 255, 255, 255)
end

function QeynosGuard(NPC, Spawn)
    SetEquipment(NPC, 0, 3245, 255, 255, 255, 255, 255, 255)
    SetEquipment(NPC, 2, 713, 255, 255, 255, 255, 255, 255)
    SetEquipment(NPC, 3, 709, 255, 255, 255, 255, 255, 255)
    SetEquipment(NPC, 4, 715, 255, 255, 255, 255, 255, 255)
    SetEquipment(NPC, 5, 711, 255, 255, 255, 255, 255, 255)
    SetEquipment(NPC, 6, 712, 255, 255, 255, 255, 255, 255)
    SetEquipment(NPC, 7, 714, 255, 255, 255, 255, 255, 255)
    SetEquipment(NPC, 8, 710, 255, 255, 255, 255, 255, 255)
end

function OrcChainCommon(NPC, Spawn)
    SetEquipment(NPC, 3, 875, 50, 50, 50, 50, 50, 50)
    SetEquipment(NPC, 5, 877, 50, 50, 50, 50, 50, 50)
    SetEquipment(NPC, 7, 880, 50, 50, 50, 50, 50, 50)
    SetEquipment(NPC, 8, 876, 50, 50, 50, 50, 50, 50)
end

function TradesmanLow(NPC, Spawn)
    local gender = GetGender(NPC)
    if gender == 1 then
        SetEquipment(NPC, 3, 1873, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, 7, 1874, 255, 255, 255, 255, 255, 255)
    elseif gender == 2 then
        SetEquipment(NPC, 3, 2507, 255, 255, 255, 255, 255, 255)
        SetEquipment(NPC, 7, 2508, 255, 255, 255, 255, 255, 255)
    end 
    SetEquipment(NPC, 8, 1000, 255, 255, 255, 255, 255, 255)
end

function Beggar(NPC, Spawn)
    SetEquipment(NPC, 3, 5529, 255, 255, 255, 255, 255, 255)
    SetEquipment(NPC, 7, 5530, 255, 255, 255, 255, 255, 255)
end

function DervishChain(NPC, Spawn)
    RandomWeapons(NPC)
    SetEquipment(NPC, 3, 867, 255, 255, 255, 255, 255, 255)
    SetEquipment(NPC, 5, 869, 255, 255, 255, 255, 255, 255)
    SetEquipment(NPC, 6, 870, 255, 255, 255, 255, 255, 255)
    SetEquipment(NPC, 7, 872, 255, 255, 255, 255, 255, 255)
    SetEquipment(NPC, 8, 868, 255, 255, 255, 255, 255, 255)
end

function DervishLeather(NPC, Spawn)
    RandomWeapons(NPC)
    SetEquipment(NPC, 3, 1079, 255, 255, 255, 255, 255, 255)
    SetEquipment(NPC, 5, 1081, 255, 255, 255, 255, 255, 255)
    SetEquipment(NPC, 6, 1082, 255, 255, 255, 255, 255, 255)
    SetEquipment(NPC, 7, 1084, 255, 255, 255, 255, 255, 255)
    SetEquipment(NPC, 8, 1080, 255, 255, 255, 255, 255, 255)
end

function DervishRobe(NPC, Spawn)
    RandomWeapons(NPC)
    SetEquipment(NPC, 3, 782, 255, 255, 255, 255, 255, 255)
    SetEquipment(NPC, 2, 791, 255, 255, 255, 255, 255, 255)
    SetEquipment(NPC, 6,424, 255, 255, 255, 255, 255, 255)
    SetEquipment(NPC, 7, 790, 255, 255, 255, 255, 255, 255)
    SetEquipment(NPC, 8, 470, 255, 255, 255, 255, 255, 255)
end

function DervishThug(NPC, Spawn)
    RandomWeapons(NPC)
    SetEquipment(NPC, 3, 859, 255, 255, 255, 255, 255, 255)
    SetEquipment(NPC, 5, 861, 255, 255, 255, 255, 255, 255)
    SetEquipment(NPC, 6, 862, 255, 255, 255, 255, 255, 255)
    SetEquipment(NPC, 7, 864, 255, 255, 255, 255, 255, 255)
    SetEquipment(NPC, 8, 860, 255, 255, 255, 255, 255, 255)
end
