--[[
	Script Name		:	forgotten_soul2.lua
	Script Purpose	:	Waypoint Path for forgotten_soul2.lua
	Script Author	:	Devn00b
	Script Date		:	05/14/2020 12:15:18 PM
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
	MovementLoopAddLocation(NPC, -195.98, -0.06, -93.08, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -198.07, -0.08, -99.13, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -195.48, -0.03, -104.65, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -185.08, -0.1, -106.6, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -181.24, -0.05, -109.84, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -189.18, -0.12, -106.14, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -195.48, -0.05, -103.88, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -199.4, -0.03, -94.8, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -208.64, -0.06, -92.64, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -213.03, -0.07, -88.12, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -218.99, -0.1, -94.43, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -214.1, -0.08, -87.15, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -217.2, -0.08, -81.13, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -218.54, -0.01, -68.08, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -218.28, 0.02, -57.31, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -208.4, -0.88, -45.41, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -202.18, 0.14, -39.25, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -207.32, -0.9, -47.54, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -217.37, 0.02, -56.76, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -218.21, 0.16, -64.95, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -216.75, -0.09, -82, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -213.62, -0.07, -87.37, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -218.97, -0.11, -95.4, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -213.67, -0.01, -89.99, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -208.59, -0.06, -94.28, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -198.3, -0.02, -94.98, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -185.47, -0.07, -94.11, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -178.29, -0.25, -85.38, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -175.36, -0.26, -74.28, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -187.32, 0.11, -72.57, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -191.78, -0.05, -65.87, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -191.66, -0.11, -61.79, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -199.25, -0.09, -59.89, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -191.66, -0.11, -61.79, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -191.78, -0.05, -65.87, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -187.32, 0.11, -72.57, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -175.36, -0.26, -74.28, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -178.29, -0.25, -85.38, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -185.47, -0.07, -94.11, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -198.3, -0.02, -94.98, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -208.59, -0.06, -94.28, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -213.67, -0.01, -89.99, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -218.97, -0.11, -95.4, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -213.62, -0.07, -87.37, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -216.75, -0.09, -82, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -218.21, 0.16, -64.95, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -217.37, 0.02, -56.76, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -207.32, -0.9, -47.54, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -202.18, 0.14, -39.25, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -208.4, -0.88, -45.41, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -218.28, 0.02, -57.31, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -218.54, -0.01, -68.08, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -217.2, -0.08, -81.13, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -214.1, -0.08, -87.15, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -218.99, -0.1, -94.43, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -213.03, -0.07, -88.12, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -208.64, -0.06, -92.64, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -199.4, -0.03, -94.8, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -195.48, -0.05, -103.88, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -189.18, -0.12, -106.14, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -181.24, -0.05, -109.84, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -185.08, -0.1, -106.6, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -195.48, -0.03, -104.65, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -198.07, -0.08, -99.13, 2, math.random(0,5))
	MovementLoopAddLocation(NPC, -195.98, -0.06, -93.08, 2, math.random(0,5))
end


