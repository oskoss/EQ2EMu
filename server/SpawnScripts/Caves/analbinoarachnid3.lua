--[[
    Script Name    : SpawnScripts/Caves/analbinoarachnid3.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.10.05 10:10:15
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
	MovementLoopAddLocation(NPC, -2.04, 37.87, -36.37, 2, math.random(5,10))
	MovementLoopAddLocation(NPC, 0.84, 37.87, -34.95, 2, 0)
	MovementLoopAddLocation(NPC, 5.31, 37.87, -25.1, 2, math.random(5,10))
	MovementLoopAddLocation(NPC, 5.31, 37.87, -25.1, 2, 0)
	MovementLoopAddLocation(NPC, -4.5, 37.87, -24.27, 2, 0)
	MovementLoopAddLocation(NPC, -8.53, 37.88, -23.19, 2, math.random(5,10))
	MovementLoopAddLocation(NPC, -8.53, 37.88, -23.19, 2, 0)
	MovementLoopAddLocation(NPC, 4.08, 37.87, -35.27, 2, math.random(5,10))
	MovementLoopAddLocation(NPC, 4.08, 37.87, -35.27, 2, 0)
	MovementLoopAddLocation(NPC, -15.12, 37.87, -40.86, 2, math.random(5,10))
	MovementLoopAddLocation(NPC, -15.12, 37.87, -40.86, 2, 0)
	MovementLoopAddLocation(NPC, -7.17, 38.34, -43.27, 2, math.random(5,10))
	MovementLoopAddLocation(NPC, -7.17, 38.34, -43.27, 2, 0)
	MovementLoopAddLocation(NPC, -10.2, 38.01, -61.1, 2, math.random(5,10))
	MovementLoopAddLocation(NPC, -10.2, 38.01, -61.1, 2, 0)
	MovementLoopAddLocation(NPC, -9.82, 38.72, -50.08, 2, 0)
	MovementLoopAddLocation(NPC, 3.36, 37.87, -40.68, 2, math.random(5,10))
	MovementLoopAddLocation(NPC, 3.36, 37.87, -40.68, 2, 0)
	MovementLoopAddLocation(NPC, -2.04, 37.87, -36.37, 2, 0)
end

