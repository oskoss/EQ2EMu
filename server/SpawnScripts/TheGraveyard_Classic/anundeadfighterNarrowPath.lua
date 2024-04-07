--[[
    Script Name    : SpawnScripts/TheGraveyard_Classic/anundeadfighterNarrowPath.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.08.14 04:08:57
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 3, -3, 2, 8, 15)
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end