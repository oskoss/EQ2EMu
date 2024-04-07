--[[
    Script Name    : SpawnScripts/Generic/NPCModule.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.11.20 08:11:41
    Script Purpose : NPC Statistics Control Script- In Development
                   : Supersedes CombatModule.lua
--]]
require "SpawnScripts/Generic/EquipmentModule"

GlobalDmgMod = 1.0      -- Global Damage Multiplier- make global adjustments to all NPC autoattack damage.
GlobalStatMod = 1.0     -- Global Attribute Multiplier- make global adjustments to NPC attribute scores.
GlobalHPMod  =  1.0     -- Global Hit Point Multiplier
GlobalPowerMod = 1.0    -- Global Power Pool Multiplier 

function NPCModule(NPC, Spawn) 
    level = GetLevel(NPC)           -- NPC Level
    difficulty = GetDifficulty(NPC) -- NPC Difficulty 
    MeleeDmgMod = GetStr(NPC) / 10  -- Determines strength bonus to auttoattack damage.
    
    --Included functions.  Comment out a function to disable.
    Attributes(NPC, Spawn)     -- Determines basic stats of the NPC(str, agi, sta, int, wis)
    AutoAttack(NPC, Spawn)    -- Determines the NPC's tier for the purposes of autoattack damage.
    Regen(NPC, Spawn)          -- Sets NPC's health and/or power regeneration rates or disables regeneration entirely.
    HealthPower(NPC, Spawn)    -- Calculates NPC's based on level and difficulty.
    --Heroic(NPC, Spawn)         -- Detects if an NPC should be flagged as heroic and sets the heroic flag accordingly.
    AddTimer(NPC, 25, "Heroic")
    AddTimer(NPC, 1000, "Heroic") -- Redundant heroic check to compensate for server lag when using developer commands to reload spawns.
    
end

--Determine damage function based on NPC level.
function AutoAttack(NPC, Spawn)
    if  level  <= 3 then
        TierOneA(NPC)
    elseif level >= 4 and level  <= 5 then
        TierOneB(NPC)
    elseif level >= 6 and level  <= 9 then
        TierOneC(NPC)
    elseif level >= 10 and level <= 15 then
        TierTwoA(NPC)
    elseif level >= 16 and level <= 19 then
        TierTwoB(NPC)
    elseif level >= 20 and level <= 24 then
        TierThreeA(NPC)
    elseif level >= 25 and level  <= 29 then
        TierThreeB(NPC)
    end
end

-- Set attributes based on NPC level and difficulty
function Attributes(NPC, Spawn)
    -- Calculate attributes
    if  level <= 4 then
        baseStat = 19 else
            baseStat = level + 15
    end
    
    local low = baseStat - 15   -- Difficulty 1-3 vvv
    local four = baseStat - 10  -- Difficulty 4 vv
    local five = baseStat - 5   -- Difficulty 5 v
    local seven = baseStat + 10 -- Difficulty 7 ^
    local eight = baseStat + 15 -- Difficulty 8 ^^
    local nine = baseStat + 20  -- Difficulty 9 ^^^
    
    lowStat = math.floor(low * GlobalStatMod)
    fourStat = math.floor(four * GlobalStatMod)
    fiveStat = math.floor(five * GlobalStatMod)
    sixStat = math.floor(baseStat * GlobalStatMod)
    sevenStat = math.floor(seven * GlobalStatMod)
    eightStat = math.floor(eight * GlobalStatMod)
    nineStat = math.floor(nine * GlobalStatMod)
    
    -- Determine attribute by difficulty
    if difficulty <= 3 then
        finalStat = lowStat
    elseif difficulty == 4 then
        finalStat = fourStat
    elseif difficulty == 5 then
        finalStat = fiveStat
    elseif difficulty == 6 then
        finalStat = sixStat
    elseif difficulty == 7 then
        finalStat = sevenStat
    elseif difficulty == 8 then
        finalStat = eightStat
    elseif difficulty == 9 then
        finalStat = nineStat
    end
 
    SetInfoStructFloat(NPC, "str", finalStat)
    SetStrBase(NPC, finalStat)
    SetInfoStructFloat(NPC, "agi", finalStat)
    SetAgiBase(NPC, finalStat)
    SetInfoStructFloat(NPC, "sta", finalStat)
    SetStaBase(NPC, finalStat)
    SetInfoStructFloat(NPC, "intel", finalStat)
    SetIntBase(NPC, finalStat)
    SetInfoStructFloat(NPC, "wis", finalStat)
    SetWisBase(NPC, finalStat)
  
end

--Health and power regeneration rates
function Regen(NPC, Spawn)
    
    -- In-combat health regeneration
    SetInfoStructUInt(NPC, "hp_regen_override", 1)  -- Set to  0 to disable and allow the server to set the regen rate.
    SetInfoStructSInt(NPC, "hp_regen", 0)           -- Set Regen Amount. Default 0
    
    -- In-combat power regeneration
    SetInfoStructUInt(NPC, "pw_regen_override", 1)  -- Set to  0 to disable and allow the server to set the regen rate.
    SetInfoStructSInt(NPC, "pw_regen", 0)           -- Set Regen Amount. Default 0
    
end

--Damage functions based on NPC level range.
--Level 1-3
function TierOneA(NPC, Spawn)
    lowDmg = math.floor(0 * GlobalDmgMod + MeleeDmgMod)
    highDmg = math.floor(2 * GlobalDmgMod + MeleeDmgMod)
    damage(NPC)
