--[[
    Script Name    : SpawnScripts/Caves/analbinobat.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.10.06 03:10:05
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovementFlight(NPC, Spawn, 16, -16, 2, -2, 2, 8, 15)
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end