--[[
    Script Name    : SpawnScripts/ThunderingSteppes/aSabertoothhunter.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.03.22 04:03:44
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