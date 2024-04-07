--[[
    Script Name    : SpawnScripts/DownBelow_Classic/ajuvenileshrillerFlyer.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.11.10 06:11:17
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovementFlight(NPC, Spawn, 5, -5, 2, -4, 2, 5, 10)
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end