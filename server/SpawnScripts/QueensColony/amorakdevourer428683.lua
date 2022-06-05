--[[
        Script Name     :       SpawnScripts/QueensColony/amorakdevourer428683.lua
	Script Purpose	:	Waypoint Path for amorakdevourer428683.lua
	Script Author	:	Rylec
	Script Date	:	06-01-2020 10:08:43 
	Script Notes	:	Locations collected from Live
--]]

function spawn(NPC)
        SpawnSet(NPC, "level", "3")  
        SpawnSet(NPC, "difficulty", "2")
        SpawnSet(NPC, "hp", 30)
        SpawnSet(NPC, "power", 15)
      
	waypoints(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
        spawn(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, 216.81, -0.97, -102.04, 2, 0)
	MovementLoopAddLocation(NPC, 228, -1.01, -92.88, 2, 0)
	MovementLoopAddLocation(NPC, 234.48, -1.04, -84.3, 2, 0)
	MovementLoopAddLocation(NPC, 238.12, -1.05, -69.05, 2, 0)
	MovementLoopAddLocation(NPC, 235.57, -1.05, -57.08, 2, 0)
	MovementLoopAddLocation(NPC, 234.95, -2.21, -46.13, 2, 0)
	MovementLoopAddLocation(NPC, 236.2, -4.05, -35.84, 2, 0)
	MovementLoopAddLocation(NPC, 246.47, -4.09, -22.27, 2, 0)
	MovementLoopAddLocation(NPC, 248.94, -4.1, -11.2, 2, 0)
	MovementLoopAddLocation(NPC, 246.15, -4.09, -23.13, 2, 0)
	MovementLoopAddLocation(NPC, 236.02, -4.05, -36.22, 2, 0)
	MovementLoopAddLocation(NPC, 234.99, -2.17, -46.42, 2, 0)
	MovementLoopAddLocation(NPC, 235.65, -1.05, -57.05, 2, 0)
	MovementLoopAddLocation(NPC, 238.13, -1.05, -68.99, 2, 0)
	MovementLoopAddLocation(NPC, 234.6, -1.04, -84.43, 2, 0)
	MovementLoopAddLocation(NPC, 226.98, -1.01, -93.73, 2, 0)
	MovementLoopAddLocation(NPC, 216.53, -0.97, -101.92, 2, 0)
	MovementLoopAddLocation(NPC, 229.93, -1.02, -89.12, 2, 0)
	MovementLoopAddLocation(NPC, 235.51, -1.04, -78.73, 2, 0)
	MovementLoopAddLocation(NPC, 236.92, -1.05, -66.35, 2, 0)
	MovementLoopAddLocation(NPC, 235.74, -1.05, -58.81, 2, 0)
	MovementLoopAddLocation(NPC, 234.38, -2.27, -45.88, 2, 0)
	MovementLoopAddLocation(NPC, 234.43, -3.35, -41.13, 2, 0)
	MovementLoopAddLocation(NPC, 242.72, -4.07, -29.2, 2, 0)
	MovementLoopAddLocation(NPC, 248.56, -4.1, -16.32, 2, 0)
	MovementLoopAddLocation(NPC, 247.46, -4.1, -8.43, 2, 0)
	MovementLoopAddLocation(NPC, 242.58, -4.08, -1.94, 2, 0)
	MovementLoopAddLocation(NPC, 236.64, -4.06, 1.09, 2, 0)
	MovementLoopAddLocation(NPC, 229.97, -4.04, 12.59, 2, 0)
	MovementLoopAddLocation(NPC, 231.35, -4.05, 23.09, 2, 0)
	MovementLoopAddLocation(NPC, 249.58, -4.12, 43.43, 2, 0)
	MovementLoopAddLocation(NPC, 251.77, -4.13, 53.46, 2, 0)
	MovementLoopAddLocation(NPC, 249.4, -4.27, 59.92, 2, 0)
	MovementLoopAddLocation(NPC, 247.04, -6.88, 79.12, 2, 0)
	MovementLoopAddLocation(NPC, 248.69, -4.42, 60.99, 2, 0)
	MovementLoopAddLocation(NPC, 252.45, -4.13, 50.25, 2, 0)
	MovementLoopAddLocation(NPC, 247.29, -4.11, 39.01, 2, 0)
	MovementLoopAddLocation(NPC, 233.1, -4.05, 27.65, 2, 0)
	MovementLoopAddLocation(NPC, 230.49, -4.04, 7.88, 2, 0)
	MovementLoopAddLocation(NPC, 241.45, -3.89, -8.91, 2, 0)
	MovementLoopAddLocation(NPC, 230.41, -4.04, 8.27, 2, 0)
	MovementLoopAddLocation(NPC, 232.71, -4.05, 25.35, 2, 0)
	MovementLoopAddLocation(NPC, 233.29, -4.06, 27.63, 2, 0)
	MovementLoopAddLocation(NPC, 247.09, -4.11, 38.96, 2, 0)
	MovementLoopAddLocation(NPC, 252.42, -4.13, 50.23, 2, 0)
	MovementLoopAddLocation(NPC, 248.73, -4.41, 60.93, 2, 0)
	MovementLoopAddLocation(NPC, 247.02, -6.88, 79.14, 2, 0)
	MovementLoopAddLocation(NPC, 249.77, -4.12, 58.86, 2, 0)
	MovementLoopAddLocation(NPC, 251.73, -4.13, 52.69, 2, 0)
	MovementLoopAddLocation(NPC, 249.83, -4.12, 43.26, 2, 0)
	MovementLoopAddLocation(NPC, 231.23, -4.05, 22.91, 2, 0)
	MovementLoopAddLocation(NPC, 229.99, -4.04, 12.53, 2, 0)
	MovementLoopAddLocation(NPC, 236.61, -4.06, 0.98, 2, 0)
	MovementLoopAddLocation(NPC, 243.1, -4.08, -2.3, 2, 0)
	MovementLoopAddLocation(NPC, 247.94, -4.1, -9.49, 2, 0)
	MovementLoopAddLocation(NPC, 248.38, -4.1, -16.48, 2, 0)
	MovementLoopAddLocation(NPC, 242.77, -4.05, -29.38, 2, 0)
	MovementLoopAddLocation(NPC, 234.54, -3.48, -40.74, 2, 0)
	MovementLoopAddLocation(NPC, 236.85, -1.05, -67.31, 2, 0)
	MovementLoopAddLocation(NPC, 235.44, -1.04, -79.07, 2, 0)
	MovementLoopAddLocation(NPC, 229.64, -1.02, -89.81, 2, 0)
end


