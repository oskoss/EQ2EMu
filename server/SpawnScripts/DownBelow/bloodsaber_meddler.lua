--[[
	Script Name		:	bloodsaber_meddler.lua
	Script Purpose	:	Waypoint Path for bloodsaber_meddler.lua
	Script Author	:	Devn00b
	Script Date		:	04/28/2020 05:46:55 PM
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
	MovementLoopAddLocation(NPC, 25.52, -4, -135.79, 2, 7)
	MovementLoopAddLocation(NPC, 12.83, 0, -139.02, 2, 5)
	MovementLoopAddLocation(NPC, 22.94, -3.75, -139.65, 2, 5)
	MovementLoopAddLocation(NPC, 11.87, 0.26, -139.55, 2, 5)
	MovementLoopAddLocation(NPC, 19.84, -2.23, -137.35, 2, 5)
	MovementLoopAddLocation(NPC, 11.95, 0.07, -135.76, 2, 5)
	MovementLoopAddLocation(NPC, 27.85, -4, -139.55, 2, 5)
end



