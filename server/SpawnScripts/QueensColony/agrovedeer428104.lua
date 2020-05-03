--[[
        Script Name     :       SpawnScripts/QueensColony/agrovedeer428104.lua
	Script Purpose	:	Waypoint Path for agrovedeer428104.lua
	Script Author	:	Rylec
	Script Date	:	04-19-2020 02:16:28 
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
	MovementLoopAddLocation(NPC, 57.54, -4.26, 216.87, 2, math.random(10, 24))
	MovementLoopAddLocation(NPC, 60.58, -3.96, 217.7, 2, math.random(10, 24))
	MovementLoopAddLocation(NPC, 59.59, -4.06, 215.34, 2, math.random(10, 24))
	MovementLoopAddLocation(NPC, 59.81, -4.05, 216.01, 2, 0)
	MovementLoopAddLocation(NPC, 56.5, -4.25, 219.42, 2, 0)
	MovementLoopAddLocation(NPC, 56.33, -4.25, 220.87, 2, math.random(10, 24))
	MovementLoopAddLocation(NPC, 79.36, -4.25, 217.94, 2, math.random(10, 24))
	MovementLoopAddLocation(NPC, 64.59, -3.8, 215.99, 2, math.random(10, 24))
	MovementLoopAddLocation(NPC, 51.27, -4.31, 222.77, 2, math.random(10, 24))
	MovementLoopAddLocation(NPC, 52.08, -4.24, 220.12, 2, 0)
end


