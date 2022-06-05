--[[
	Script Name		:	shriller23.lua
	Script Purpose	:	Waypoint Path for shriller23.lua
	Script Author	:	Devn00b
	Script Date		:	05/14/2020 12:27:19 PM
	Script Notes	:	Locations collected from Live
--]]

function spawn(NPC)
         local Level = GetLevel(NPC)
    local level1 = 8
    local level2 = 9
    local difficulty1 = 6
    local hp1 = 250
    local power1 = 250
    local difficulty2 = 6
    local hp2 = 285
    local power2 = 285
    if Level == level1 then
    SpawnSet(NPC, "difficulty", difficulty1)
    SpawnSet(NPC, "hp", hp1)
    SpawnSet(NPC, "power", power1)
    elseif Level == level2
        then
    SpawnSet(NPC, "difficulty", difficulty2)
    SpawnSet(NPC, "hp", hp2)
    SpawnSet(NPC, "power", power2)
    end
	waypoints(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
 waypoints(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, -204.05, 0.61, -91.29, 2, 0)
	MovementLoopAddLocation(NPC, -189.84, -0.02, -91.78, 2, 0)
	MovementLoopAddLocation(NPC, -181.21, -0.18, -89.3, 2, 0)
	MovementLoopAddLocation(NPC, -174.35, -0.24, -75.25, 2, 0)
	MovementLoopAddLocation(NPC, -179.58, -0.23, -83.47, 2, 0)
	MovementLoopAddLocation(NPC, -182.24, -0.16, -87.78, 2, 0)
	MovementLoopAddLocation(NPC, -188.66, -0.09, -92.05, 2, 0)
	MovementLoopAddLocation(NPC, -198.29, -0.01, -92.25, 2, 0)
	MovementLoopAddLocation(NPC, -195.56, -0.07, -103.45, 2, 0)
	MovementLoopAddLocation(NPC, -185.25, -0.1, -106.18, 2, 0)
	MovementLoopAddLocation(NPC, -181.83, 0.11, -111.96, 2, 0)
	MovementLoopAddLocation(NPC, -178.48, 1.17, -120.8, 2, 0)
	MovementLoopAddLocation(NPC, -182.53, -0.1, -108.38, 2, 0)
	MovementLoopAddLocation(NPC, -196.6, -0.08, -102.86, 2, 0)
	MovementLoopAddLocation(NPC, -198.62, -0.04, -96.14, 2, 0)
	MovementLoopAddLocation(NPC, -209.46, -0.06, -92.27, 2, 0)
	MovementLoopAddLocation(NPC, -213.04, -0.07, -88.39, 2, 0)
	MovementLoopAddLocation(NPC, -219.93, -0.1, -94.8, 2, 0)
	MovementLoopAddLocation(NPC, -221.37, -0.08, -92.63, 2, 0)
	MovementLoopAddLocation(NPC, -220.25, -0.08, -90.63, 2, 0)
	MovementLoopAddLocation(NPC, -216.68, -0.08, -93.43, 2, 0)
	MovementLoopAddLocation(NPC, -216.65, -0.1, -95.47, 2, 0)
	MovementLoopAddLocation(NPC, -218.16, -0.1, -97.02, 2, 0)
	MovementLoopAddLocation(NPC, -219.43, -0.11, -95.38, 2, 0)
	MovementLoopAddLocation(NPC, -218.3, -0.08, -91.78, 2, 0)
	MovementLoopAddLocation(NPC, -221.95, -0.08, -93.58, 2, 0)
	MovementLoopAddLocation(NPC, -217.46, -0.09, -93.5, 2, 0)
	MovementLoopAddLocation(NPC, -221.4, -0.08, -92, 2, 0)
	MovementLoopAddLocation(NPC, -217.79, -0.08, -91.88, 2, 0)
	MovementLoopAddLocation(NPC, -214.88, -0.05, -88.15, 2, 0)
	MovementLoopAddLocation(NPC, -217.8, 0.02, -77.9, 2, 0)
	MovementLoopAddLocation(NPC, -217.92, 0, -58.13, 2, 0)
	MovementLoopAddLocation(NPC, -214.64, -0.02, -52.8, 2, 0)
	MovementLoopAddLocation(NPC, -191.51, 0, -29.01, 2, 0)
	MovementLoopAddLocation(NPC, -180.44, -0.06, -40.16, 2, 0)
	MovementLoopAddLocation(NPC, -191.16, -0.07, -51.29, 2, 0)
	MovementLoopAddLocation(NPC, -191.47, -0.11, -61.3, 2, 0)
	MovementLoopAddLocation(NPC, -191.37, -0.05, -68.71, 2, 0)
	MovementLoopAddLocation(NPC, -184.23, -0.08, -74.23, 2, 0)
	MovementLoopAddLocation(NPC, -175.81, -0.26, -74.57, 2, 0)
	MovementLoopAddLocation(NPC, -184.23, -0.08, -74.23, 2, 0)
	MovementLoopAddLocation(NPC, -191.37, -0.05, -68.71, 2, 0)
	MovementLoopAddLocation(NPC, -191.47, -0.11, -61.3, 2, 0)
	MovementLoopAddLocation(NPC, -191.16, -0.07, -51.29, 2, 0)
	MovementLoopAddLocation(NPC, -180.44, -0.06, -40.16, 2, 0)
	MovementLoopAddLocation(NPC, -191.51, 0, -29.01, 2, 0)
	MovementLoopAddLocation(NPC, -214.64, -0.02, -52.8, 2, 0)
	MovementLoopAddLocation(NPC, -217.92, 0, -58.13, 2, 0)
	MovementLoopAddLocation(NPC, -217.8, 0.02, -77.9, 2, 0)
	MovementLoopAddLocation(NPC, -214.88, -0.05, -88.15, 2, 0)
	MovementLoopAddLocation(NPC, -217.79, -0.08, -91.88, 2, 0)
	MovementLoopAddLocation(NPC, -221.4, -0.08, -92, 2, 0)
	MovementLoopAddLocation(NPC, -217.46, -0.09, -93.5, 2, 0)
	MovementLoopAddLocation(NPC, -221.95, -0.08, -93.58, 2, 0)
	MovementLoopAddLocation(NPC, -218.3, -0.08, -91.78, 2, 0)
	MovementLoopAddLocation(NPC, -219.43, -0.11, -95.38, 2, 0)
	MovementLoopAddLocation(NPC, -218.16, -0.1, -97.02, 2, 0)
	MovementLoopAddLocation(NPC, -216.65, -0.1, -95.47, 2, 0)
	MovementLoopAddLocation(NPC, -216.68, -0.08, -93.43, 2, 0)
	MovementLoopAddLocation(NPC, -220.25, -0.08, -90.63, 2, 0)
	MovementLoopAddLocation(NPC, -221.37, -0.08, -92.63, 2, 0)
	MovementLoopAddLocation(NPC, -219.93, -0.1, -94.8, 2, 0)
	MovementLoopAddLocation(NPC, -213.04, -0.07, -88.39, 2, 0)
	MovementLoopAddLocation(NPC, -209.46, -0.06, -92.27, 2, 0)
	MovementLoopAddLocation(NPC, -198.62, -0.04, -96.14, 2, 0)
	MovementLoopAddLocation(NPC, -196.6, -0.08, -102.86, 2, 0)
	MovementLoopAddLocation(NPC, -182.53, -0.1, -108.38, 2, 0)
	MovementLoopAddLocation(NPC, -178.48, 1.17, -120.8, 2, 0)
	MovementLoopAddLocation(NPC, -181.83, 0.11, -111.96, 2, 0)
	MovementLoopAddLocation(NPC, -185.25, -0.1, -106.18, 2, 0)
	MovementLoopAddLocation(NPC, -195.56, -0.07, -103.45, 2, 0)
	MovementLoopAddLocation(NPC, -198.29, -0.01, -92.25, 2, 0)
	MovementLoopAddLocation(NPC, -188.66, -0.09, -92.05, 2, 0)
	MovementLoopAddLocation(NPC, -182.24, -0.16, -87.78, 2, 0)
	MovementLoopAddLocation(NPC, -179.58, -0.23, -83.47, 2, 0)
	MovementLoopAddLocation(NPC, -174.35, -0.24, -75.25, 2, 0)
	MovementLoopAddLocation(NPC, -181.21, -0.18, -89.3, 2, 0)
	MovementLoopAddLocation(NPC, -189.84, -0.02, -91.78, 2, 0)
	MovementLoopAddLocation(NPC, -204.05, 0.61, -91.29, 2, 0)
end


