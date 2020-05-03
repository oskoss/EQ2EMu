--[[
	Script Name		:	Coffrey.lua
	Script Purpose	:	Waypoint Path for Coffrey.lua
	Script Author	:	Auto Generated
	Script Date		:	04/02/2020 03:22:53 PM
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
	MovementLoopAddLocation(NPC, 373.29, -20.73, 371.98, 2, 0)
	MovementLoopAddLocation(NPC, 361.65, -20.73, 394.13, 2, 0)
	MovementLoopAddLocation(NPC, 250.8, -10.73, 440.87, 2, 0)
	MovementLoopAddLocation(NPC, 166.83, -9.52, 588.67, 2, 0)
end


