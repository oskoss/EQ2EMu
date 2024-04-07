--[[
    Script Name    : SpawnScripts/IsleRefuge1/Quagmaul.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.03.09 09:03:14
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
    local dmgMod = GetStr(NPC)/10
    SetInfoStructUInt(NPC, "override_primary_weapon", 1)
    SetInfoStructUInt(NPC, "primary_weapon_damage_low", 4 + dmgMod) 
    SetInfoStructUInt(NPC, "primary_weapon_damage_high", 10 + dmgMod)
    SetInfoStructUInt(NPC, "hp_regen_override", 1) 
    SetInfoStructSInt(NPC, "hp_regen", 0) 
    SetInfoStructUInt(NPC, "pw_regen_override", 1) 
    SetInfoStructSInt(NPC, "pw_regen", 0) 
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end