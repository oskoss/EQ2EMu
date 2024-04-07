--[[
    Script Name    : SpawnScripts/Commonlands/LieutenantVrahKna.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.22 05:01:37
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC)
    dmgMod = GetStr(NPC)/10
    SetInfoStructUInt(NPC, "override_primary_weapon", 1)        
    SetInfoStructUInt(NPC, "primary_weapon_damage_low", math.floor(30 + dmgMod)) 
    SetInfoStructUInt(NPC, "primary_weapon_damage_high", math.floor(60 + dmgMod))
    Bloodskull(NPC)
    OrcChainCommon(NPC)

end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end