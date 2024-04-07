--[[
    Script Name    : SpawnScripts/DownBelow/forgotten_soul3061.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.04.24 07:04:56
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BaseSkeleton2.lua")
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
	MovementLoopAddLocation(NPC, -199.54, 0, -37.52, 2, 0)
	MovementLoopAddLocation(NPC, -216.63, 0.02, -55.18, 2, 0)
	MovementLoopAddLocation(NPC, -218.73, -0.01, -62.73, 2, 0)
	MovementLoopAddLocation(NPC, -217.76, -0.1, -83.71, 2, 0)
	MovementLoopAddLocation(NPC, -208.06, -0.07, -92.51, 2, 0)
	MovementLoopAddLocation(NPC, -188.84, -0.04, -93.37, 2, 5)
	MovementLoopAddLocation(NPC, -180.13, -0.3, -87.34, 2, 0)
	MovementLoopAddLocation(NPC, -176.22, -0.23, -77.72, 2, 0)
	MovementLoopAddLocation(NPC, -176.17, -0.24, -74.87, 2, 0)
	MovementLoopAddLocation(NPC, -186.59, -0.09, -73.54, 2, 0)
	MovementLoopAddLocation(NPC, -191.26, -0.05, -66.75, 2, 5)
	MovementLoopAddLocation(NPC, -189.88, 0.46, -47.75, 2, 0)
	MovementLoopAddLocation(NPC, -181.1, -0.16, -38.61, 2, 0)
	MovementLoopAddLocation(NPC, -190.32, 0, -30.58, 2, 0)
	MovementLoopAddLocation(NPC, -199.54, 0, -37.52, 2, 5)
end

