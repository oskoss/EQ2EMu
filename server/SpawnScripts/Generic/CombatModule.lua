--[[
    Script Name    : SpawnScripts/Generic/CombatModule.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.09.19 08:09:17
    Script Purpose : Base Population Combat Common Features
                   : 
--]]

GlobalDmgMod = 1.0      -- Global Damage Multiplier- make global adjustments to all NPC autoattack damage.
globalStatMod = 1.0     -- Global Attribute Multiplier- make global adjustments to NPC attribute scores.
  

function  combatModule(NPC, Spawn) 
    level = GetLevel(NPC)           -- NPC Level
    difficulty = GetDifficulty(NPC) -- NPC Difficulty || Function in testing phase, default to 6 if necessary.
    levelSwitch(NPC)
    regen(NPC)
    attributes(NPC)
    
end

--Determine damage function based on NPC level.
function levelSwitch(NPC, Spawn)
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
function attributes(NPC, Spawn)
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
    
    lowStat = math.floor(low * globalStatMod)
    fourStat = math.floor(four * globalStatMod)
    fiveStat = math.floor(five * globalStatMod)
    sixStat = math.floor(baseStat * globalStatMod)
    sevenStat = math.floor(seven * globalStatMod)
    eightStat = math.floor(eight * globalStatMod)
    nineStat = math.floor(nine * globalStatMod)
    
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
function regen(NPC, Spawn)
    
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
    local dmgMod =GetStr(NPC)/10          -- Strength-based damage bonus for autoattack damage.
    lowDmg = math.floor(0 * GlobalDmgMod + dmgMod)
    highDmg = math.floor(2 * GlobalDmgMod + dmgMod)
    SetInfoStructUInt(NPC, "override_primary_weapon", 1)        -- Enables override of server autoattack damage. Set to 0 to  allow server to set damage.
    SetInfoStructUInt(NPC, "primary_weapon_damage_low", lowDmg) 
    SetInfoStructUInt(NPC, "primary_weapon_damage_high", highDmg)
end


--Level 4-5
function TierOneB(NPC, Spawn)
    local dmgMod =GetStr(NPC)/10
    if difficulty <=4 then -- 
        lowDmg = math.floor(1 * GlobalDmgMod + dmgMod)
        highDmg =math.floor(2 * GlobalDmgMod + dmgMod)
    elseif difficulty == 5 then 
        lowDmg = math.floor(1 * GlobalDmgMod + dmgMod)
        highDmg = math.floor(3 * GlobalDmgMod + dmgMod)
    elseif difficulty >=6 and difficulty <=9 then 
        lowDmg = math.floor(2 * GlobalDmgMod + dmgMod)
        highDmg = math.floor(4 * GlobalDmgMod + dmgMod)
    end
    SetInfoStructUInt(NPC, "override_primary_weapon", 1)
    SetInfoStructUInt(NPC, "primary_weapon_damage_low", lowDmg) 
    SetInfoStructUInt(NPC, "primary_weapon_damage_high", highDmg)
end


--Level 6-9
function TierOneC(NPC, Spawn)
    local dmgMod =GetStr(NPC)/10
    if difficulty <=4 then  -- 1-3 dif 1-4
        lowDmg = math.floor(1 * GlobalDmgMod + dmgMod) 
        highDmg =math.floor(3 * GlobalDmgMod + dmgMod)
    elseif difficulty == 5 then -- 2-4 dif 5
        lowDmg = math.floor(2 * GlobalDmgMod + dmgMod) 
        highDmg = math.floor(4 * GlobalDmgMod + dmgMod)
    elseif difficulty ==6 then -- 2-7 damage- Dif 6
        lowDmg = math.floor(2 * GlobalDmgMod + dmgMod)
        highDmg = math.floor(7 * GlobalDmgMod + dmgMod)
    elseif difficulty >=7 then -- 2-7 damage- Dif 7+
        lowDmg = math.floor(5 * GlobalDmgMod + dmgMod)
        highDmg = math.floor(10 * GlobalDmgMod + dmgMod)
    end
    
    SetInfoStructUInt(NPC, "override_primary_weapon", 1)
    SetInfoStructUInt(NPC, "primary_weapon_damage_low", lowDmg) 
    SetInfoStructUInt(NPC, "primary_weapon_damage_high", highDmg)
end


