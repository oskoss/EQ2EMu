--[[
    Script Name    : SpawnScripts/TheThievesWay_Classic/asludgewalkerhatchlingPath4.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.12.08 04:12:19
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
	MovementLoopAddLocation(NPC, -13.49, 0.71, 47.31, 2, MakeRandomInt(3,6))
	MovementLoopAddLocation(NPC, -13.49, 0.71, 47.31, 2, 0)
	MovementLoopAddLocation(NPC, -22.93, -0.17, 48.38, 2, 0)
	MovementLoopAddLocation(NPC, -22.46, -0.66, 56.47, 2, 0)
	MovementLoopAddLocation(NPC, -22.5, 0.02, 61.37, 2, MakeRandomInt(3,6))
	MovementLoopAddLocation(NPC, -22.5, 0.02, 61.37, 2, 0)
	MovementLoopAddLocation(NPC, -22.93, -0.66, 57.34, 2, 0)
	MovementLoopAddLocation(NPC, -27.31, -0.1, 56.78, 2, 0)
	MovementLoopAddLocation(NPC, -31.16, -0.61, 56.99, 2, 0)
	MovementLoopAddLocation(NPC, -32.17, -0.66, 61.6, 2, MakeRandomInt(3,6))
	MovementLoopAddLocation(NPC, -32.17, -0.66, 61.6, 2, 0)
	MovementLoopAddLocation(NPC, -32.31, 0.07, 52.15, 2, MakeRandomInt(3,6))
	MovementLoopAddLocation(NPC, -32.31, 0.07, 52.15, 2, 0)
	MovementLoopAddLocation(NPC, -32.21, -0.66, 56.25, 2, 0)
	MovementLoopAddLocation(NPC, -40.83, 0.71, 57.1, 2, 0)
	MovementLoopAddLocation(NPC, -41.46, 0.71, 61.02, 2, MakeRandomInt(3,6))
	MovementLoopAddLocation(NPC, -41.46, 0.71, 61.02, 2, 0)
	MovementLoopAddLocation(NPC, -41.38, 0.71, 52.89, 2, MakeRandomInt(3,6))
	MovementLoopAddLocation(NPC, -41.38, 0.71, 52.89, 2, 0)
	MovementLoopAddLocation(NPC, -41.61, 0.71, 65.67, 2, 0)
	MovementLoopAddLocation(NPC, -32.86, -0.56, 66.15, 2, 0)
	MovementLoopAddLocation(NPC, -23.29, 0.06, 66.06, 2, 0)
	MovementLoopAddLocation(NPC, -22.82, 0.05, 62.35, 2, 0)
	MovementLoopAddLocation(NPC, -23.26, -0.66, 56.75, 2, 0)
	MovementLoopAddLocation(NPC, -17.43, 0.46, 57.16, 2, 0)
	MovementLoopAddLocation(NPC, -13.74, -0.02, 57.01, 2, 0)
end

