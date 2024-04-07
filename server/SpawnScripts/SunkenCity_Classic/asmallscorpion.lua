--[[
    Script Name    : SpawnScripts/SunkenCity_Classic/asmallscorpion.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.10.13 04:10:58
    Script Purpose : 
                   : 
--]]

require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 5, -5, 2, 8, 15)
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end