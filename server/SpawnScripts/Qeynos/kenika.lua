--[[
	Script Name		:	kenika.lua
	Script Purpose	:	Waypoint Path for kenika.lua
	Script Author	:	Devn00b additions by Cynnar
	Script Date		:	04/10/2020 02:29:10 PM
	Script Notes	:	Locations collected from Live
--]]


function spawn(NPC)
	SetPlayerProximityFunction(NPC, 10, "InRange", "LeaveRange")
	waypoints(NPC)
end

function respawn(NPC)
	spawn(NPC)
end

function InRange(NPC, Spawn)
end

function LeaveRange(NPC, Spawn)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, 469.88, -11.53, 130.15, 2, 0)
	MovementLoopAddLocation(NPC, 474.56, -11.53, 136.07, 2, 0)
	MovementLoopAddLocation(NPC, 478.76, -11.53, 137.32, 2, 0)
	MovementLoopAddLocation(NPC, 494.74, -11.65, 143.21, 2, 0)
	MovementLoopAddLocation(NPC, 504.88, -11.31, 146.37, 2, 0)
	MovementLoopAddLocation(NPC, 545.21, -10.58, 151.77, 2, 0)
	MovementLoopAddLocation(NPC, 564.25, -10.58, 149.91, 2, 0)
	MovementLoopAddLocation(NPC, 586.13, -10.43, 147.61, 2, 0)
	MovementLoopAddLocation(NPC, 600.5, -12.07, 146.38, 2, 0)
	MovementLoopAddLocation(NPC, 616.28, -12.22, 144.58, 2, 0)
	MovementLoopAddLocation(NPC, 620.96, -12.8, 161.14, 2, 0)
	MovementLoopAddLocation(NPC, 623.53, -16.64, 200.63, 2, 0)
	MovementLoopAddLocation(NPC, 679.34, -19.39, 186.87, 2, 0)
	MovementLoopAddLocation(NPC, 680.59, -19.27, 192.36, 2, 0)
	MovementLoopAddLocation(NPC, 673, -17.95, 193.97, 2, 0)
	MovementLoopAddLocation(NPC, 678.49, -17.95, 211.45, 2, 0)
	MovementLoopAddLocation(NPC, 671.61, -17.95, 213.64, 2, 0)
	MovementLoopAddLocation(NPC, 673.41, -19.58, 219.81, 2, 0)
	MovementLoopAddLocation(NPC, 638.11, -19.11, 230.2, 2, 0)
	MovementLoopAddLocation(NPC, 576.03, -17.87, 240.47, 2, 0)
	MovementLoopAddLocation(NPC, 563.7, -17.72, 241.52, 2, 0)
	MovementLoopAddLocation(NPC, 559.88, -17.59, 239.68, 2, 0)
	MovementLoopAddLocation(NPC, 563.7, -17.72, 241.52, 2, 0)
	MovementLoopAddLocation(NPC, 576.03, -17.87, 240.47, 2, 0)
	MovementLoopAddLocation(NPC, 638.11, -19.11, 230.2, 2, 0)
	MovementLoopAddLocation(NPC, 673.41, -19.58, 219.81, 2, 0)
	MovementLoopAddLocation(NPC, 671.61, -17.95, 213.64, 2, 0)
	MovementLoopAddLocation(NPC, 678.49, -17.95, 211.45, 2, 0)
	MovementLoopAddLocation(NPC, 673, -17.95, 193.97, 2, 0)
	MovementLoopAddLocation(NPC, 680.59, -19.27, 192.36, 2, 0)
	MovementLoopAddLocation(NPC, 679.34, -19.39, 186.87, 2, 0)
	MovementLoopAddLocation(NPC, 623.53, -16.64, 200.63, 2, 0)
	MovementLoopAddLocation(NPC, 620.96, -12.8, 161.14, 2, 0)
	MovementLoopAddLocation(NPC, 616.28, -12.22, 144.58, 2, 0)
	MovementLoopAddLocation(NPC, 600.5, -12.07, 146.38, 2, 0)
	MovementLoopAddLocation(NPC, 586.13, -10.43, 147.61, 2, 0)
	MovementLoopAddLocation(NPC, 564.25, -10.58, 149.91, 2, 0)
	MovementLoopAddLocation(NPC, 545.21, -10.58, 151.77, 2, 0)
	MovementLoopAddLocation(NPC, 504.88, -11.31, 146.37, 2, 0)
	MovementLoopAddLocation(NPC, 494.74, -11.65, 143.21, 2, 0)
	MovementLoopAddLocation(NPC, 478.76, -11.53, 137.32, 2, 0)
	MovementLoopAddLocation(NPC, 474.56, -11.53, 136.07, 2, 0)
	MovementLoopAddLocation(NPC, 469.88, -11.53, 130.15, 2, 0)
end


