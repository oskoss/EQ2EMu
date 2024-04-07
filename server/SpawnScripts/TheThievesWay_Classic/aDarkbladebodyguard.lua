--[[
    Script Name    : SpawnScripts/TheThievesWay_Classic/aDarkbladebodyguard.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.12.02 04:12:33
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    halfelf(NPC,Spawn)
    IdleAggressive(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end