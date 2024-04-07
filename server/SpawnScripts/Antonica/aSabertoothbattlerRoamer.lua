--[[
    Script Name    : SpawnScripts/Antonica/aSabertoothbattlerRoamer.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.01.31 07:01:58
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 12, -12, 2, 8, 15)
    RandomWeapons(NPC)
    IdleAggressive(NPC)
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end