--Level 10-15
function TierTwoA(NPC, Spawn)
    local dmgMod =GetStr(NPC)/10
    if difficulty <=4 then 
        lowDmg = math.floor(2 * GlobalDmgMod + dmgMod) 
        highDmg =math.floor(4 * GlobalDmgMod + dmgMod)
    elseif difficulty == 5 then 
        lowDmg = math.floor(2 * GlobalDmgMod + dmgMod) 
        highDmg = math.floor(7 * GlobalDmgMod + dmgMod)
    elseif difficulty ==6 then 
        lowDmg = math.floor(6 * GlobalDmgMod + dmgMod)
        highDmg = math.floor(15 * GlobalDmgMod + dmgMod)
    elseif difficulty == 7 then
        lowDmg = math.floor(8 * GlobalDmgMod + dmgMod)
        highDmg = math.floor(17 * GlobalDmgMod + dmgMod)
    elseif difficulty >= 8 then
        lowDmg = math.floor(12 * GlobalDmgMod + dmgMod)
        highDmg = math.floor(24 * GlobalDmgMod + dmgMod)
    end
    
    SetInfoStructUInt(NPC, "override_primary_weapon", 1)
    SetInfoStructUInt(NPC, "primary_weapon_damage_low", lowDmg) 
    SetInfoStructUInt(NPC, "primary_weapon_damage_high", highDmg)
end


--Level 16-19
function TierTwoB(NPC, Spawn)
        local dmgMod =GetStr(NPC)/10
    if difficulty <=4 then 
        lowDmg = math.floor(2 * GlobalDmgMod + dmgMod) 
        highDmg =math.floor(7 * GlobalDmgMod + dmgMod)
    elseif difficulty == 5 then 
        lowDmg = math.floor(6 * GlobalDmgMod + dmgMod) 
        highDmg = math.floor(15 * GlobalDmgMod + dmgMod)
    elseif difficulty ==6 then 
        lowDmg = math.floor(12 * GlobalDmgMod + dmgMod)
        highDmg = math.floor(24 * GlobalDmgMod + dmgMod)
    elseif difficulty == 7 then
        lowDmg = math.floor(18 * GlobalDmgMod + dmgMod)
        highDmg = math.floor(32 * GlobalDmgMod + dmgMod)
    elseif difficulty >= 8 then
        lowDmg = math.floor(25 * GlobalDmgMod + dmgMod)
        highDmg = math.floor(55 * GlobalDmgMod + dmgMod)
    end
    
    SetInfoStructUInt(NPC, "override_primary_weapon", 1)
    SetInfoStructUInt(NPC, "primary_weapon_damage_low", lowDmg) 
    SetInfoStructUInt(NPC, "primary_weapon_damage_high", highDmg)

end

--Level 20-24
function TierThreeA(NPC, Spawn)
        local dmgMod =GetStr(NPC)/10
    if difficulty <=4 then 
        lowDmg = math.floor(2 * GlobalDmgMod + dmgMod) 
        highDmg =math.floor(7 * GlobalDmgMod + dmgMod)
    elseif difficulty == 5 then 
        lowDmg = math.floor(6 * GlobalDmgMod + dmgMod) 
        highDmg = math.floor(15 * GlobalDmgMod + dmgMod)
    elseif difficulty ==6 then 
        lowDmg = math.floor(12 * GlobalDmgMod + dmgMod)
        highDmg = math.floor(24 * GlobalDmgMod + dmgMod)
    elseif difficulty == 7 then
        lowDmg = math.floor(18 * GlobalDmgMod + dmgMod)
        highDmg = math.floor(32 * GlobalDmgMod + dmgMod)
    elseif difficulty >= 8 then
        lowDmg = math.floor(25 * GlobalDmgMod + dmgMod)
        highDmg = math.floor(55 * GlobalDmgMod + dmgMod)
    end
    
    SetInfoStructUInt(NPC, "override_primary_weapon", 1)
    SetInfoStructUInt(NPC, "primary_weapon_damage_low", lowDmg) 
    SetInfoStructUInt(NPC, "primary_weapon_damage_high", highDmg)
 
end

--Level 25-29
function TierThreeB(NPC, Spawn)
        local dmgMod =GetStr(NPC)/10
    if difficulty <=4 then 
        lowDmg = math.floor(6 * GlobalDmgMod + dmgMod) 
        highDmg =math.floor(15 * GlobalDmgMod + dmgMod)
    elseif difficulty == 5 then 
        lowDmg = math.floor(12 * GlobalDmgMod + dmgMod) 
        highDmg = math.floor(24 * GlobalDmgMod + dmgMod)
    elseif difficulty ==6 then 
        lowDmg = math.floor(20 * GlobalDmgMod + dmgMod)
        highDmg = math.floor(35 * GlobalDmgMod + dmgMod)
    elseif difficulty == 7 then
        lowDmg = math.floor(18 * GlobalDmgMod + dmgMod)
        highDmg = math.floor(32 * GlobalDmgMod + dmgMod)
    elseif difficulty >= 8 then
        lowDmg = math.floor(35 * GlobalDmgMod + dmgMod)
        highDmg = math.floor(75 * GlobalDmgMod + dmgMod)
    end
    
    SetInfoStructUInt(NPC, "override_primary_weapon", 1)
    SetInfoStructUInt(NPC, "primary_weapon_damage_low", lowDmg) 
    SetInfoStructUInt(NPC, "primary_weapon_damage_high", highDmg)

end