end

--Level 4-5
function TierOneB(NPC, Spawn)
    if difficulty <=4 then -- 
        lowDmg = math.floor(1 * GlobalDmgMod + MeleeDmgMod)
        highDmg =math.floor(2 * GlobalDmgMod + MeleeDmgMod)
    elseif difficulty == 5 then 
        lowDmg = math.floor(1 * GlobalDmgMod + MeleeDmgMod)
        highDmg = math.floor(3 * GlobalDmgMod + MeleeDmgMod)
    elseif difficulty >=6 and difficulty <=9 then 
        lowDmg = math.floor(2 * GlobalDmgMod + MeleeDmgMod)
        highDmg = math.floor(4 * GlobalDmgMod + MeleeDmgMod)
    end
    damage(NPC)
end

--Level 6-9
function TierOneC(NPC, Spawn)
    if difficulty <=4 then  -- 1-3 dif 1-4
        lowDmg = math.floor(1 * GlobalDmgMod + MeleeDmgMod) 
        highDmg =math.floor(3 * GlobalDmgMod + MeleeDmgMod)
    elseif difficulty == 5 then -- 2-4 dif 5MeleeDmgMod
        lowDmg = math.floor(2 * GlobalDmgMod + MeleeDmgMod) 
        highDmg = math.floor(4 * GlobalDmgMod + MeleeDmgMod)
    elseif difficulty ==6 then -- 2-7 damage- Dif 6
        lowDmg = math.floor(2 * GlobalDmgMod + MeleeDmgMod)
        highDmg = math.floor(7 * GlobalDmgMod + MeleeDmgMod)
    elseif difficulty >=7 then -- 2-7 damage- Dif 7+
        lowDmg = math.floor(5 * GlobalDmgMod + MeleeDmgMod)
        highDmg = math.floor(10 * GlobalDmgMod + MeleeDmgMod)
    end
    damage(NPC)
end

--Level 10-15
function TierTwoA(NPC, Spawn)
    if difficulty <=4 then 
        lowDmg = math.floor(2 * GlobalDmgMod + MeleeDmgMod) 
        highDmg =math.floor(4 * GlobalDmgMod + MeleeDmgMod)
    elseif difficulty == 5 then 
        lowDmg = math.floor(2 * GlobalDmgMod + MeleeDmgMod) 
        highDmg = math.floor(7 * GlobalDmgMod + MeleeDmgMod)
    elseif difficulty ==6 then 
        lowDmg = math.floor(6 * GlobalDmgMod + MeleeDmgMod)
        highDmg = math.floor(15 * GlobalDmgMod + MeleeDmgMod)
    elseif difficulty == 7 then
        lowDmg = math.floor(8 * GlobalDmgMod + MeleeDmgMod)
        highDmg = math.floor(17 * GlobalDmgMod + MeleeDmgMod)
    elseif difficulty >= 8 then
        lowDmg = math.floor(12 * GlobalDmgMod + MeleeDmgMod)
        highDmg = math.floor(24 * GlobalDmgMod + MeleeDmgMod)
    end
    damage(NPC)
end

--Level 16-19
function TierTwoB(NPC, Spawn)
    if difficulty <=4 then 
        lowDmg = math.floor(2 * GlobalDmgMod + MeleeDmgMod) 
        highDmg =math.floor(7 * GlobalDmgMod + MeleeDmgMod)
    elseif difficulty == 5 then 
        lowDmg = math.floor(6 * GlobalDmgMod + MeleeDmgMod) 
        highDmg = math.floor(15 * GlobalDmgMod + MeleeDmgMod)
    elseif difficulty ==6 then 
        lowDmg = math.floor(12 * GlobalDmgMod + MeleeDmgMod)
        highDmg = math.floor(24 * GlobalDmgMod + MeleeDmgMod)
    elseif difficulty == 7 then
        lowDmg = math.floor(18 * GlobalDmgMod + MeleeDmgMod)
        highDmg = math.floor(32 * GlobalDmgMod + MeleeDmgMod)
    elseif difficulty >= 8 then
        lowDmg = math.floor(25 * GlobalDmgMod + MeleeDmgMod)
        highDmg = math.floor(55 * GlobalDmgMod + MeleeDmgMod)
    end
    damage(NPC)
end

--Level 20-24
function TierThreeA(NPC, Spawn)
    if difficulty <=4 then 
        lowDmg = math.floor(2 * GlobalDmgMod + MeleeDmgMod) 
        highDmg =math.floor(7 * GlobalDmgMod + MeleeDmgMod)
    elseif difficulty == 5 then 
        lowDmg = math.floor(6 * GlobalDmgMod + MeleeDmgMod) 
        highDmg = math.floor(15 * GlobalDmgMod + MeleeDmgMod)
    elseif difficulty ==6 then 
        lowDmg = math.floor(12 * GlobalDmgMod + MeleeDmgMod)
        highDmg = math.floor(24 * GlobalDmgMod + MeleeDmgMod)
    elseif difficulty == 7 then
        lowDmg = math.floor(18 * GlobalDmgMod + MeleeDmgMod)
        highDmg = math.floor(32 * GlobalDmgMod + MeleeDmgMod)
    elseif difficulty >= 8 then
        lowDmg = math.floor(25 * GlobalDmgMod + MeleeDmgMod)
        highDmg = math.floor(55 * GlobalDmgMod + MeleeDmgMod)
    end
    damage(NPC)
