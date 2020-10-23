--[[
	Script Name		:	rifter_hatchling2.lua
	Script Purpose	:	Waypoint Path for rifter_hatchling2.lua
	Script Author	:	Devn00b
	Script Date		:	05/13/2020 02:19:49 PM
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
	MovementLoopAddLocation(NPC, -115.98, -0.05, -117.27, 2, math.random(0,20))
	MovementLoopAddLocation(NPC, -120.55, 0.55, -120.58, 2, math.random(0,20))
	MovementLoopAddLocation(NPC, -125.51, -0.1, -127.52, 2, math.random(0,20))
	MovementLoopAddLocation(NPC, -129.2, -0.07, -136.02, 2, math.random(0,20))
	MovementLoopAddLocation(NPC, -140.54, -0.06, -137.48, 2, math.random(0,20))
	MovementLoopAddLocation(NPC, -150.66, -0.02, -138.3, 2, math.random(0,20))
	MovementLoopAddLocation(NPC, -158.51, 0.01, -133.87, 2, math.random(0,20))
	MovementLoopAddLocation(NPC, -158.55, -0.11, -119.11, 2, math.random(0,20))
	MovementLoopAddLocation(NPC, -157.31, 0.42, -107.5, 2, math.random(0,20))
	MovementLoopAddLocation(NPC, -153.54, -0.06, -96.55, 2, math.random(0,20))
	MovementLoopAddLocation(NPC, -149.78, -0.11, -83.57, 2, math.random(0,20))
	MovementLoopAddLocation(NPC, -163.36, -0.24, -75.76, 2, math.random(0,20))
	MovementLoopAddLocation(NPC, -169.26, -0.26, -73.51, 2, math.random(0,20))
	MovementLoopAddLocation(NPC, -163.36, -0.24, -75.76, 2, math.random(0,20))
	MovementLoopAddLocation(NPC, -149.78, -0.11, -83.57, 2, math.random(0,20))
	MovementLoopAddLocation(NPC, -153.54, -0.06, -96.55, 2, math.random(0,20))
	MovementLoopAddLocation(NPC, -157.31, 0.42, -107.5, 2, math.random(0,20))
	MovementLoopAddLocation(NPC, -158.55, -0.11, -119.11, 2, math.random(0,20))
	MovementLoopAddLocation(NPC, -158.51, 0.01, -133.87, 2, math.random(0,20))
	MovementLoopAddLocation(NPC, -150.66, -0.02, -138.3, 2, math.random(0,20))
	MovementLoopAddLocation(NPC, -140.54, -0.06, -137.48, 2, math.random(0,20))
	MovementLoopAddLocation(NPC, -129.2, -0.07, -136.02, 2, math.random(0,20))
	MovementLoopAddLocation(NPC, -125.51, -0.1, -127.52, 2, math.random(0,20))
	MovementLoopAddLocation(NPC, -120.55, 0.55, -120.58, 2, math.random(0,20))
	MovementLoopAddLocation(NPC, -115.98, -0.05, -117.27, 2, math.random(0,20))
end


