--[[
	Script Name		:	devnoobicus.lua
	Script Purpose	:	Waypoint Path for devnoobicus.lua
	Script Author	:	Auto Generated
	Script Date		:	04/02/2020 03:16:53 PM
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
	MovementLoopAddLocation(NPC, 25.79, 195.46, -1.93, 2, 0)
	MovementLoopAddLocation(NPC, 39.08, 195.46, -10.71, 2, 3)
	MovementLoopAddLocation(NPC, 53.2, 193.92, -20.04, 2, 0)
	MovementLoopAddLocation(NPC, 61.15, 193.89, -25.29, 2, 0)
	MovementLoopAddLocation(NPC, 62.77, 193.49, -45.24, 2, 0)
	MovementLoopAddLocation(NPC, 68.4, 192.01, -66.03, 2, 0)
	MovementLoopAddLocation(NPC, 75.75, 188.35, -91.34, 2, 0)
	MovementLoopAddLocation(NPC, 84.67, 185.35, -122.09, 2, 0)
end