end

--Level 25-29
function TierThreeB(NPC, Spawn)
    if difficulty <=4 then 
        lowDmg = math.floor(6 * GlobalDmgMod + MeleeDmgMod) 
        highDmg =math.floor(15 * GlobalDmgMod + MeleeDmgMod)
    elseif difficulty == 5 then 
        lowDmg = math.floor(12 * GlobalDmgMod + MeleeDmgMod) 
        highDmg = math.floor(24 * GlobalDmgMod + MeleeDmgMod)
    elseif difficulty ==6 then 
        lowDmg = math.floor(20 * GlobalDmgMod + MeleeDmgMod)
        highDmg = math.floor(35 * GlobalDmgMod + MeleeDmgMod)
    elseif difficulty == 7 then
        lowDmg = math.floor(18 * GlobalDmgMod + MeleeDmgMod)
        highDmg = math.floor(32 * GlobalDmgMod + MeleeDmgMod)
    elseif difficulty >= 8 then
        lowDmg = math.floor(35 * GlobalDmgMod + MeleeDmgMod)
        highDmg = math.floor(75 * GlobalDmgMod + MeleeDmgMod)
    end
    damage(NPC)
end

--Autoattack damage override function.
function damage(NPC, Spawn)
    SetInfoStructUInt(NPC, "override_primary_weapon", 1) --Set to 1 enables override for autoattack damage.  Set to 0 to allow server to set damage.
    SetInfoStructUInt(NPC, "primary_weapon_damage_low", lowDmg) 
    SetInfoStructUInt(NPC, "primary_weapon_damage_high", highDmg)
end

--Calculate Hitpoints and Power
function HealthPower(NPC, Spawn)
    
    -- Calculate multipliers based on difficulty tier
    if difficulty == 1 then
        HPMod = 0.20
        PWMod = 0.20  
    elseif difficulty == 2 then
        HPMod = 0.25
        PWMod = 0.25
    elseif difficulty == 3 then
        HPMod = 0.35
        PWMod = 0.35
    elseif difficulty == 4 then
        HPMod = 0.45
        PWMod = 0.45
    elseif difficulty == 5 then
        HPMod = 0.66
        PWMod = 0.66
    elseif difficulty == 6 then
        HPMod = 1.0
        PWMod = 1.0
    elseif difficulty == 7 then
        HPMod = 1.45
        PWMod = 1.45
    elseif difficulty == 8 then
        HPMod = 2.2
        PWMod = 2.2
    elseif difficulty == 9 then
        HPMod = 3.25
        PWMod = 3.25
    end
     
    --Calculate hitpoints and power based on level and difficuty
    if level == 1 then
        hp = 30 * HPMod * GlobalHPMod
        pw = 25 * PWMod * GlobalPowerMod
    elseif level == 2 then
        hp = 45 * HPMod * GlobalHPMod
        pw = 35 * PWMod * GlobalPowerMod
    elseif level == 3 then
        hp = 75 * HPMod * GlobalHPMod
        pw = 45 * PWMod * GlobalPowerMod
    elseif level == 4 then
        hp = 110 * HPMod * GlobalHPMod
        pw = 55 * PWMod * GlobalPowerMod
    elseif level == 5 then
        hp = 130 * HPMod * GlobalHPMod
        pw = 65 * PWMod * GlobalPowerMod
    elseif level ==  6 then
        hp = 150 * HPMod * GlobalHPMod
        pw = 80 * PWMod * GlobalPowerMod
    elseif level == 7 then
        hp = 200 * HPMod * GlobalHPMod
        pw = 90 * PWMod * GlobalPowerMod
    elseif level == 8 then
        hp = 240 * HPMod * GlobalHPMod
        pw = 100* PWMod * GlobalPowerMod
    elseif level == 9 then
        hp = 275 * HPMod * GlobalHPMod
        pw = 110 * PWMod * GlobalPowerMod
    elseif level == 10 then
        hp = 370 * HPMod * GlobalHPMod
        pw = 130 * PWMod * GlobalPowerMod
    elseif level ==  11 then
        hp = 430 * HPMod * GlobalHPMod
        pw = 160 * PWMod * GlobalPowerMod
    elseif level == 12 then
        hp = 550 * HPMod * GlobalHPMod
        pw = 185 * PWMod * GlobalPowerMod
    elseif level == 13 then
        hp = 680 * HPMod * GlobalHPMod
        pw = 205 * PWMod * GlobalPowerMod
    elseif level == 14 then
        hp = 795 * HPMod * GlobalHPMod
        pw = 240 * PWMod * GlobalPowerMod
    elseif level == 15 then
        hp = 920 * HPMod * GlobalHPMod
        pw = 270 * PWMod * GlobalPowerMod
    elseif level == 16 then
        hp = 1045 * HPMod * GlobalHPMod
        pw = 310 * PWMod * GlobalPowerMod
    elseif level == 17 then
        hp = 1180 * HPMod * GlobalHPMod
        pw = 360 * PWMod * GlobalPowerMod
    elseif level == 18 then
        hp = 1290 * HPMod * GlobalHPMod
        pw = 410 * PWMod * GlobalPowerMod
    elseif level == 19 then
        hp = 1440 * HPMod * GlobalHPMod
        pw = 425 * PWMod * GlobalPowerMod
    elseif level == 20 then
        hp = 1930 * HPMod * GlobalHPMod
        pw = 475 * PWMod * GlobalPowerMod
    elseif level == 21 then
        hp = 2120 * HPMod * GlobalHPMod
        pw = 500 * PWMod * GlobalPowerMod
    elseif level == 22 then
        hp = 2355 * HPMod * GlobalHPMod
        pw = 545 * PWMod * GlobalPowerMod
    elseif level == 23 then
        hp = 2595 * HPMod * GlobalHPMod
        pw = 575 * PWMod * GlobalPowerMod
    elseif level == 24 then
        hp = 2840 * HPMod * GlobalHPMod
        pw = 620 * PWMod * GlobalPowerMod
    elseif level == 25 then
        hp = 3080 * HPMod * GlobalHPMod
        pw = 670 * PWMod * GlobalPowerMod
    elseif level == 26 then
        hp = 3340 * HPMod * GlobalHPMod
        pw = 700 * PWMod * GlobalPowerMod
    elseif level == 27 then
        hp = 3600 * HPMod * GlobalHPMod
        pw = 755 * PWMod * GlobalPowerMod
    elseif level == 28 then
        hp = 3820 * HPMod * GlobalHPMod
        pw = 795 * PWMod * GlobalPowerMod
    elseif level == 29 then
        hp = 4240 * HPMod * GlobalHPMod
        pw = 835 * PWMod * GlobalPowerMod
    else
        hp = 5000 * HPMod * GlobalHPMod  --temp values
        pw = 900 * PWMod * GlobalPowerMod -- temp values
    end  

    SetMaxHP(NPC, math.floor(hp))
    ModifyHP(NPC, math.floor(hp))
    SetMaxPower(NPC, math.floor(pw))
    ModifyPower(NPC, math.floor(pw))
    
