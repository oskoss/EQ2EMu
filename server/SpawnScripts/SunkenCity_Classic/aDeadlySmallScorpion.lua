--[[
    Script Name    : SpawnScripts/SunkenCity_Classic/aDeadlySmallScorpion.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.10.16 03:10:15
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
    dmgMod = GetStr(NPC)/10
    SetInfoStructUInt(NPC, "override_primary_weapon", 1)        
    SetInfoStructUInt(NPC, "primary_weapon_damage_low", math.floor(15 + dmgMod)) 
    SetInfoStructUInt(NPC, "primary_weapon_damage_high", math.floor(26 + dmgMod))
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end