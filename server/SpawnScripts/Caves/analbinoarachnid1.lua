--[[
    Script Name    : SpawnScripts/Caves/analbinoarachnid1.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.10.05 08:10:30
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
	MovementLoopAddLocation(NPC, -2.73, 38.7, -46.19, 2, math.random(5,10))
	MovementLoopAddLocation(NPC, 1.9, 37.87, -55.85, 2,math.random(5,10))
	MovementLoopAddLocation(NPC, 1.9, 37.87, -55.85, 2, 0)
	MovementLoopAddLocation(NPC, -17.81, 38.72, -56.29, 2, math.random(5,10))
	MovementLoopAddLocation(NPC, -17.81, 38.72, -56.29, 2, 0)
	MovementLoopAddLocation(NPC, 5.24, 37.3, -46.26, 2, math.random(5,10))
	MovementLoopAddLocation(NPC, 5.24, 37.3, -46.26, 2, 0)
	MovementLoopAddLocation(NPC, 2.87, 37.87, -36.13, 2, 0)
	MovementLoopAddLocation(NPC, 12.74, 37.87, -29.4, 2, math.random(5,10))
	MovementLoopAddLocation(NPC, 12.74, 37.87, -29.4, 2, 0)
	MovementLoopAddLocation(NPC, 1.1, 37.87, -27.58, 2, 0)
	MovementLoopAddLocation(NPC, 3.83, 37.87, -36.32, 2, 0)
	MovementLoopAddLocation(NPC, -9.29, 38.18, -42.59, 2, math.random(5,10))
	MovementLoopAddLocation(NPC, -9.29, 38.18, -42.59, 2, 0)
	MovementLoopAddLocation(NPC, -9.28, 38.72, -50.7, 2,math.random(5,10))
	MovementLoopAddLocation(NPC, -9.28, 38.72, -50.7, 2, 0)
	MovementLoopAddLocation(NPC, -9.81, 37.87, -39.81, 2, math.random(5,10))
	MovementLoopAddLocation(NPC, -9.81, 37.87, -39.81, 2, 0)
	MovementLoopAddLocation(NPC, -2.73, 38.7, -46.19, 2, 0)
end