end

--Automatically set heroic flags based on specified criteria
function Heroic(NPC, Spawn)
    local group = GetGroup(NPC)
    
    if group ~= nil then
        local groupsize = #group
        if groupsize > 1 then
            SpawnSet(NPC, "heroic", 1) 
        end
    end
        
    if difficulty == 8 or difficulty == 9 then
        SpawnSet(NPC, "heroic", 1)
    end
    
end


-- OPTIONAL COSMETIC FUNCTIONS--

--Race functions for DoF compatibility.  These are called independently in the NPC's spawn function.
function dwarf(NPC, Spawn)
    SpawnSet(NPC,"race",2)
    
    if GetGender(NPC)==2 then
    SpawnSet(NPC,"model_type",109)    
    else
    SpawnSet(NPC,"model_type",110)    
    end
    
    hair(NPC)
end

function froglok(NPC, Spawn)
    SpawnSet(NPC,"race",4)
    
    if GetGender(NPC)==2 then
    SpawnSet(NPC,"model_type",76)    
    else
    SpawnSet(NPC,"model_type",77)    
    end
    
    hair(NPC)
end

function  halfling(NPC, Spawn)
    local hair = MakeRandomInt(1,2)
    SpawnSet(NPC,"race",7)
    
    if GetGender(NPC)==2 then
    SpawnSet(NPC,"model_type",107)    
    else
    SpawnSet(NPC,"model_type",108)    
    end
    
    if hair == 1 then
        SpawnSet(NPC, "hair_type", MakeRandomInt(1125,1128))
    else
        SpawnSet(NPC, "hair_type", MakeRandomInt(1133,1139))
    end
    haircolor(NPC)

end

function  highelf(NPC, Spawn)
    SpawnSet(NPC,"race",8)
    
    if GetGender(NPC)==2 then
    SpawnSet(NPC,"model_type",135)    
    else
    SpawnSet(NPC,"model_type",136)    
    end
    
    hair(NPC)
end

function woodelf(NPC, Spawn)
    SpawnSet(NPC,"race",15)
    
    if GetGender(NPC)==2 then
    SpawnSet(NPC,"model_type",113)    
    else
    SpawnSet(NPC,"model_type",114)    
    end
    
    SpawnSet(NPC, "hair_type", MakeRandomInt(1133, 1139))
    haircolor(NPC)
end

function barbarian(NPC, Spawn)
    local hair = MakeRandomInt(1,2)
    SpawnSet(NPC,"race",0)
    
    if GetGender(NPC)==2 then
    SpawnSet(NPC,"model_type",111)    
    else
    SpawnSet(NPC,"model_type",112)    
    end
    
    if hair == 1 then
        SpawnSet(NPC, "hair_type", MakeRandomInt(1125,1128))
    else
        SpawnSet(NPC, "hair_type", MakeRandomInt(1133,1139))
    end
    haircolor(NPC)
end

function erudite(NPC, Spawn)
    SpawnSet(NPC,"race",3)
    
    if GetGender(NPC)==2 then
    SpawnSet(NPC,"model_type",120)    
    else
    SpawnSet(NPC,"model_type",119)    
    end
    
    hair(NPC)
end

function gnome(NPC, Spawn)
    SpawnSet(NPC,"race",5)
    
    if GetGender(NPC)==2 then
    SpawnSet(NPC,"model_type",122)    
    else
    SpawnSet(NPC,"model_type",121)    
    end
    
    hair(NPC)
end

