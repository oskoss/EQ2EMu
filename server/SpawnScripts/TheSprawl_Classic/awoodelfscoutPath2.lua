--[[
    Script Name    : SpawnScripts/TheSprawl_Classic/awoodelfscoutPath2.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.11.24 10:11:54
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"
dofile("SpawnScripts/Generic/MonsterCallouts/QeynosAgitator.lua")

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    woodelf(NPC)
    waypoints(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, -4, -2.67, 14.76, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -4, -2.67, 14.76, 2, 0)
	MovementLoopAddLocation(NPC, 1.24, -2.67, 16.52, 2, 0)
	MovementLoopAddLocation(NPC, 4.67, -2.67, 19.55, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 4.67, -2.67, 19.55, 2, 0)
	MovementLoopAddLocation(NPC, -1, -2.67, 15.56, 2, 0)
	MovementLoopAddLocation(NPC, -5.77, -2.66, 8.87, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -5.77, -2.66, 8.87, 2, 0)
	MovementLoopAddLocation(NPC, -5.88, -2.66, 12.08, 2, 0)
	MovementLoopAddLocation(NPC, -7.83, -2.67, 18.73, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -7.83, -2.67, 18.73, 2, 0)
	MovementLoopAddLocation(NPC, -6.4, -2.67, 14.56, 2, 0)
	MovementLoopAddLocation(NPC, -4.63, -2.67, 6.19, 2, 0)
	MovementLoopAddLocation(NPC, -6.72, -2.67, 1.85, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -6.72, -2.67, 1.85, 2, 0)
	MovementLoopAddLocation(NPC, -3.95, -2.67, 6.95, 2, 0)
	MovementLoopAddLocation(NPC, -3.13, -2.67, 12.87, 2, 0)
	MovementLoopAddLocation(NPC, 2.05, -2.67, 16.63, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 2.05, -2.67, 16.63, 2, 0)
	MovementLoopAddLocation(NPC, 1.74, -2.67, 22.34, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 1.74, -2.67, 22.34, 2, 0)
	MovementLoopAddLocation(NPC, 1.54, -2.67, 11.57, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 1.54, -2.67, 11.57, 2, 0)
	MovementLoopAddLocation(NPC, 0.3, -2.67, 15.88, 2, 0)
	MovementLoopAddLocation(NPC, -9.22, -2.63, 16.85, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -9.22, -2.63, 16.85, 2, 0)
	MovementLoopAddLocation(NPC, -4.07, -2.67, 16.3, 2, 0)
	MovementLoopAddLocation(NPC, 1.48, -2.67, 17.73, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 1.48, -2.67, 17.73, 2, 0)
end

