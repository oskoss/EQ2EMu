--[[
    Script Name    : SpawnScripts/Peatbog_Classic/alargescavengerRoam.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.11.01 04:11:30
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 9, -9, 2, 8, 15)
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end