function halfelf(NPC, Spawn)
    SpawnSet(NPC,"race",6)
    
    if GetGender(NPC)==2 then
    SpawnSet(NPC,"model_type",79)    
    else
    SpawnSet(NPC,"model_type",78)    
    end
    
    hair(NPC)
end

function human(NPC, Spawn)
    SpawnSet(NPC,"race",9)
    
    if GetGender(NPC)==2 then
    SpawnSet(NPC,"model_type",132)    
    else
    SpawnSet(NPC,"model_type",134)    
    end
    
    hair(NPC)
end

function  kerra(NPC, Spawn)
    SpawnSet(NPC,"race",11)
    
    if GetGender(NPC)==2 then
    SpawnSet(NPC,"model_type",81)    
    else
    SpawnSet(NPC,"model_type",82)    
    end
    
    hair(NPC)
end

function darkelf(NPC, Spawn)
    SpawnSet(NPC,"race",1)
    
    if GetGender(NPC)==2 then
    SpawnSet(NPC,"model_type",116)    
    else
    SpawnSet(NPC,"model_type",115)    
    end
    
    hair(NPC)
    DarkElfHairColor(NPC, Spawn)
end

function iksar(NPC, Spawn)
    SpawnSet(NPC,"race",10)
    
    if GetGender(NPC)==2 then
    SpawnSet(NPC,"model_type",104)    
    else
    SpawnSet(NPC,"model_type",103)    
    end
    
    hair(NPC)
end

function ogre(NPC, Spawn)
    SpawnSet(NPC,"race",12)
    
    if GetGender(NPC)==2 then
    SpawnSet(NPC,"model_type",123)    
    else
    SpawnSet(NPC,"model_type",124)    
    end
    
    hair(NPC)
end

function ratonga(NPC, Spawn)
    SpawnSet(NPC,"race",13)
    
    if GetGender(NPC)==2 then
    SpawnSet(NPC,"model_type",54)    
    else
    SpawnSet(NPC,"model_type",53)    
    end
    
    hair(NPC)
end

function  troll(NPC, Spawn)
    SpawnSet(NPC,"race",14)
    
    if GetGender(NPC)==2 then
    SpawnSet(NPC,"model_type",105)    
    else
    SpawnSet(NPC,"model_type",106)    
    end
    
    hair(NPC)
    
end

-- Classic Orcs
function Deathfist(NPC, Spawn)
    SpawnSet(NPC,"model_type",137)
    SpawnSet(NPC, "race", 20)
    SpawnSet(NPC, "faction", 119)
end

function Bloodskull(NPC, Spawn)
    SpawnSet(NPC,"model_type",137)
    SpawnSet(NPC, "race", 20)
    SpawnSet(NPC, "faction", 120)
    SpawnSet(NPC, "skin_color", "50 60 50")
    SpawnSet(NPC, "eye_color", "98 63 28")
end

function Brokentusk(NPC, Spawn)
    SpawnSet(NPC,"model_type",137)
    SpawnSet(NPC, "race", 20)
    SpawnSet(NPC, "faction", 367)
    SpawnSet(NPC, "skin_color", "110 75 75")
    SpawnSet(NPC, "eye_color", "98 63 28")
end

function Lonetusk(NPC, Spawn)
    SpawnSet(NPC,"model_type",137)
    SpawnSet(NPC, "race", 20)
    SpawnSet(NPC, "faction", 366)
    SpawnSet(NPC, "skin_color", "92 52 52")
    SpawnSet(NPC, "eye_color", "98 63 28")
end

function Ree(NPC, Spawn)
    SpawnSet(NPC,"model_type",137)
    SpawnSet(NPC, "race", 20)
    SpawnSet(NPC, "faction", 121)
end

-- DoF compatible hair functions
function hair(NPC, Spawn)
    SpawnSet(NPC, "hair_type", MakeRandomInt(1125, 1139))
    if GetRace(NPC)==1 then --Darkelf
        DarkElfHairColor(NPC, Spawn)
    else
        haircolor(NPC)
    end
end

function haircolor(NPC, Spawn)
    local color = MakeRandomInt(1,5)
    if color == 1 then
        SpawnSet(NPC, "hair_type_color", "102 36 18")
        SpawnSet(NPC, "hair_type_highlight_color", "138 129 121")
        SpawnSet(NPC, "hair_face_color", "102 36 18")
        SpawnSet(NPC, "hair_face_highlight_color", "138 129 121")
    elseif color == 2 then
        SpawnSet(NPC, "hair_type_color", "218 187 120")
        SpawnSet(NPC, "hair_type_highlight_color", "114 65 4")
        SpawnSet(NPC, "hair_face_color", "218 187 120")
        SpawnSet(NPC, "hair_face_highlight_color", "114 65 4")
    elseif color == 3 then
        SpawnSet(NPC, "hair_type_color", "51 18 8")
        SpawnSet(NPC, "hair_type_highlight_color", "60 59 55")
        SpawnSet(NPC, "hair_face_color", "51 18 8")
        SpawnSet(NPC, "hair_face_highlight_color", "60 59 55")
    elseif color == 4 then
        SpawnSet(NPC, "hair_type_color", "5 5 10")
        SpawnSet(NPC, "hair_type_highlight_color", "5 5 10")
        SpawnSet(NPC, "hair_face_color", "5 5 10")
        SpawnSet(NPC, "hair_face_highlight_color", "5 5 10")
    elseif color == 5 then    
        SpawnSet(NPC, "hair_type_color", "230 230 230")
        SpawnSet(NPC, "hair_type_highlight_color", "154 147 81")
        SpawnSet(NPC, "hair_face_color", "230 230 230")
        SpawnSet(NPC, "hair_face_highlight_color", "154 147 81")    
    end
