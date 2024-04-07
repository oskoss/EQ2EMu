--[[
    Script Name    : SpawnScripts/Caves/aterrabat.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.10.06 04:10:23
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovementFlight(NPC, Spawn, 16, -16, 2, -2, 2, 5, 10)
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end