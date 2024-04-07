--[[
    Script Name    : SpawnScripts/Antonica/afieldshrike.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.01.22 03:01:03
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovementFlight(NPC, Spawn, 20, -20, 4, -2, 2, 5, 10)
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end