end

function DarkElfHairColor(NPC, Spawn)
    local color = MakeRandomInt(1,5)
    if color == 1 then
        SpawnSet(NPC, "hair_type_color", "183 177 183")
        SpawnSet(NPC, "hair_type_highlight_color", "84 32 14")
        SpawnSet(NPC, "hair_face_color", "183 177 183")
        SpawnSet(NPC, "hair_face_highlight_color", "84 32 14")
    elseif color == 2 then
        SpawnSet(NPC, "hair_type_color", "170 191 191")
        SpawnSet(NPC, "hair_type_highlight_color", "84 32 4")
        SpawnSet(NPC, "hair_face_color", "170 191 191")
        SpawnSet(NPC, "hair_face_highlight_color", "84 32 4")
    elseif color == 3 then
        SpawnSet(NPC, "hair_type_color", "179 173 194")
        SpawnSet(NPC, "hair_type_highlight_color", "198 184 78")
        SpawnSet(NPC, "hair_face_color", "179 173 194")
        SpawnSet(NPC, "hair_face_highlight_color", "198 184 78")
    elseif color == 4 then
        SpawnSet(NPC, "hair_type_color", "219 244 244")
        SpawnSet(NPC, "hair_type_highlight_color", "105 103 97")
        SpawnSet(NPC, "hair_face_color", "219 244 244")
        SpawnSet(NPC, "hair_face_highlight_color", "105 103 97")
    elseif color == 5 then    
        SpawnSet(NPC, "hair_type_color", "139 122 138")
        SpawnSet(NPC, "hair_type_highlight_color", "105 103 97")
        SpawnSet(NPC, "hair_face_color", "139 122 138")
        SpawnSet(NPC, "hair_face_highlight_color", "105 103 97")    
    end
end


--Idle Animation Packages:  Call the function in the main spawn function of the spawn script.

function IdleAggressive(NPC)
    if not IsInCombat(NPC) and GetRunbackDistance(NPC)<2 then
        local choice = MakeRandomInt(1,5)
        if choice == 1 then
            PlayFlavor(NPC,"","","scheme",0,0)
        elseif choice == 2 then
            PlayFlavor(NPC,"","","brandish",0,0)
        elseif choice == 3 then
            PlayFlavor(NPC,"","","tapfoot",0,0)
        elseif choice == 4 then
            PlayFlavor(NPC,"","","swear",0,0)
        elseif choice == 5 then
            PlayFlavor(NPC,"","","threaten",0,0)
        end
end
    AddTimer(NPC,MakeRandomInt(6500,12000),"IdleAggressive")
end

function IdleAlert(NPC)
    if not IsInCombat(NPC) and GetRunbackDistance(NPC)<2 then
        local choice = MakeRandomInt(1,5)
        if choice == 1 then
            PlayFlavor(NPC,"","","peer",0,0)
        elseif choice == 2 then
            PlayFlavor(NPC,"","","listen",0,0)
        elseif choice == 3 then
            PlayFlavor(NPC,"","","tapfoot",0,0)
        elseif choice == 4 then
            PlayFlavor(NPC,"","","yawn",0,0)
        elseif choice == 5 then
            PlayFlavor(NPC,"","","ponder",0,0)
        end
end
    AddTimer(NPC,MakeRandomInt(6500,12000),"IdleAlert")
end

function IdleMischief(NPC)
    if not IsInCombat(NPC) and GetRunbackDistance(NPC)<2 then
        local choice = MakeRandomInt(1,5)
        if choice == 1 then
            PlayFlavor(NPC,"","","moon",0,0)
        elseif choice == 2 then
            PlayFlavor(NPC,"","","neener",0,0)
        elseif choice == 3 then
            PlayFlavor(NPC,"","","giggle",0,0)
        elseif choice == 4 then
            PlayFlavor(NPC,"","","dance",0,0)
        elseif choice == 5 then
            PlayFlavor(NPC,"","","heartattack",0,0)
        end
end
    AddTimer(NPC,MakeRandomInt(6500,12000),"IdleMischief")
end

function IdleBored(NPC)
    if not IsInCombat(NPC) and GetRunbackDistance(NPC)<2 then
        local choice = MakeRandomInt(1,5)
        if choice == 1 then
            PlayFlavor(NPC,"","","tapfoot",0,0)
        elseif choice == 2 then
            PlayFlavor(NPC,"","","sigh",0,0)
        elseif choice == 3 then
            PlayFlavor(NPC,"","","stretch",0,0)
        elseif choice == 4 then
            PlayFlavor(NPC,"","","yawn",0,0)
        elseif choice == 5 then
            PlayFlavor(NPC,"","","stare",0,0)
        end
end
    AddTimer(NPC,MakeRandomInt(6500,12000),"IdleBored")
end

function IdlePlayful(NPC)
    if not IsInCombat(NPC) and GetRunbackDistance(NPC)<2 then
        local choice = MakeRandomInt(1,5)
        if choice == 1 then
            PlayFlavor(NPC,"","","dance",0,0)
        elseif choice == 2 then
            PlayFlavor(NPC,"","","flirt",0,0)
        elseif choice == 3 then
            PlayFlavor(NPC,"","","smile",0,0)
        elseif choice == 4 then
            PlayFlavor(NPC,"","","thumbsup",0,0)
        elseif choice == 5 then
            PlayFlavor(NPC,"","","yeah",0,0)
        end
