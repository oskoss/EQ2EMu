--[[
    Script Name    : SpawnScripts/TheThievesWay_Classic/asludgewalkerhatchlingPath2.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.12.08 04:12:34
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
	MovementLoopAddLocation(NPC, -42.08, 0.71, 75.62, 2, MakeRandomInt(3,6))
	MovementLoopAddLocation(NPC, -42.08, 0.71, 75.62, 2, 0)
	MovementLoopAddLocation(NPC, -32.78, -0.08, 75.27, 2, 0)
	MovementLoopAddLocation(NPC, -32.07, -0.49, 66.73, 2, 0)
	MovementLoopAddLocation(NPC, -23.58, 0.06, 66.57, 2, 0)
	MovementLoopAddLocation(NPC, -22.67, 0.05, 62.41, 2, MakeRandomInt(3,6))
	MovementLoopAddLocation(NPC, -22.67, 0.05, 62.41, 2, 0)
	MovementLoopAddLocation(NPC, -22.24, 0.06, 66.51, 2, 0)
	MovementLoopAddLocation(NPC, -22.32, 0.71, 75.83, 2, 0)
	MovementLoopAddLocation(NPC, -26.54, 0.71, 75.71, 2, MakeRandomInt(3,6))
	MovementLoopAddLocation(NPC, -26.54, 0.71, 75.71, 2, 0)
	MovementLoopAddLocation(NPC, -22.98, 0.71, 75.28, 2, 0)
	MovementLoopAddLocation(NPC, -22.34, 0.06, 67.89, 2, 0)
	MovementLoopAddLocation(NPC, -31.36, -0.52, 66.46, 2, 0)
	MovementLoopAddLocation(NPC, -31.86, -0.66, 61.9, 2, MakeRandomInt(3,6))
	MovementLoopAddLocation(NPC, -31.86, -0.66, 61.9, 2, 0)
	MovementLoopAddLocation(NPC, -31.23, -0.57, 66.08, 2, 0)
	MovementLoopAddLocation(NPC, -41.7, 0.71, 66.8, 2, 0)
end

