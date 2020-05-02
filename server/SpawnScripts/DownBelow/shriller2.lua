--[[
	Script Name		:	shriller2.lua
	Script Purpose	:	Waypoint Path for shriller2.lua
	Script Author	:	Devn00b
	Script Date		:	04/28/2020 10:23:27 PM
	Script Notes	:	Locations collected from Live
--]]

function spawn(NPC)
	waypoints(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
 waypoints(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, -12.05, -0.08, -28.52, 2, 1)
	MovementLoopAddLocation(NPC, -13.49, -0.07, -29.79, 2, 0)
	MovementLoopAddLocation(NPC, -9.39, -0.06, -34.39, 2, 0)
	MovementLoopAddLocation(NPC, -15.69, 0.44, -44.31, 2, 0)
	MovementLoopAddLocation(NPC, -9.51, -0.07, -34.69, 2, 0)
	MovementLoopAddLocation(NPC, -2.96, -0.08, -31.29, 2, 0)
	MovementLoopAddLocation(NPC, -0.58, 0.5, -26.62, 2, 0)
	MovementLoopAddLocation(NPC, -0.15, -0.09, -11.86, 2, 1)
	MovementLoopAddLocation(NPC, -0.58, 0.5, -26.62, 2, 0)
	MovementLoopAddLocation(NPC, -2.96, -0.08, -31.29, 2, 0)
	MovementLoopAddLocation(NPC, -9.51, -0.07, -34.69, 2, 0)
	MovementLoopAddLocation(NPC, -15.69, 0.44, -44.31, 2, 0)
	MovementLoopAddLocation(NPC, -9.39, -0.06, -34.39, 2, 0)
	MovementLoopAddLocation(NPC, -13.49, -0.07, -29.79, 2, 0)
	MovementLoopAddLocation(NPC, -12.05, -0.08, -28.52, 2, 1)
end