end
    AddTimer(NPC,MakeRandomInt(6500,12000),"IdlePlayful")
end

function IdleSad(NPC)
    if not IsInCombat(NPC) and GetRunbackDistance(NPC)<2 then
        local choice = MakeRandomInt(1,5)
        if choice == 1 then
            PlayFlavor(NPC,"","","sad",0,0)
        elseif choice == 2 then
            PlayFlavor(NPC,"","","pout",0,0)
        elseif choice == 3 then
            PlayFlavor(NPC,"","","sigh",0,0)
        elseif choice == 4 then
            PlayFlavor(NPC,"","","sulk",0,0)
        elseif choice == 5 then
            PlayFlavor(NPC,"","","cry",0,0)
        end
end
    AddTimer(NPC,MakeRandomInt(6500,12000),"IdleSad")
end

function IdleSneaky(NPC)
    if not IsInCombat(NPC) and GetRunbackDistance(NPC)<2 then
        local choice = MakeRandomInt(1,5)
        if choice == 1 then
            PlayFlavor(NPC,"","","scheme",0,0)
        elseif choice == 2 then
            PlayFlavor(NPC,"","","smirk",0,0)
        elseif choice == 3 then
            PlayFlavor(NPC,"","","whome",0,0)
        elseif choice == 4 then
            PlayFlavor(NPC,"","","beckon",0,0)
        elseif choice == 5 then
            PlayFlavor(NPC,"","","cutthroat",0,0)
        end
end
    AddTimer(NPC,MakeRandomInt(6500,12000),"IdleSneaky")
end

function IdlePriest(NPC)
       if IsInCombat(NPC) == false then
        choice = MakeRandomInt(1,5)
        if choice == 1 then
            CastSpell(NPC, 110002, 5, NPC)
        elseif choice == 2 then
            CastSpell(NPC, 110003, 5, NPC)
            PlayFlavor(NPC,"","","yawn",0,0)
--          PlayAnimation(NPC, 891)
        elseif choice == 4 then
            PlayFlavor(NPC,"","","tapfoot",0,0)
--          PlayAnimation(NPC, 713)
        elseif choice == 5 then
            PlayFlavor(NPC,"","","sniff",0,0)
--          PlayAnimation(NPC, 553)
        end
end
    AddTimer(NPC,MakeRandomInt(6500,12000),"IdlePriest") 
    
end

function IdleAngry(NPC)
   if IsInCombat(NPC) == false then
        choice = MakeRandomInt(1,5)
        if choice == 1 then
            PlayFlavor(NPC,"","","frustrated",0,0)
        elseif choice == 2 then
            PlayFlavor(NPC,"","","curse",0,0)
        elseif choice == 3 then
            PlayFlavor(NPC,"","","scold",0,0)
        elseif choice == 4 then
            PlayFlavor(NPC,"","","shakefist",0,0)
        elseif choice == 5 then
            PlayFlavor(NPC,"","","swear",0,0)
        end

end
    AddTimer(NPC,MakeRandomInt(7000,10000),"IdleAngry") 
end

function IdleBeggar(NPC)
    if IsInCombat(NPC) == false then
        choice = MakeRandomInt(1,5)
        if choice == 1 then
            PlayFlavor(NPC,"","","beg",0,0)
--            PlayAnimation(NPC, 310)
        elseif choice == 2 then
            PlayFlavor(NPC,"","","peer",0,0)
--            PlayAnimation(NPC, 411)
        elseif choice == 3 then
            PlayFlavor(NPC,"","","yawn",0,0)
--            PlayAnimation(NPC, 891)
        elseif choice == 4 then
            PlayFlavor(NPC,"","","tapfoot",0,0)
--            PlayAnimation(NPC, 713)
        elseif choice == 5 then
            PlayFlavor(NPC,"","","sniff",0,0)
--            PlayAnimation(NPC, 553)
        end
    end
    AddTimer(NPC,MakeRandomInt(10000,15000),"IdleBeggar") 
end

function IdleTinker(NPC)
    if IsInCombat(NPC) == false then
        choice = MakeRandomInt(1,7)
        if choice == 1 then
            PlayFlavor(NPC,"","","confused",0,0)
--            PlayAnimation(NPC, 310)
        elseif choice == 2 then
            PlayFlavor(NPC,"","","yes",0,0)
--            PlayAnimation(NPC, 411)
        elseif choice == 3 then
            PlayFlavor(NPC,"","","boggle",0,0)
--            PlayAnimation(NPC, 891)
        elseif choice == 4 then
            PlayFlavor(NPC,"","","ponder",0,0)
--            PlayAnimation(NPC, 713)
        elseif choice == 5 then
            PlayFlavor(NPC,"","","grumble",0,0)
--            PlayAnimation(NPC, 553)
        elseif choice == 6 then
            PlayFlavor(NPC,"","","doh",0,0)
--            PlayAnimation(NPC, 553)
        elseif choice == 7 then
            PlayFlavor(NPC,"","","crazy",0,0)
--            PlayAnimation(NPC, 553)
        end
    end
    AddTimer(NPC,MakeRandomInt(8000,13000),"IdleTinker") 
