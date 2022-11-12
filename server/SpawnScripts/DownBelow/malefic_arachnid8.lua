--[[
	Script Name		:	malefic_arachnid8.lua
	Script Purpose	:	Waypoint Path for malefic_arachnid8.lua
	Script Author	:	Devn00b
	Script Date		:	05/13/2020 01:20:57 PM
	Script Notes	:	Locations collected from Live
--]]

function spawn(NPC)
          local Level = GetLevel(NPC)
    local level1 = 6
    local level2 = 7
    local difficulty1 = 6
    local hp1 = 150
    local power1 = 150
    local difficulty2 = 6
    local hp2 = 215
    local power2 = 215
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
 spawn(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, -119.82, -0.08, -169.42, 2, 0)
	MovementLoopAddLocation(NPC, -117.81, -0.05, -176.89, 2, 0)
	MovementLoopAddLocation(NPC, -121.89, 0.52, -180.11, 2, 0)
	MovementLoopAddLocation(NPC, -131, 0.48, -182.82, 2, 0)
	MovementLoopAddLocation(NPC, -143.36, -0.36, -178.71, 2, 0)
	MovementLoopAddLocation(NPC, -146.46, -0.25, -186.6, 2, 0)
	MovementLoopAddLocation(NPC, -144.43, -0.27, -180.69, 2, 0)
	MovementLoopAddLocation(NPC, -132.28, 0.48, -179.85, 2, 0)
	MovementLoopAddLocation(NPC, -121.08, 0.53, -181.34, 2, 0)
	MovementLoopAddLocation(NPC, -117.85, -0.01, -174.61, 2, 0)
	MovementLoopAddLocation(NPC, -119.8, 0.4, -151.89, 2, 0)
	MovementLoopAddLocation(NPC, -122.55, -0.07, -156.87, 2, 0)
	MovementLoopAddLocation(NPC, -117.62, -0.1, -155.01, 2, 0)
	MovementLoopAddLocation(NPC, -117.12, -0.07, -170.29, 2, 0)
	MovementLoopAddLocation(NPC, -121.76, -0.07, -167.28, 2, 0)
	MovementLoopAddLocation(NPC, -113.46, 0.35, -166.51, 2, 0)
	MovementLoopAddLocation(NPC, -105.06, -0.09, -171.17, 2, 0)
	MovementLoopAddLocation(NPC, -105.09, -0.03, -180.28, 2, 0)
	MovementLoopAddLocation(NPC, -108.23, -0.09, -176.68, 2, 0)
	MovementLoopAddLocation(NPC, -105.06, -0.09, -174.17, 2, 0)
	MovementLoopAddLocation(NPC, -111.95, -0.03, -184.72, 2, 0)
	MovementLoopAddLocation(NPC, -108.84, -0.09, -183.76, 2, 0)
	MovementLoopAddLocation(NPC, -109.68, 0, -190.31, 2, 0)
	MovementLoopAddLocation(NPC, -117.01, 0, -191.24, 2, 0)
	MovementLoopAddLocation(NPC, -125.28, 0, -191.86, 2, 0)
	MovementLoopAddLocation(NPC, -104.55, 0, -191.77, 2, 0)
	MovementLoopAddLocation(NPC, -103.87, 0, -193.5, 2, 0)
	MovementLoopAddLocation(NPC, -103.75, 0, -189.03, 2, 0)
	MovementLoopAddLocation(NPC, -109.1, 0, -193.66, 2, 0)
	MovementLoopAddLocation(NPC, -109.09, -0.04, -185.47, 2, 0)
	MovementLoopAddLocation(NPC, -109.09, -0.04, -185.47, 2, 0)
	MovementLoopAddLocation(NPC, -105.37, -0.09, -172.09, 2, 0)
	MovementLoopAddLocation(NPC, -112.81, 0.36, -168.78, 2, 0)
	MovementLoopAddLocation(NPC, -120.6, -0.05, -169.12, 2, 0)
	MovementLoopAddLocation(NPC, -112.81, 0.36, -168.78, 2, 0)
	MovementLoopAddLocation(NPC, -105.37, -0.09, -172.09, 2, 0)
	MovementLoopAddLocation(NPC, -109.09, -0.04, -185.47, 2, 0)
	MovementLoopAddLocation(NPC, -109.09, -0.04, -185.47, 2, 0)
	MovementLoopAddLocation(NPC, -109.1, 0, -193.66, 2, 0)
	MovementLoopAddLocation(NPC, -103.75, 0, -189.03, 2, 0)
	MovementLoopAddLocation(NPC, -103.87, 0, -193.5, 2, 0)
	MovementLoopAddLocation(NPC, -104.55, 0, -191.77, 2, 0)
	MovementLoopAddLocation(NPC, -125.28, 0, -191.86, 2, 0)
	MovementLoopAddLocation(NPC, -117.01, 0, -191.24, 2, 0)
	MovementLoopAddLocation(NPC, -109.68, 0, -190.31, 2, 0)
	MovementLoopAddLocation(NPC, -108.84, -0.09, -183.76, 2, 0)
	MovementLoopAddLocation(NPC, -111.95, -0.03, -184.72, 2, 0)
	MovementLoopAddLocation(NPC, -105.06, -0.09, -174.17, 2, 0)
	MovementLoopAddLocation(NPC, -108.23, -0.09, -176.68, 2, 0)
	MovementLoopAddLocation(NPC, -105.09, -0.03, -180.28, 2, 0)
	MovementLoopAddLocation(NPC, -105.06, -0.09, -171.17, 2, 0)
	MovementLoopAddLocation(NPC, -113.46, 0.35, -166.51, 2, 0)
	MovementLoopAddLocation(NPC, -121.76, -0.07, -167.28, 2, 0)
	MovementLoopAddLocation(NPC, -117.12, -0.07, -170.29, 2, 0)
	MovementLoopAddLocation(NPC, -117.62, -0.1, -155.01, 2, 0)
	MovementLoopAddLocation(NPC, -122.55, -0.07, -156.87, 2, 0)
	MovementLoopAddLocation(NPC, -119.8, 0.4, -151.89, 2, 0)
	MovementLoopAddLocation(NPC, -117.85, -0.01, -174.61, 2, 0)
	MovementLoopAddLocation(NPC, -121.08, 0.53, -181.34, 2, 0)
	MovementLoopAddLocation(NPC, -132.28, 0.48, -179.85, 2, 0)
	MovementLoopAddLocation(NPC, -144.43, -0.27, -180.69, 2, 0)
	MovementLoopAddLocation(NPC, -146.46, -0.25, -186.6, 2, 0)
	MovementLoopAddLocation(NPC, -143.36, -0.36, -178.71, 2, 0)
	MovementLoopAddLocation(NPC, -131, 0.48, -182.82, 2, 0)
	MovementLoopAddLocation(NPC, -121.89, 0.52, -180.11, 2, 0)
	MovementLoopAddLocation(NPC, -117.81, -0.05, -176.89, 2, 0)
	MovementLoopAddLocation(NPC, -119.82, -0.08, -169.42, 2, 0)
end


