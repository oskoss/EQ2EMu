--[[
    Script Name    : SpawnScripts/IsleRefuge1/agiantspider.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.09.05 11:09:11
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