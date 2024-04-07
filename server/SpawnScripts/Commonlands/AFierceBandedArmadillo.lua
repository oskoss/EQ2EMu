--[[
    Script Name    : SpawnScripts/Commonlands/AFierceBandedArmadillo.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.14 10:01:12
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC)
    dmgMod = GetStr(NPC)/10
    SetInfoStructUInt(NPC, "override_primary_weapon", 1)        
    SetInfoStructUInt(NPC, "primary_weapon_damage_low", math.floor(18 + dmgMod)) 
    SetInfoStructUInt(NPC, "primary_weapon_damage_high", math.floor(32 + dmgMod))
    RandomMovement(NPC, Spawn, 8, -8, 2, 8, 15)

end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end