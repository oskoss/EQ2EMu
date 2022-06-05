--[[
	Script Name		:	shriller9_1.lua
	Script Purpose	:	Waypoint Path for shriller9_1.lua
	Script Author	:	Devn00b
	Script Date		:	05/11/2020 11:35:58 PM
	Script Notes	:	Locations collected from Live
--]]

function spawn(NPC)
        local Level = GetLevel(NPC)
    local level1 = 6
    local level2 = 5
    local difficulty1 = 6
    local hp1 = 150
    local power1 = 150
    local difficulty2 = 6
    local hp2 = 130
    local power2 = 130
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
	MovementLoopAddLocation(NPC, 18.29, 0.18, -97.73, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, 22.31, -0.05, -109.25, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, 22.6, -0.03, -105.96, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, 19.43, -0.09, -106.24, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, 22.74, -0.07, -102.23, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, 26.26, 0.01, -104.98, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, 25.32, -0.07, -107.07, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, 17.05, 0.13, -100.26, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, 6.41, -0.05, -108.94, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, 4.67, -0.01, -108.18, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -12.96, -0.05, -91.02, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -29.84, 0.56, -106.71, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -35.41, -0.05, -111.15, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -33.84, 0.53, -126.29, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -35.68, -0.01, -132.32, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -45.48, -1.09, -141.41, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -53.3, 0.22, -148.94, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -62.18, -0.06, -153.09, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -69.36, -0.09, -153.01, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -76.38, -0.08, -137.87, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -77.56, -0.04, -130.02, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -84.68, -0.08, -120.15, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -85.38, -0.11, -109.65, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -65.9, 0.06, -96.84, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -59.25, -0.06, -95.03, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -58.56, 0.6, -90.13, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -54.92, -0.08, -71.05, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -45.4, -0.1, -65.26, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -27.27, -0.12, -73.65, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -12.09, -0.07, -91, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -29.26, 0.21, -105.82, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -35.1, -0.06, -111.38, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -33.92, 0.53, -126.45, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -36.25, 0.03, -132.75, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -56.47, -0.11, -152.17, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -69.22, -0.12, -152.41, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -56.47, -0.11, -152.17, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -36.25, 0.03, -132.75, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -33.92, 0.53, -126.45, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -35.1, -0.06, -111.38, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -29.26, 0.21, -105.82, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -12.09, -0.07, -91, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -27.27, -0.12, -73.65, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -45.4, -0.1, -65.26, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -54.92, -0.08, -71.05, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -58.56, 0.6, -90.13, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -59.25, -0.06, -95.03, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -65.9, 0.06, -96.84, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -85.38, -0.11, -109.65, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -84.68, -0.08, -120.15, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -77.56, -0.04, -130.02, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -76.38, -0.08, -137.87, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -69.36, -0.09, -153.01, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -62.18, -0.06, -153.09, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -53.3, 0.22, -148.94, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -45.48, -1.09, -141.41, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -35.68, -0.01, -132.32, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -33.84, 0.53, -126.29, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -35.41, -0.05, -111.15, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -29.84, 0.56, -106.71, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, -12.96, -0.05, -91.02, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, 4.67, -0.01, -108.18, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, 6.41, -0.05, -108.94, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, 17.05, 0.13, -100.26, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, 25.32, -0.07, -107.07, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, 26.26, 0.01, -104.98, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, 22.74, -0.07, -102.23, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, 19.43, -0.09, -106.24, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, 22.6, -0.03, -105.96, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, 22.31, -0.05, -109.25, 2, math.random(0,10))
	MovementLoopAddLocation(NPC, 18.29, 0.18, -97.73, 2, math.random(0,10))
end


