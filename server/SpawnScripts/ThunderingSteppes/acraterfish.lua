--[[
    Script Name    : SpawnScripts/ThunderingSteppes/acraterfish.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.03.22 03:03:27
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