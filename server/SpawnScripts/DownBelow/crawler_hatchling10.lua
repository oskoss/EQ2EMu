--[[
	Script Name		:	crawler_hatchling10.lua
	Script Purpose	:	Waypoint Path for crawler_hatchling10.lua
	Script Author	:	Devn00b
	Script Date		:	05/13/2020 12:56:48 PM
	Script Notes	:	Locations collected from Live
--]]

function spawn(NPC)
    local Level = GetLevel(NPC)
    local level1 = 5
    local level2 = 6
    local difficulty1 = 6
    local hp1 = 130
    local power1 = 65
    local difficulty2 = 6
    local hp2 = 150
    local power2 = 80
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
	MovementLoopAddLocation(NPC, -172.12, -0.15, -177.12, 1, 0)
	MovementLoopAddLocation(NPC, -172.56, -0.09, -187.63, 1, 0)
	MovementLoopAddLocation(NPC, -183.09, -0.09, -189.55, 1, 0)
	MovementLoopAddLocation(NPC, -183.64, -0.08, -187.29, 1, 0)
	MovementLoopAddLocation(NPC, -183.35, -0.09, -192.2, 1, 0)
	MovementLoopAddLocation(NPC, -174.26, -0.05, -187.81, 1, 0)
	MovementLoopAddLocation(NPC, -171.67, -0.15, -176.51, 1, 0)
	MovementLoopAddLocation(NPC, -167.31, 0.1, -171.53, 1, 0)
	MovementLoopAddLocation(NPC, -155.59, -0.28, -171.75, 1, 0)
	MovementLoopAddLocation(NPC, -149.3, -0.3, -175.17, 1, 0)
	MovementLoopAddLocation(NPC, -132.53, 0.48, -181.63, 1, 0)
	MovementLoopAddLocation(NPC, -121.69, 0.54, -180.45, 1, 0)
	MovementLoopAddLocation(NPC, -119.48, -0.07, -171.36, 1, 0)
	MovementLoopAddLocation(NPC, -120.5, 0.19, -150.26, 1, 0)
	MovementLoopAddLocation(NPC, -129.77, -0.06, -143.17, 1, 0)
	MovementLoopAddLocation(NPC, -129.47, 0.13, -128.77, 1, 0)
	MovementLoopAddLocation(NPC, -123.43, 0.48, -119.84, 1, 0)
	MovementLoopAddLocation(NPC, -117.66, -0.06, -115.02, 1, 0)
	MovementLoopAddLocation(NPC, -108.34, -0.1, -118.04, 1, 0)
	MovementLoopAddLocation(NPC, -105.5, -0.03, -119.64, 1, 0)
	MovementLoopAddLocation(NPC, -92.54, 0.46, -132.12, 1, 0)
	MovementLoopAddLocation(NPC, -85.64, -0.12, -139.3, 1, 0)
	MovementLoopAddLocation(NPC, -80.54, -0.05, -133.91, 1, 0)
	MovementLoopAddLocation(NPC, -71.86, -0.09, -142.81, 1, 0)
	MovementLoopAddLocation(NPC, -69.69, -0.07, -153.27, 1, 0)
	MovementLoopAddLocation(NPC, -85.69, -0.01, -152.9, 1, 0)
	MovementLoopAddLocation(NPC, -88.73, -0.09, -158.25, 1, 0)
	MovementLoopAddLocation(NPC, -88.83, -0.04, -172.64, 1, 0)
	MovementLoopAddLocation(NPC, -88.62, -0.08, -178.45, 1, 0)
	MovementLoopAddLocation(NPC, -82.85, -0.05, -183.03, 1, 0)
	MovementLoopAddLocation(NPC, -83.55, -0.08, -188.31, 1, 0)
	MovementLoopAddLocation(NPC, -82.85, -0.05, -183.03, 1, 0)
	MovementLoopAddLocation(NPC, -88.62, -0.08, -178.45, 1, 0)
	MovementLoopAddLocation(NPC, -88.83, -0.04, -172.64, 1, 0)
	MovementLoopAddLocation(NPC, -88.73, -0.09, -158.25, 1, 0)
	MovementLoopAddLocation(NPC, -85.69, -0.01, -152.9, 1, 0)
	MovementLoopAddLocation(NPC, -69.69, -0.07, -153.27, 1, 0)
	MovementLoopAddLocation(NPC, -71.86, -0.09, -142.81, 1, 0)
	MovementLoopAddLocation(NPC, -80.54, -0.05, -133.91, 1, 0)
	MovementLoopAddLocation(NPC, -85.64, -0.12, -139.3, 1, 0)
	MovementLoopAddLocation(NPC, -92.54, 0.46, -132.12, 1, 0)
	MovementLoopAddLocation(NPC, -105.5, -0.03, -119.64, 1, 0)
	MovementLoopAddLocation(NPC, -108.34, -0.1, -118.04, 1, 0)
	MovementLoopAddLocation(NPC, -117.66, -0.06, -115.02, 1, 0)
	MovementLoopAddLocation(NPC, -123.43, 0.48, -119.84, 1, 0)
	MovementLoopAddLocation(NPC, -129.47, 0.13, -128.77, 1, 0)
	MovementLoopAddLocation(NPC, -129.77, -0.06, -143.17, 1, 0)
	MovementLoopAddLocation(NPC, -120.5, 0.19, -150.26, 1, 0)
	MovementLoopAddLocation(NPC, -119.48, -0.07, -171.36, 1, 0)
	MovementLoopAddLocation(NPC, -121.69, 0.54, -180.45, 1, 0)
	MovementLoopAddLocation(NPC, -132.53, 0.48, -181.63, 1, 0)
	MovementLoopAddLocation(NPC, -149.3, -0.3, -175.17, 1, 0)
	MovementLoopAddLocation(NPC, -155.59, -0.28, -171.75, 1, 0)
	MovementLoopAddLocation(NPC, -167.31, 0.1, -171.53, 1, 0)
	MovementLoopAddLocation(NPC, -171.67, -0.15, -176.51, 1, 0)
	MovementLoopAddLocation(NPC, -174.26, -0.05, -187.81, 1, 0)
	MovementLoopAddLocation(NPC, -183.35, -0.09, -192.2, 1, 0)
	MovementLoopAddLocation(NPC, -183.64, -0.08, -187.29, 1, 0)
	MovementLoopAddLocation(NPC, -183.09, -0.09, -189.55, 1, 0)
	MovementLoopAddLocation(NPC, -172.56, -0.09, -187.63, 1, 0)
	MovementLoopAddLocation(NPC, -172.12, -0.15, -177.12, 1, 0)
end


