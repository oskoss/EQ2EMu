--[[
    Script Name    : SpawnScripts/Classic_forest/anAntonicanhawk.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.10.11 03:10:42
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovementFlight(NPC, Spawn, 7, -7, 2, -2, 2, 5, 10)
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end