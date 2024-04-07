--[[
    Script Name    : SpawnScripts/Antonica/aCaltorsisknight.lua
    Script Author  : theFoof
    Script Date    : 2022.08.09 11:08:14
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 35, -35, 2, 8, 15)
end
function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end