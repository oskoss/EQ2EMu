--[[
    Script Name    : SpawnScripts/Antonica/AdvisorPandrus.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.02.02 09:02:30
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    dmgMod = GetStr(NPC)/10
    SetInfoStructUInt(NPC, "override_primary_weapon", 1)        
    SetInfoStructUInt(NPC, "primary_weapon_damage_low", math.floor(65 + dmgMod)) 
    SetInfoStructUInt(NPC, "primary_weapon_damage_high", math.floor(105 + dmgMod))
    AddTimer(NPC, 6000, "waypoints")
end

function waypoints(NPC, Spawn)
    RandomMovement(NPC, Spawn, 35, -35, 2, 8, 15)
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end