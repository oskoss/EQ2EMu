--[[
    Script Name    : SpawnScripts/TheThievesWay_Classic/asludgewalkerhatchlingPath1.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.12.08 04:12:40
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
	MovementLoopAddLocation(NPC, -40.67, 0.71, 47.92, 2, MakeRandomInt(3,6))
	MovementLoopAddLocation(NPC, -40.67, 0.71, 47.92, 2, 0)
	MovementLoopAddLocation(NPC, -32.66, -0.3, 47.77, 2, 0)
	MovementLoopAddLocation(NPC, -32.44, 0.07, 51.54, 2, 0)
	MovementLoopAddLocation(NPC, -32.29, 0.72, 77.62, 2, MakeRandomInt(3,6))
	MovementLoopAddLocation(NPC, -32.29, 0.72, 77.62, 2, 0)
	MovementLoopAddLocation(NPC, -32.09, -0.43, 67.14, 2, 0)
	MovementLoopAddLocation(NPC, -12.43, 0.62, 66.81, 2, 0)
	MovementLoopAddLocation(NPC, -12.36, 0.71, 62.86, 2, MakeRandomInt(3,6))
	MovementLoopAddLocation(NPC, -12.36, 0.71, 62.86, 2, 0)
	MovementLoopAddLocation(NPC, -13.61, -0.01, 75.17, 2, 0)
	MovementLoopAddLocation(NPC, -26.34, 0.71, 75.59, 2, MakeRandomInt(3,6))
	MovementLoopAddLocation(NPC, -26.34, 0.71, 75.59, 2, 0)
	MovementLoopAddLocation(NPC, -23.72, 0.71, 75.72, 2, 0)
	MovementLoopAddLocation(NPC, -22.6, -0.08, 68.46, 2, 0)
	MovementLoopAddLocation(NPC, -22.25, -0.17, 49.39, 2, MakeRandomInt(3,6))
	MovementLoopAddLocation(NPC, -22.25, -0.17, 49.39, 2, 0)
	MovementLoopAddLocation(NPC, -21.6, -0.66, 56.13, 2, 0)
	MovementLoopAddLocation(NPC, -26.75, -0.1, 56.62, 2, 0)
	MovementLoopAddLocation(NPC, -34.92, -0.31, 56.7, 2, 0)
	MovementLoopAddLocation(NPC, -41.69, 0.71, 56.44, 2, 0)
end
