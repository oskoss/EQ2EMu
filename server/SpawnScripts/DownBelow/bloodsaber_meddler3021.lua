--[[
    Script Name    : SpawnScripts/DownBelow/bloodsaber_meddler3021.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.04.03 07:04:49
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
    local Level = GetLevel(NPC)
    local level1 = 7
    local level2 = 8
    local difficulty1 = 4
    local hp1 = 100
    local power1 = 40
    local difficulty2 = 4
    local hp2 = 120
    local power2 = 50
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
	MovementLoopAddLocation(NPC, 25.52, -4, -135.79, 2, 7)
	MovementLoopAddLocation(NPC, 12.83, 0, -139.02, 2, 5)
	MovementLoopAddLocation(NPC, 22.94, -3.75, -139.65, 2, 5)
	MovementLoopAddLocation(NPC, 11.87, 0.26, -139.55, 2, 5)
	MovementLoopAddLocation(NPC, 19.84, -2.23, -137.35, 2, 5)
	MovementLoopAddLocation(NPC, 11.95, 0.07, -135.76, 2, 5)
	MovementLoopAddLocation(NPC, 27.85, -4, -139.55, 2, 5)
end
