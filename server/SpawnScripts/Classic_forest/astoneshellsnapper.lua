--[[
    Script Name    : SpawnScripts/Classic_forest/astoneshellsnapper.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.10.11 03:10:08
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    AddTimer(NPC, 6000, "waypoints")
    
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end