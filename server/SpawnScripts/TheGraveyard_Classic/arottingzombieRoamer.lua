--[[
    Script Name    : SpawnScripts/TheGraveyard_Classic/arottingzombieRoamer.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.08.15 08:08:35
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 5, -5, 2, 8, 15)
    SetSpawnAnimation(NPC, 13016)
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end