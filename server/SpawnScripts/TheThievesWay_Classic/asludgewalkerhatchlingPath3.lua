--[[
    Script Name    : SpawnScripts/TheThievesWay_Classic/asludgewalkerhatchlingPath3.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.12.08 04:12:49
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
	MovementLoopAddLocation(NPC, -12.89, 0.23, 75.97, 2, MakeRandomInt(3,6))
	MovementLoopAddLocation(NPC, -12.89, 0.23, 75.97, 2, 0)
	MovementLoopAddLocation(NPC, -13.4, 0.71, 62.65, 2, MakeRandomInt(3,6))
	MovementLoopAddLocation(NPC, -13.4, 0.71, 62.65, 2, 0)
	MovementLoopAddLocation(NPC, -13.24, 0.11, 75.1, 2, 0)
	MovementLoopAddLocation(NPC, -19.31, 0.71, 75.53, 2, MakeRandomInt(3,6))
	MovementLoopAddLocation(NPC, -19.31, 0.71, 75.53, 2, 0)
	MovementLoopAddLocation(NPC, -14.14, -0.02, 74.3, 2, 0)
	MovementLoopAddLocation(NPC, -13.87, 0.49, 67.42, 2, 0)
	MovementLoopAddLocation(NPC, -21.71, 0.06, 66.97, 2, 0)
	MovementLoopAddLocation(NPC, -22.15, -0.66, 57.62, 2, 0)
	MovementLoopAddLocation(NPC, -26.28, -0.1, 57.53, 2, 0)
	MovementLoopAddLocation(NPC, -31.73, -0.66, 56.88, 2, 0)
	MovementLoopAddLocation(NPC, -32.24, -0.66, 61.43, 2, 0)
	MovementLoopAddLocation(NPC, -32.18, -0.66, 64.7, 2, 0)
	MovementLoopAddLocation(NPC, -34.38, -0.4, 65.75, 2, 0)
	MovementLoopAddLocation(NPC, -41.12, 0.71, 66.16, 2, 0)
	MovementLoopAddLocation(NPC, -41.89, 0.71, 61.89, 2, MakeRandomInt(3,6))
	MovementLoopAddLocation(NPC, -41.89, 0.71, 61.89, 2, 0)
	MovementLoopAddLocation(NPC, -41.31, 0.71, 65.31, 2, 0)
	MovementLoopAddLocation(NPC, -32.65, -0.54, 66.29, 2, 0)
	MovementLoopAddLocation(NPC, -23.47, 0.06, 66.14, 2, 0)
	MovementLoopAddLocation(NPC, -14.02, 0.46, 66.36, 2, 0)
	MovementLoopAddLocation(NPC, -13.38, 0.69, 63.72, 2, MakeRandomInt(3,6))
	MovementLoopAddLocation(NPC, -13.38, 0.69, 63.72, 2, 0)
	MovementLoopAddLocation(NPC, -13.72, 0.51, 66.44, 2, 0)
	MovementLoopAddLocation(NPC, -22.12, 0.06, 66.87, 2, 0)
	MovementLoopAddLocation(NPC, -21.88, 0.71, 75.72, 2, 0)
end

