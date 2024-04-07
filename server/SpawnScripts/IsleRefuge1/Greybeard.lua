--[[
    Script Name    : SpawnScripts/IsleRefuge1/Greybeard.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.09.13 04:09:04
    Script Purpose : 
                   : 
--]]

dofile("SpawnScripts/Generic/MonsterCallouts/BaseSkeleton2.lua")

function spawn(NPC)
    local dmgMod = GetStr(NPC)/10
    SetInfoStructUInt(NPC, "override_primary_weapon", 1)
    SetInfoStructUInt(NPC, "primary_weapon_damage_low", 5 + dmgMod) 
    SetInfoStructUInt(NPC, "primary_weapon_damage_high", 11 + dmgMod)
    SetInfoStructUInt(NPC, "hp_regen_override", 1) 
    SetInfoStructSInt(NPC, "hp_regen", 0) 
    SetInfoStructUInt(NPC, "pw_regen_override", 1) 
    SetInfoStructSInt(NPC, "pw_regen", 0) 
    SetSpawnAnimation(NPC, 13016)

end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end