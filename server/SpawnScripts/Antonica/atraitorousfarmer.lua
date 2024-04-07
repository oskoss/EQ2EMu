--[[
    Script Name    : SpawnScripts/Antonica/atraitorousfarmer.lua
    Script Author  : Dorbin
    Script Date    : 2023.04.30 12:04:16
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/ForestersAntonica.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 8, -8, 2, 8, 15)
    human(NPC)
end


function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end