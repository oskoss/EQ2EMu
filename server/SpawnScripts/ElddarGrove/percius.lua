--[[
	Script Name		:	percius.lua
	Script Purpose	:	Waypoint Path for percius.lua
	Script Author	:	Devn00b
	Script Date		:	08/05/2020 02:39:36 PM
	Script Notes	:	Locations collected from Live
--]]

function spawn(NPC)
	waypoints(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, 558.92, -16.61, -427.07, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 562.75, -17.4, -407.2, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 570.45, -17.77, -402.11, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 584.41, -18.42, -399.5, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 597.07, -18.04, -405.27, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 648.18, -11.73, -395.33, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 594.2, -18.67, -407.75, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 585.32, -18.72, -420.84, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 569.08, -17.86, -422.86, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 561.03, -17.35, -410, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 569.08, -17.86, -422.86, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 585.32, -18.72, -420.84, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 594.2, -18.67, -407.75, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 648.18, -11.73, -395.33, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 597.07, -18.04, -405.27, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 584.41, -18.42, -399.5, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 570.45, -17.77, -402.11, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 562.75, -17.4, -407.2, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 558.92, -16.61, -427.07, 2, math.random(0,5))
end


