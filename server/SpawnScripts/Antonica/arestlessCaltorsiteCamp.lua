--[[
    Script Name    : SpawnScripts/Antonica/arestlessCaltorsiteCamp.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.02.01 08:02:30
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 4, -4, 2, 0, 0)
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end