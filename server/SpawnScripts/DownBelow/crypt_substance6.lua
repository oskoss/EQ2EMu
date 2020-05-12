--[[
	Script Name		:	crypt_substance6.lua
	Script Purpose	:	Waypoint Path for crypt_substance6.lua
	Script Author	:	Devn00b
	Script Date		:	05/10/2020 10:46:20 PM
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
	MovementLoopAddLocation(NPC, 6.32, -0.08, -109.59, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 16.18, 0.14, -100.14, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 11.36, -0.06, -108.4, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 1.34, -0.03, -106.71, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 0.85, -0.02, -101.09, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -3.99, 0.45, -97.51, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -12.71, -0.09, -90.2, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -32.5, 0.07, -108.99, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -35.16, -0.08, -112.79, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -33.84, 0.53, -126.35, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -35.32, -0.01, -132.67, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -41.08, -0.57, -138.33, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -35.32, -0.01, -132.67, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -33.84, 0.53, -126.35, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -35.16, -0.08, -112.79, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -32.5, 0.07, -108.99, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -12.71, -0.09, -90.2, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -3.99, 0.45, -97.51, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 0.85, -0.02, -101.09, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 1.34, -0.03, -106.71, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 11.36, -0.06, -108.4, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 16.18, 0.14, -100.14, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, 6.32, -0.08, -109.59, 2, math.random(0,5))
end


