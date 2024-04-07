--[[
    Script Name    : SpawnScripts/TheSprawl_Classic/awilddogPath2.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.11.26 09:11:19
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
	MovementLoopAddLocation(NPC, -9.22, -1.64, 76.17, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -9.22, -1.64, 76.17, 2, 0)
	MovementLoopAddLocation(NPC, -7.89, -1.64, 70.42, 2, 0)
	MovementLoopAddLocation(NPC, -8.24, -2.17, 66.23, 2, 0)
	MovementLoopAddLocation(NPC, -8.18, -2.52, 63.68, 2, 0)
	MovementLoopAddLocation(NPC, -7.57, -2.66, 60.06, 2, 0)
	MovementLoopAddLocation(NPC, -10.74, -2.52, 54.67, 2, 0)
	MovementLoopAddLocation(NPC, -12.18, -2.52, 53.05, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -12.18, -2.52, 53.05, 2, 0)
	MovementLoopAddLocation(NPC, -9.63, -2.52, 55.28, 2, 0)
	MovementLoopAddLocation(NPC, -8.48, -2.56, 57.9, 2, 0)
	MovementLoopAddLocation(NPC, -8.34, -2.45, 64.15, 2, 0)
	MovementLoopAddLocation(NPC, -7.74, -1.64, 73.05, 2, 0)
	MovementLoopAddLocation(NPC, -11.32, -1.54, 78.58, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -11.32, -1.54, 78.58, 2, 0)
	MovementLoopAddLocation(NPC, -9.2, -1.64, 77.18, 2, 0)
	MovementLoopAddLocation(NPC, -3.97, -1.51, 77.5, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -3.97, -1.51, 77.5, 2, 0)
	MovementLoopAddLocation(NPC, -8.52, -1.64, 77.61, 2, 0)
	MovementLoopAddLocation(NPC, -13.13, -1.57, 80.19, 2, 0)
	MovementLoopAddLocation(NPC, -19.57, -2.22, 83.37, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -19.57, -2.22, 83.37, 2, 0)
	MovementLoopAddLocation(NPC, -13.24, -1.57, 80.44, 2, 0)
	MovementLoopAddLocation(NPC, -8.81, -1.64, 74.49, 2, 0)
	MovementLoopAddLocation(NPC, -8.43, -1.64, 72.53, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -8.43, -1.64, 72.53, 2, 0)
	MovementLoopAddLocation(NPC, -6.35, -1.64, 75.92, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -6.35, -1.64, 75.92, 2, 0)
	MovementLoopAddLocation(NPC, -7.51, -1.89, 68.01, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -7.51, -1.89, 68.01, 2, 0)
	MovementLoopAddLocation(NPC, -7.96, -1.64, 74.98, 2, 0)
	MovementLoopAddLocation(NPC, -13.25, -1.57, 79.55, 2, 0)
	MovementLoopAddLocation(NPC, -21.85, -2.42, 83.5, 2, 0)
	MovementLoopAddLocation(NPC, -27.53, -2.47, 86.98, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -27.53, -2.47, 86.98, 2, 0)
	MovementLoopAddLocation(NPC, -20.81, -2.31, 85.58, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -20.81, -2.31, 85.58, 2, 0)
	MovementLoopAddLocation(NPC, -25.42, -2.47, 85.52, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -25.42, -2.47, 85.52, 2, 0)
	MovementLoopAddLocation(NPC, -14.14, -1.6, 81.65, 2, 0)
end

