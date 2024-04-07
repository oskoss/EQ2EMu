--[[
    Script Name    : SpawnScripts/Classic_forest/abonecutterfish.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.10.12 07:10:35
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 6, -6, 2, 5, 10)
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end