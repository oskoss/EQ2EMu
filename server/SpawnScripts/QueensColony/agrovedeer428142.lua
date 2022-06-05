--[[
        Script Name     :       SpawnScripts/QueensColony/agrovedeer428142.lua
	Script Purpose	:	Waypoint Path for agrovedeer428142.lua
	Script Author	:	Rylec
	Script Date	:	04-19-2020 02:16:36 
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
	MovementLoopAddLocation(NPC, 69.67, -3.8, 212.1, 2, math.random(10, 24))
	MovementLoopAddLocation(NPC, 67.93, -3.8, 214.86, 2, math.random(10, 24))
	MovementLoopAddLocation(NPC, 89.29, -4.4, 212.9, 2, math.random(10, 24))
	MovementLoopAddLocation(NPC, 64.96, -3.8, 217.87, 2, math.random(10, 24))
	MovementLoopAddLocation(NPC, 88.42, -4.39, 216.82, 2, math.random(10, 24))
	MovementLoopAddLocation(NPC, 65.98, -4.04, 221, 2, math.random(10, 24))
	MovementLoopAddLocation(NPC, 68.73, -4.26, 222.38, 2, math.random(10, 24))
	MovementLoopAddLocation(NPC, 66.59, -3.8, 216.98, 2, math.random(10, 24))
	MovementLoopAddLocation(NPC, 59.9, -4.46, 225.67, 2, math.random(10, 24))
	MovementLoopAddLocation(NPC, 87.28, -4.55, 215.89, 2, math.random(10, 24))
	MovementLoopAddLocation(NPC, 78.07, -4.53, 221.98, 2, math.random(10, 24))
	MovementLoopAddLocation(NPC, 84.42, -4.44, 213.82, 2, math.random(10, 24))
end


