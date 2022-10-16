--[[
    Script Name    : SpawnScripts/DownBelow/aBloodsaberinitiate3018.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.04.03 10:04:37
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
    local Level = GetLevel(NPC)
    local level1 = 7
    local level2 = 8
    local difficulty1 = 4
    local hp1 = 100
    local power1 = 45
    local difficulty2 = 5
    local hp2 = 120
    local power2 = 55
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
	MovementLoopAddLocation(NPC, -8.88, -3.76, -137.92, 2, 7)
	MovementLoopAddLocation(NPC, -13.23, -4, -135.64, 2, 5)
	MovementLoopAddLocation(NPC, -1.89, -0.27, -138.06, 2, 5)
	MovementLoopAddLocation(NPC, -11.83, -4, -136.86, 2, 5)
	MovementLoopAddLocation(NPC, -1.85, -0.21, -136.81, 2, 5)
	MovementLoopAddLocation(NPC, -6.92, -2.77, -137.03, 2, 5)
	MovementLoopAddLocation(NPC, -11.02, -4, -136.93, 2, 5)
end


