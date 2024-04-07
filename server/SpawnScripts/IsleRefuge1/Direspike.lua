--[[
    Script Name    : SpawnScripts/IsleRefuge1/Direspike.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.09.06 06:09:11
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC)
    local dmgMod = GetStr(NPC)/10
    SetInfoStructUInt(NPC, "override_primary_weapon", 1)
    SetInfoStructUInt(NPC, "primary_weapon_damage_low", 3 + dmgMod) 
    SetInfoStructUInt(NPC, "primary_weapon_damage_high", 7 + dmgMod)
    SetInfoStructUInt(NPC, "hp_regen_override", 1) 
    SetInfoStructSInt(NPC, "hp_regen", 0) 
    SetInfoStructUInt(NPC, "pw_regen_override", 1) 
    SetInfoStructSInt(NPC, "pw_regen", 0) 
    RandomMovement(NPC, Spawn, 9, -9, 2, 8, 15)
end


function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end