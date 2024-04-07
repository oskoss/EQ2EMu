--[[
    Script Name    : SpawnScripts/SunkenCity_Classic/UlrichtheKingpin.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.10.30 08:10:17
    Script Purpose : 
                   : 
--]]
    dofile("SpawnScripts/Generic/MonsterCallouts/BaseHuman1.lua")

function spawn(NPC)
    dmgMod = GetStr(NPC)/10
    SetInfoStructUInt(NPC, "override_primary_weapon", 1)        
    SetInfoStructUInt(NPC, "primary_weapon_damage_low", math.floor(22 + dmgMod)) 
    SetInfoStructUInt(NPC, "primary_weapon_damage_high", math.floor(42 + dmgMod))
    SetSeeHide(NPC,1)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end