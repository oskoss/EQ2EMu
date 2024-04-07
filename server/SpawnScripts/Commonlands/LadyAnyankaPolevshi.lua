--[[
    Script Name    : SpawnScripts/Commonlands/LadyAnyankaPolevshi.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.25 01:01:31
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    dmgMod = GetStr(NPC)/10
    SetInfoStructUInt(NPC, "override_primary_weapon", 1)        
    SetInfoStructUInt(NPC, "primary_weapon_damage_low", math.floor(45 + dmgMod)) 
    SetInfoStructUInt(NPC, "primary_weapon_damage_high", math.floor(85 + dmgMod))
    RandomMovement(NPC, Spawn, 12, -12, 2, 8, 15)
end


function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end