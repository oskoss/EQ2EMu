--[[
    Script Name    : SpawnScripts/Classic_forest/arockadder.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.10.11 12:10:27
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end