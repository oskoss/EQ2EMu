--[[
	Script Name		:	quackers.lua
	Script Purpose	:	Waypoint Path for quackers.lua
	Script Author	:	Devn00b
	Script Date		:	04/09/2020 07:37:55 PM
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
	MovementLoopAddLocation(NPC, 710.33, -20.92, -33.26, 2, 0.5)
	MovementLoopAddLocation(NPC, 768.24, -20.64, 16.21, 2, 0)
	MovementLoopAddLocation(NPC, 775.48, -20.64, -20.75, 2, 0)
	MovementLoopAddLocation(NPC, 777.23, -20.64, -28.23, 2, 0)
	MovementLoopAddLocation(NPC, 792.43, -21.02, -60.86, 2, 0)
	MovementLoopAddLocation(NPC, 807.09, -20.4, -64.84, 2, 0)
	MovementLoopAddLocation(NPC, 827.85, -24.1, -67.39, 2, 0)
	MovementLoopAddLocation(NPC, 857.54, -25.36, -64.19, 2, 0)
	MovementLoopAddLocation(NPC, 864.55, -25.38, -61.14, 2, 0)
	MovementLoopAddLocation(NPC, 889.47, -25.38, -50.69, 2, 0)
	MovementLoopAddLocation(NPC, 900.34, -25.39, -19.62, 2, 0)
	MovementLoopAddLocation(NPC, 915.06, -25.52, 21.48, 2, 0)
	MovementLoopAddLocation(NPC, 929.88, -25.59, 29.73, 2, 0)
	MovementLoopAddLocation(NPC, 917.92, -25.49, 57.47, 2, 0)
	MovementLoopAddLocation(NPC, 894.7, -25.5, 49.31, 2, 0)
	MovementLoopAddLocation(NPC, 866.66, -25.48, 106.51, 2, 0)
	MovementLoopAddLocation(NPC, 837.54, -25.48, 90.63, 2, 0)
	MovementLoopAddLocation(NPC, 863.76, -25.43, 27.82, 2, 0)
	MovementLoopAddLocation(NPC, 847.75, -25.47, 13.53, 2, 0)
	MovementLoopAddLocation(NPC, 837.56, -25.46, -4.84, 2, 0)
	MovementLoopAddLocation(NPC, 829.77, -25.43, -17.58, 2, 0)
	MovementLoopAddLocation(NPC, 861.02, -25.44, -30.85, 2, 0)
	MovementLoopAddLocation(NPC, 866.19, -25.46, -32.91, 2, 0)
	MovementLoopAddLocation(NPC, 871.23, -25.47, -33.17, 2, 0)
	MovementLoopAddLocation(NPC, 899.58, -25.4, -21.7, 2, 0)
	MovementLoopAddLocation(NPC, 899.06, -25.46, 47.99, 2, 0)
	MovementLoopAddLocation(NPC, 848.9, -23.26, 41.72, 2, 0)
	MovementLoopAddLocation(NPC, 832.21, -23.31, 45.86, 2, 0)
	MovementLoopAddLocation(NPC, 807.99, -23.31, 123.92, 2, 0)
	MovementLoopAddLocation(NPC, 832.21, -23.31, 45.86, 2, 0)
	MovementLoopAddLocation(NPC, 848.9, -23.26, 41.72, 2, 0)
	MovementLoopAddLocation(NPC, 899.06, -25.46, 47.99, 2, 0)
	MovementLoopAddLocation(NPC, 899.58, -25.4, -21.7, 2, 0)
	MovementLoopAddLocation(NPC, 871.23, -25.47, -33.17, 2, 0)
	MovementLoopAddLocation(NPC, 866.19, -25.46, -32.91, 2, 0)
	MovementLoopAddLocation(NPC, 861.02, -25.44, -30.85, 2, 0)
	MovementLoopAddLocation(NPC, 829.77, -25.43, -17.58, 2, 0)
	MovementLoopAddLocation(NPC, 837.56, -25.46, -4.84, 2, 0)
	MovementLoopAddLocation(NPC, 847.75, -25.47, 13.53, 2, 0)
	MovementLoopAddLocation(NPC, 863.76, -25.43, 27.82, 2, 0)
	MovementLoopAddLocation(NPC, 837.54, -25.48, 90.63, 2, 0)
	MovementLoopAddLocation(NPC, 866.66, -25.48, 106.51, 2, 0)
	MovementLoopAddLocation(NPC, 894.7, -25.5, 49.31, 2, 0)
	MovementLoopAddLocation(NPC, 917.92, -25.49, 57.47, 2, 0)
	MovementLoopAddLocation(NPC, 929.88, -25.59, 29.73, 2, 0)
	MovementLoopAddLocation(NPC, 915.06, -25.52, 21.48, 2, 0)
	MovementLoopAddLocation(NPC, 900.34, -25.39, -19.62, 2, 0)
	MovementLoopAddLocation(NPC, 889.47, -25.38, -50.69, 2, 0)
	MovementLoopAddLocation(NPC, 864.55, -25.38, -61.14, 2, 0)
	MovementLoopAddLocation(NPC, 857.54, -25.36, -64.19, 2, 0)
	MovementLoopAddLocation(NPC, 827.85, -24.1, -67.39, 2, 0)
	MovementLoopAddLocation(NPC, 807.09, -20.4, -64.84, 2, 0)
	MovementLoopAddLocation(NPC, 792.43, -21.02, -60.86, 2, 0)
	MovementLoopAddLocation(NPC, 777.23, -20.64, -28.23, 2, 0)
	MovementLoopAddLocation(NPC, 775.48, -20.64, -20.75, 2, 0)
	MovementLoopAddLocation(NPC, 768.24, -20.64, 16.21, 2, 0)
	MovementLoopAddLocation(NPC, 710.33, -20.92, -33.26, 2, 0)
end


