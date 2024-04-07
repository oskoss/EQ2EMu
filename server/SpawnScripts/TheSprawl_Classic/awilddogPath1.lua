--[[
    Script Name    : SpawnScripts/TheSprawl_Classic/awilddogPath1.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.11.26 09:11:54
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
	MovementLoopAddLocation(NPC, -45.62, -2.67, 91.25, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -45.62, -2.67, 91.25, 2, 0)
	MovementLoopAddLocation(NPC, -38.28, -2.61, 91.58, 2, 0)
	MovementLoopAddLocation(NPC, -28.85, -2.47, 87.61, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -28.85, -2.47, 87.61, 2, 0)
	MovementLoopAddLocation(NPC, -35.43, -2.52, 88.5, 2, 0)
	MovementLoopAddLocation(NPC, -44.15, -2.67, 84.27, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -44.15, -2.67, 84.27, 2, 0)
	MovementLoopAddLocation(NPC, -40.79, -2.52, 88.33, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -40.79, -2.52, 88.33, 2, 0)
	MovementLoopAddLocation(NPC, -33.55, -2.66, 101.9, 2, 0)
	MovementLoopAddLocation(NPC, -35.25, -2.67, 98.71, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -35.25, -2.67, 98.71, 2, 0)
	MovementLoopAddLocation(NPC, -35.39, -2.54, 90.62, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -35.39, -2.54, 90.62, 2, 0)
	MovementLoopAddLocation(NPC, -41.91, -2.52, 86.23, 2, 0)
	MovementLoopAddLocation(NPC, -44.05, -2.6, 80.34, 2, 0)
	MovementLoopAddLocation(NPC, -43.5, -2.58, 75.6, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -43.5, -2.58, 75.6, 2, 0)
	MovementLoopAddLocation(NPC, -42.87, -2.65, 83.59, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -42.87, -2.65, 83.59, 2, 0)
end