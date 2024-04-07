--[[
    Script Name    : SpawnScripts/TheSprawl_Classic/agravelviper.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.11.08 08:11:31
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, -5, 5, 2, 8, 15)
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end