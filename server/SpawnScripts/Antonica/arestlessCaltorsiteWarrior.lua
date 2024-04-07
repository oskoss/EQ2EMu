--[[
    Script Name    : SpawnScripts/Antonica/arestlessCaltorsiteWarrior.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.07.05 09:07:35
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 12, -12, 2, 0, 0)
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end