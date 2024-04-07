--[[
    Script Name    : SpawnScripts/Caves/analbinoarachnid5.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.10.05 11:10:18
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
	MovementLoopAddLocation(NPC, 5.74, 37.62, -52.29, 2, math.random(5,10))
	MovementLoopAddLocation(NPC, -8.89, 37.49, -71.26, 2, math.random(5,10))
	MovementLoopAddLocation(NPC, -8.89, 37.49, -71.26, 2, 0)
	MovementLoopAddLocation(NPC, -7.15, 37.78, -75.67, 2, math.random(5,10))
	MovementLoopAddLocation(NPC, -7.15, 37.78, -75.67, 2, 0)
	MovementLoopAddLocation(NPC, -13.28, 38.72, -53.63, 2, math.random(5,10))
	MovementLoopAddLocation(NPC, -13.28, 38.72, -53.63, 2, 0)
	MovementLoopAddLocation(NPC, -4.73, 38.3, -43.08, 2, math.random(5,10))
	MovementLoopAddLocation(NPC, -4.73, 38.3, -43.08, 2, 0)
	MovementLoopAddLocation(NPC, -4.49, 38.72, -48.29, 2, math.random(5,10))
	MovementLoopAddLocation(NPC, -4.49, 38.72, -48.29, 2, 0)
	MovementLoopAddLocation(NPC, 9.41, 37.34, -41, 2, math.random(5,10))
	MovementLoopAddLocation(NPC, 9.41, 37.34, -41, 2, 0)
	MovementLoopAddLocation(NPC, -0.45, 37.87, -37.73, 2, math.random(5,10))
	MovementLoopAddLocation(NPC, -0.45, 37.87, -37.73, 2, 0)
	MovementLoopAddLocation(NPC, 10.54, 37.64, -52.85, 2, math.random(5,10))
	MovementLoopAddLocation(NPC, 10.54, 37.64, -52.85, 2, 0)
	MovementLoopAddLocation(NPC, 5.74, 37.62, -52.29, 2, 0)
end

