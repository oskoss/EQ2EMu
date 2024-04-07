--[[
    Script Name    : SpawnScripts/SunkenCity_Classic/MasteratArmsVenqruist.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.10.17 03:10:45
    Script Purpose : 
                   : 
--]]
    dofile("SpawnScripts/Generic/MonsterCallouts/BaseGhost1.lua")

function spawn(NPC)
    dmgMod = GetStr(NPC)
    SetInfoStructUInt(NPC, "override_primary_weapon", 1)
    SetInfoStructUInt(NPC, "primary_weapon_damage_low", 4 + dmgMod) 
    SetInfoStructUInt(NPC, "primary_weapon_damage_high", 10 + dmgMod)
    SetSeeHide(NPC,1)
    SetSeeInvis(NPC,1)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end