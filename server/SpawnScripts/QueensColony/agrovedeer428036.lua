--[[
        Script Name     :       SpawnScripts/QueensColony/agrovedeer428036.lua
	Script Purpose	:	Waypoint Path for agrovedeer428036.lua
	Script Author	:	Rylec
	Script Date	:	04-19-2020 02:16:57 
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
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, 82.17, -4.43, 215.88, 2, math.random(10, 24))
	MovementLoopAddLocation(NPC, 77.27, -4.53, 223.98, 2, 0)
	MovementLoopAddLocation(NPC, 75.04, -4.52, 226.31, 2, math.random(10, 24))
	MovementLoopAddLocation(NPC, 79.19, -4.4, 226.87, 2, math.random(10, 24))
	MovementLoopAddLocation(NPC, 64.28, -3.8, 218.76, 2, 0)
	MovementLoopAddLocation(NPC, 61.42, -3.86, 216.69, 2, 0)
	MovementLoopAddLocation(NPC, 59.27, -4.11, 215.8, 2, math.random(10, 24))
	MovementLoopAddLocation(NPC, 71.88, -3.8, 216.95, 2, math.random(10, 24))
	MovementLoopAddLocation(NPC, 59.52, -4.46, 223.91, 2, math.random(10, 24))
	MovementLoopAddLocation(NPC, 72.28, -4.02, 220.72, 2, math.random(10, 24))
	MovementLoopAddLocation(NPC, 86.52, -4.51, 214.89, 2, math.random(10, 24))
end


