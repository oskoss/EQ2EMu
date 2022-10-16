--[[
        Script Name     :       SpawnScripts/QueensColony/ataintedSapswillinvader431138.lua
	Script Purpose	:	Waypoint Path for ataintedSapswillinvader431100.lua
	Script Author	:	Rylec
	Script Date	:	11-19-2020 05:12:27 
	Script Notes	:	Locations collected from Live
--]]

function spawn(NPC)
    local Level = GetLevel(NPC)
    local level1 = 1
    local level2 = 2
    local difficulty1 = 6
    local hp1 = 30
    local power1 = 25
    local difficulty2 = 6
    local hp2 = 45
    local power2 = 35
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
	MovementLoopAddLocation(NPC, 173.78, -3.27, 184.43, 2)
	MovementLoopAddLocation(NPC, 132.9, -3.47, 184.05, 2)
	MovementLoopAddLocation(NPC, 129.58, -3.81, 184.97, 2)
	MovementLoopAddLocation(NPC, 115.63, -3.99, 184.71, 2)
	MovementLoopAddLocation(NPC, 111.1, -4, 186.03, 2)
	MovementLoopAddLocation(NPC, 87.75, -4.36, 185.2, 2)
	MovementLoopAddLocation(NPC, 83.66, -4.35, 186.02, 2)
	MovementLoopAddLocation(NPC, 79.71, -4.33, 185.89, 2)
	MovementLoopAddLocation(NPC, 67.56, -4.17, 189.22, 2)
	MovementLoopAddLocation(NPC, 65.63, -4, 188.88, 2)
	MovementLoopAddLocation(NPC, 61.5, -4, 183.71, 2)
	MovementLoopAddLocation(NPC, 76.53, -4.32, 198.53, 2)
	MovementLoopAddLocation(NPC, 75.82, -4.48, 180.13, 2)
	MovementLoopAddLocation(NPC, 68.99, -4.49, 177.68, 2, 0, "waypointsLoop")
end

function waypointsLoop(NPC)
	MovementLoopAddLocation(NPC, 60.48, -4, 189.65, 2, 0)
	MovementLoopAddLocation(NPC, 72.34, -4.3, 169.86, 2, 0)
	MovementLoopAddLocation(NPC, 67.34, -4.28, 154.56, 2, 0)
	MovementLoopAddLocation(NPC, 71.9, -4.3, 170.88, 2, 0)
end