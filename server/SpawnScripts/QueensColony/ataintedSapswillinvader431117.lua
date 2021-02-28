--[[
        Script Name     :       SpawnScripts/QueensColony/ataintedSapswillinvader431117.lua
	Script Purpose	:	Waypoint Path for ataintedSapswillinvader431117.lua
	Script Author	:	Rylec
	Script Date	:	11-19-2020 05:12:27 
	Script Notes	:	Locations collected from Live
--]]

function spawn(NPC)
	waypoints(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
        spawn(NPC)
end

function waypoints(NPC)
	MoveToLocation(NPC, 180.76, -3.55, 168.22, 2)
	MoveToLocation(NPC, 158.84, -2.97, 168.71, 2)
	MoveToLocation(NPC, 152.29, -2.91, 169.79, 2)
	MoveToLocation(NPC, 83.92, -4.54, 171.92, 2)
	MoveToLocation(NPC, 72.49, -4.30, 170.27, 2, "waypointsLoop")
end

function waypointsLoop(NPC)
	MovementLoopAddLocation(NPC, 60.48, -4, 189.65, 2, 0)
	MovementLoopAddLocation(NPC, 72.34, -4.3, 169.86, 2, 0)
	MovementLoopAddLocation(NPC, 67.34, -4.28, 154.56, 2, 0)
	MovementLoopAddLocation(NPC, 71.9, -4.3, 170.88, 2, 0)
end