--[[
    Script Name    : SpawnScripts/DownBelow/aBloodsaberlookout_3026.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.04.02 11:04:56
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
    local Level = GetLevel(NPC)
    local level1 = 4
    local level2 = 5
    local difficulty1 = 6
    local hp1 = 110
    local power1 = 55
    local difficulty2 = 6
    local hp2 = 130
    local power2 = 65
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
	MovementLoopAddLocation(NPC, 13.09, 0.15, -103.96, 2, 5)
	MovementLoopAddLocation(NPC, 7.33, -0.06, -109.16, 2, 0)
	MovementLoopAddLocation(NPC, 1.21, -0.08, -104.08, 2, 5)
	MovementLoopAddLocation(NPC, 8.31, -0.08, -109.78, 2, 5)
	MovementLoopAddLocation(NPC, 7.13, -0.04, -108.65, 2, 5)
	MovementLoopAddLocation(NPC, 3.3, -0.06, -107.01, 2, 5)
	MovementLoopAddLocation(NPC, 4.67, -0.01, -108.22, 2, 0)
	MovementLoopAddLocation(NPC, 7.35, -0.13, -107.31, 2, 0)
	MovementLoopAddLocation(NPC, 12.33, 0.18, -102.84, 2, 5)
end


