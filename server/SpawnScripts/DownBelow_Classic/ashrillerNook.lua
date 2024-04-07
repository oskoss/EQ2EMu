--[[
    Script Name    : SpawnScripts/DownBelow_Classic/ashrillerNook.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.01.14 06:01:50
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovementFlight(NPC, Spawn, 1.5, -1.5, 0.5, -0.5, 1.5, 0, 0)
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end