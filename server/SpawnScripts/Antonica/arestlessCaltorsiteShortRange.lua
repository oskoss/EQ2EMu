--[[
    Script Name    : SpawnScripts/Antonica/arestlessCaltorsiteShortRange.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.02.02 09:02:23
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 8, -8, 2, 0, 0)
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end