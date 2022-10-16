--[[
        Script Name     :       SpawnScripts/QueensColony/ataintedSapswillinvader431147.lua
	Script Purpose	:	Waypoint Path for ataintedSapswillinvader431147.lua
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
	MovementLoopAddLocation(NPC, 166.88, -3.36, 202.35, 2)
	MovementLoopAddLocation(NPC, 148.4, -3.62, 193.61, 2)
	MovementLoopAddLocation(NPC, 132.43, -3.62, 185.18, 2)
	MovementLoopAddLocation(NPC, 126.96, -3.81, 184.94, 2)
	MovementLoopAddLocation(NPC, 122.59, -3.75, 182.45, 2)
	MovementLoopAddLocation(NPC, 118.24, -3.77, 178.38, 2)
	MovementLoopAddLocation(NPC, 78.56, -4.36, 157.78, 2)
	MovementLoopAddLocation(NPC, 75.75, -4.36, 160.57, 2, 0, "waypointsLoop")
--	MoveToLocation(NPC, 73.31, -4.36, 164.62, 2)
--	MoveToLocation(NPC, 72.34, -4.3, 169.86, 2, "waypointsLoop")
end

function waypointsLoop(NPC)
	MovementLoopAddLocation(NPC, 60.48, -4, 189.65, 2, 0)
	MovementLoopAddLocation(NPC, 72.34, -4.3, 169.86, 2, 0)
	MovementLoopAddLocation(NPC, 67.34, -4.28, 154.56, 2, 0)
	MovementLoopAddLocation(NPC, 71.9, -4.3, 170.88, 2, 0)
end