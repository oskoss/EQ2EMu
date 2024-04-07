--[[
    Script Name    : SpawnScripts/DownBelow_Classic/atombforagerNarrowMovement.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.01.12 08:01:38
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 2, -2, 2, 5, 10)
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end