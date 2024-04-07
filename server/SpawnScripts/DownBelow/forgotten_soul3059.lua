--[[
    Script Name    : SpawnScripts/DownBelow/forgotten_soul3059.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.04.24 07:04:29
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
	MovementLoopAddLocation(NPC, -213.09, -0.13, -50.92, 2, 0)
	MovementLoopAddLocation(NPC, -217.78, 0.03, -56.4, 2, 0)
	MovementLoopAddLocation(NPC, -219.08, -0.04, -76.79, 2, 0)
	MovementLoopAddLocation(NPC, -216.47, -0.07, -83.98, 2, 0)
	MovementLoopAddLocation(NPC, -208.04, -0.08, -92.25, 2, 0)
	MovementLoopAddLocation(NPC, -188.43, -0.05, -92.93, 2, 0)
	MovementLoopAddLocation(NPC, -179.78, -0.31, -87.74, 2, 0)
	MovementLoopAddLocation(NPC, -175.24, -0.23, -78.04, 2, 0)
	MovementLoopAddLocation(NPC, -175.91, -0.25, -73.11, 2, 0)
	MovementLoopAddLocation(NPC, -189.07, 0.41, -71.84, 2, 0)
	MovementLoopAddLocation(NPC, -191.94, -0.11, -62.75, 2, 0)
	MovementLoopAddLocation(NPC, -190.56, 0.46, -47.61, 2, 0)
	MovementLoopAddLocation(NPC, -181.95, -0.16, -39.35, 2, 0)
	MovementLoopAddLocation(NPC, -189.66, 0, -31.12, 2, 0)
	MovementLoopAddLocation(NPC, -199.15, 0, -37.34, 2, 0)
	MovementLoopAddLocation(NPC, -211.24, -0.65, -49.38, 2, 0)
end

