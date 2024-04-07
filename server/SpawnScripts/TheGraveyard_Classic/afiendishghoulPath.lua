--[[
    Script Name    : SpawnScripts/TheGraveyard_Classic/afiendishghoulPath.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.08.14 08:08:20
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    SetSpawnAnimation(NPC, 13016)
    waypoints(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, 0.37, -7.1, 24.92, 2, math.random(10,15))
	MovementLoopAddLocation(NPC, 0.37, -7.1, 24.92, 2, 0)
	MovementLoopAddLocation(NPC, -2.01, -7.29, 27.12, 2, 0)
	MovementLoopAddLocation(NPC, -2.01, -7.29, 27.12, 2, math.random(10,15))
	MovementLoopAddLocation(NPC, -1.09, -7.22, 33.07, 2, 0)
	MovementLoopAddLocation(NPC, -0.21, -7.29, 39.61, 2, 0)
	MovementLoopAddLocation(NPC, 0.24, -7.19, 50.39, 2, 0)
	MovementLoopAddLocation(NPC, -2.83, -7.36, 53.29, 2, 0)
	MovementLoopAddLocation(NPC, -4.47, -7.49, 53.43, 2, 0)
	MovementLoopAddLocation(NPC, -4.47, -7.49, 53.43, 2, math.random(10,15))
	MovementLoopAddLocation(NPC, -2.42, -7.32, 52.88, 2, 0)
	MovementLoopAddLocation(NPC, -0.85, -7.21, 49.98, 2, 0)
	MovementLoopAddLocation(NPC, -2.88, -7.36, 39.25, 2, 0)
	MovementLoopAddLocation(NPC, -2.88, -7.36, 39.25, 2, math.random(10,15))
	MovementLoopAddLocation(NPC, -1.17, -7.22, 30.63, 2, 0)
	MovementLoopAddLocation(NPC, -1.17, -7.22, 30.63, 2, math.random(10,15))
	MovementLoopAddLocation(NPC, 0.55, -7.23, 33.99, 2, 0)
	MovementLoopAddLocation(NPC, 0.3, -7.25, 37.32, 2, 0)
	MovementLoopAddLocation(NPC, 0.37, -7.25, 41.51, 2, 0)
	MovementLoopAddLocation(NPC, -2.84, -7.37, 43.88, 2, 0)
	MovementLoopAddLocation(NPC, -5.96, -7.61, 45.13, 2, 0)
	MovementLoopAddLocation(NPC, -5.96, -7.61, 45.13, 2, math.random(10,15))
	MovementLoopAddLocation(NPC, -4.59, -7.5, 44.66, 2, 0)
	MovementLoopAddLocation(NPC, -3.5, -7.42, 43.41, 2, 0)
end