end


-- PATHING SCRIPTS --

--[[ Randomized Movement Loops
    Call the RandomMovement() function in the NPC's spawn function.
    Example format: RandomMovement(NPC, Spawn, -5, 5, 2, 8, 15)
    This exampled sets the NPC to randomly move anywhere in a 5 meter radius
    from it's spawn point at a speed of 2, moving every 8-15 seconds.
--]]

function RandomMovement(NPC, Spawn, NegDist, PosDist, Speed, MinDly, MaxDly)
    local X = GetX(NPC)
	local Y = GetY(NPC)
	local Z = GetZ(NPC)
    
    MovementLoopAddLocation(NPC, X, Y, Z, Speed, MakeRandomInt(MinDly, MaxDly))
    MovementMod(NPC, Spawn, NegDist, PosDist, Speed, MinDly, MaxDly)
	MovementLoopAddLocation(NPC, X + LocModX, Y, Z + LocModZ, Speed, MakeRandomInt(MinDly, MaxDly))
	MovementMod(NPC, Spawn, NegDist, PosDist, Speed, MinDly, MaxDly)
	MovementLoopAddLocation(NPC, X + LocModX, Y, Z + LocModZ, Speed, MakeRandomInt(MinDly, MaxDly))
	MovementMod(NPC, Spawn, NegDist, PosDist, Speed, MinDly, MaxDly)
	MovementLoopAddLocation(NPC, X + LocModX, Y, Z + LocModZ, Speed, MakeRandomInt(MinDly, MaxDly))
	MovementMod(NPC, Spawn, NegDist, PosDist, Speed, MinDly, MaxDly)
	MovementLoopAddLocation(NPC, X + LocModX, Y, Z + LocModZ, Speed, MakeRandomInt(MinDly, MaxDly))
	MovementMod(NPC, Spawn, NegDist, PosDist, Speed, MinDly, MaxDly)
	MovementLoopAddLocation(NPC, X + LocModX, Y, Z + LocModZ, Speed, MakeRandomInt(MinDly, MaxDly))
end

function RandomMovementFlight(NPC, Spawn, NegDist, PosDist, NegHeight, PosHeight, Speed, MinDly, MaxDly)
    local X = GetX(NPC)
	local Y = GetY(NPC)
	local Z = GetZ(NPC)
    MovementLoopAddLocation(NPC, X, Y, Z, Speed, MakeRandomInt(MinDly, MaxDly))
	MovementLoopAddLocation(NPC, X + MakeRandomInt(NegDist, PosDist), Y + MakeRandomInt(NegHeight, PosHeight), Z + MakeRandomInt(NegDist, PosDist), Speed, MakeRandomInt(MinDly, MaxDly))
	MovementLoopAddLocation(NPC, X + MakeRandomInt(NegDist, PosDist), Y + MakeRandomInt(NegHeight, PosHeight), Z + MakeRandomInt(NegDist, PosDist), Speed, MakeRandomInt(MinDly, MaxDly))
	MovementLoopAddLocation(NPC, X + MakeRandomInt(NegDist, PosDist), Y + MakeRandomInt(NegHeight, PosHeight), Z + MakeRandomInt(NegDist, PosDist), Speed, MakeRandomInt(MinDly, MaxDly))
	MovementLoopAddLocation(NPC, X + MakeRandomInt(NegDist, PosDist), Y + MakeRandomInt(NegHeight, PosHeight), Z + MakeRandomInt(NegDist, PosDist), Speed, MakeRandomInt(MinDly, MaxDly))
	MovementLoopAddLocation(NPC, X + MakeRandomInt(NegDist, PosDist), Y + MakeRandomInt(NegHeight, PosHeight), Z + MakeRandomInt(NegDist, PosDist), Speed, MakeRandomInt(MinDly, MaxDly))
end

---Set an NPC to follow another NPC 
function FollowNPC(NPC, Spawn, LocID, Speed, Distance)
	local zone = GetZone(NPC)
	local leader = GetSpawnByLocationID(zone, LocID)

            if GetDistance(NPC, leader) >= Distance then
        	        MovementLoopAddLocation (NPC, GetX(leader), GetY(leader), GetZ(leader), Speed, 0)
        	end 
	
	    
	    -- in progress, do not use
end

function MovementMod(NPC, Spawn, NegDist, PosDist, Speed, MinDly, MaxDly)
    MinNegDist = math.floor(NegDist/2) 
	MinPosDist = math.floor(PosDist/2) 
	MinX = MakeRandomInt(1,2)
	MinZ = MakeRandomInt(1,2)
	
	if MinX == 1 then
	    LocModX = MakeRandomInt(MinNegDist, NegDist)
	elseif MinX == 2 then
	    LocModX = MakeRandomInt(MinPostDist, PosDist)
	end
	
    if MinZ == 1 then
	    LocModZ = MakeRandomInt(MinNegDist, NegDist)
	elseif MinZ == 2 then
	    LocModZ = MakeRandomInt(MinPostDist, PosDist)
	end

end

--  Automatically enforce level uniformity in multi-spawn encounters
function Encounters(NPC, Spawn)
    local group = GetGroup(NPC)
    
    if group ~= nil then
        for k,v in ipairs(group) do
            GroupLevel=  GetLevel(v)
            Level = GroupLevel
            SpawnSet(NPC,  "level", GroupLevel)
        end
    end
end

