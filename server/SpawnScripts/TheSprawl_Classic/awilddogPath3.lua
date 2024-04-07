--[[
    Script Name    : SpawnScripts/TheSprawl_Classic/awilddogPath3.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.11.26 09:11:23
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    waypoints(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, -42.02, -2.67, 65.81, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -42.02, -2.67, 65.81, 2, 0)
	MovementLoopAddLocation(NPC, -39.62, -2.67, 61.84, 2, 0)
	MovementLoopAddLocation(NPC, -30.28, -2.67, 51.46, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -30.28, -2.67, 51.46, 2, 0)
	MovementLoopAddLocation(NPC, -33.06, -2.67, 53.53, 2, 0)
	MovementLoopAddLocation(NPC, -39.45, -2.67, 62.01, 2, 0)
	MovementLoopAddLocation(NPC, -39.69, -2.67, 62.33, 2, 0)
	MovementLoopAddLocation(NPC, -43.33, -2.66, 68.16, 2, 0)
	MovementLoopAddLocation(NPC, -43.48, -2.62, 74.44, 2, 0)
	MovementLoopAddLocation(NPC, -44.54, -2.53, 78.63, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -44.54, -2.53, 78.63, 2, 0)
	MovementLoopAddLocation(NPC, -43.19, -2.67, 71.09, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -43.19, -2.67, 71.09, 2, 0)
	MovementLoopAddLocation(NPC, -43.31, -2.6, 75.43, 2, 0)
	MovementLoopAddLocation(NPC, -47.72, -2.53, 80.87, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -47.72, -2.53, 80.87, 2, 0)
	MovementLoopAddLocation(NPC, -43.59, -2.57, 80.01, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -43.59, -2.57, 80.01, 2, 0)
	MovementLoopAddLocation(NPC, -41.78, -2.55, 87.8, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -41.78, -2.55, 87.8, 2, 0)
	MovementLoopAddLocation(NPC, -44.75, -2.67, 85.87, 2, 0)
	MovementLoopAddLocation(NPC, -43.83, -2.53, 76.93, 2, 0)
	MovementLoopAddLocation(NPC, -42.95, -2.67, 67.84, 2, 0)
	MovementLoopAddLocation(NPC, -39.11, -2.66, 61.04, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -39.11, -2.66, 61.04, 2, 0)
end