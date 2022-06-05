--[[
	Script Name		:	bloodsaber_initiate3.lua
	Script Purpose	:	Waypoint Path for bloodsaber_initiate3.lua
	Script Author	:	Devn00b
	Script Date		:	04/28/2020 05:57:35 PM
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
	MovementLoopAddLocation(NPC, 5.28, 0, -118.84, 2, 5)
	MovementLoopAddLocation(NPC, 10.65, 0, -122.66, 2, 5)
	MovementLoopAddLocation(NPC, 6.04, 0, -119.85, 2, 5)
	MovementLoopAddLocation(NPC, 11.72, 0, -123.32, 2, 5)
	MovementLoopAddLocation(NPC, 11.22, 0, -118.37, 2, 5)
	MovementLoopAddLocation(NPC, 7.37, 0, -130.11, 2, 5)
	MovementLoopAddLocation(NPC, 11.02, 0, -125.83, 2, 5)
	MovementLoopAddLocation(NPC, 7.23, 0.18, -132.72, 2, 5)
	MovementLoopAddLocation(NPC, 3.99, 0, -121.36, 2, 5)
end



