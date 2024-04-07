--[[
    Script Name    : SpawnScripts/Caves/analbinoarachnid2.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.10.05 10:10:35
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
	MovementLoopAddLocation(NPC, -6.02, 38.72, -53.84, 2, math.random(5,10))
	MovementLoopAddLocation(NPC, -2.99, 38.25, -56.9, 2, math.random(5,10))
	MovementLoopAddLocation(NPC, -2.99, 38.25, -56.9, 2, 0)
	MovementLoopAddLocation(NPC, -7.82, 37.9, -40.97, 2, 0)
	MovementLoopAddLocation(NPC, -15.16, 37.87, -40.58, 2, math.random(5,10))
	MovementLoopAddLocation(NPC, -15.16, 37.87, -40.58, 2, 0)
	MovementLoopAddLocation(NPC, -0.99, 37.87, -25.41, 2, math.random(5,10))
	MovementLoopAddLocation(NPC, -0.99, 37.87, -25.41, 2, 0)
	MovementLoopAddLocation(NPC, -3.47, 37.87, -30.42, 2, 0)
	MovementLoopAddLocation(NPC, 7.91, 37.14, -44.78, 2, math.random(5,10))
	MovementLoopAddLocation(NPC, 7.91, 37.14, -44.78, 2, 0)
	MovementLoopAddLocation(NPC, -10.02, 37.87, -37.48, 2, math.random(5,10))
	MovementLoopAddLocation(NPC, -10.02, 37.87, -37.48, 2, 0)
	MovementLoopAddLocation(NPC, -15.52, 38.64, -52.3, 2, math.random(5,10))
	MovementLoopAddLocation(NPC, -15.52, 38.64, -52.3, 2, 0)
	MovementLoopAddLocation(NPC, -6.02, 38.72, -53.84, 2, 0)
end

