--[[
    Script Name    : SpawnScripts/Oakmyst_Classic/Rotweed.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.10.19 03:10:25
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
    local Level = GetLevel(NPC)
    local level1 = 13
    local level2 = 14
    local difficulty1 = 8
    local hp1 = 1770
    local power1 = 485
    local difficulty2 = 8
    local hp2 = 1990
    local power2 = 530
    if Level == level1 then
    SpawnSet(NPC, "difficulty", difficulty1)
    SpawnSet(NPC, "hp", hp1)
    SpawnSet(NPC, "power", power1)
    elseif Level == level2
        then
    SpawnSet(NPC, "difficulty", difficulty2)
    SpawnSet(NPC, "hp", hp2)
    SpawnSet(NPC, "power", power2)
    end
    
    dmgMod = GetStr(NPC)/10
    SetInfoStructUInt(NPC, "override_primary_weapon", 1)        
    SetInfoStructUInt(NPC, "primary_weapon_damage_low", math.floor(12 + dmgMod)) 
    SetInfoStructUInt(NPC, "primary_weapon_damage_high", math.floor(24 + dmgMod))
end

function aggro(NPC, Spawn)
    aggrotimer(NPC)
end

function aggrotimer(NPC)
    AddTimer(NPC,600000,"aggrotimer") -- Check is Thistles and Cube are up
local Rotweed = GetSpawnByLocationID(zone, 133779140)
    if IsInCombat(Rotweed) and Rotweed ~=nil then
    else
    Despawn(Rotweed) --Despawns Thistles and Cube, which disables update
end
end

function hailed(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end