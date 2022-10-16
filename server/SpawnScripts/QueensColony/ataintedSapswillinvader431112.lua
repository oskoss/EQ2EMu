--[[
        Script Name     :       SpawnScripts/QueensColony/ataintedSapswillinvader431112.lua
	Script Purpose	:	Waypoint Path for ataintedSapswillinvader431112.lua
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
	MovementLoopAddLocation(NPC, 191.84, -3.29, 141.76, 2)
	MovementLoopAddLocation(NPC, 164.52, -3.41, 145.69, 2)
	MovementLoopAddLocation(NPC, 158.79, -2.76, 145.6, 2)
	MovementLoopAddLocation(NPC, 118.38, -4.18, 151.71, 2)
	MovementLoopAddLocation(NPC, 115.91, -3.93, 155.97, 2)
	MovementLoopAddLocation(NPC, 78.56, -4.36, 157.78, 2)
	MovementLoopAddLocation(NPC, 75.75, -4.36, 160.57, 2, 0, "waypointsLoop")
--	MovementLoopAddLocation(NPC, 73.31, -4.36, 164.62, 2)
--	MovementLoopAddLocation(NPC, 72.34, -4.3, 169.86, 2, "waypointsLoop")
end

function waypointsLoop(NPC)
	MovementLoopAddLocation(NPC, 60.48, -4, 189.65, 2, 0)
	MovementLoopAddLocation(NPC, 72.34, -4.3, 169.86, 2, 0)
	MovementLoopAddLocation(NPC, 67.34, -4.28, 154.56, 2, 0)
	MovementLoopAddLocation(NPC, 71.9, -4.3, 170.88, 2, 0)
end
