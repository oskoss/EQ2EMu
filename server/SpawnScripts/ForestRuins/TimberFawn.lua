--[[
    Script Name    : SpawnScripts/ForestRuins/TimberFawn.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.06.09 11:06:26
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
    local Level = GetLevel(NPC)
    local level1 =5
    local level2 = 6
    local difficulty1 = 2
    local hp1 = 50
    local power1 = 25
    local difficulty2 = 2
    local hp2 = 65
    local power2 = 30
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
    
    ChooseMovement(NPC)
end

function ChooseMovement(NPC)
	local route = math.random(1,4)
	if route == 1 then
	    RouteOne(NPC, Spawn)
	elseif route == 2 then
	    RouteTwo(NPC, Spawn)
	elseif route == 3 then
	    RouteThree(NPC, Spawn)
	elseif route == 4 then
	    RouteFour(NPC, Spawn)
	end
end

function RouteOne(NPC, Spawn)
    local X = GetX(NPC)
	local Y = GetY(NPC)
	local Z = GetZ(NPC)
    MovementLoopAddLocation(NPC, X, Y, Z, 2, math.random(2,10))
    MovementLoopAddLocation(NPC, X + 4, Y, Z, 2, math.random(20,45))
	MovementLoopAddLocation(NPC, X + 4, Y, Z + 4, 2, math.random(20,45))
	MovementLoopAddLocation(NPC, X + 7, Y, Z, 2, math.random(20,45))
	MovementLoopAddLocation(NPC, X + 4, Y, Z + 4, 2, math.random(20,45))
	MovementLoopAddLocation(NPC, X, Y, Z, 2, math.random(20,45))
end

function RouteTwo(NPC, Spawn)
    local X = GetX(NPC)
	local Y = GetY(NPC)
	local Z = GetZ(NPC)
    MovementLoopAddLocation(NPC, X, Y, Z, 2, math.random(2,10))
    MovementLoopAddLocation(NPC, X - 4, Y, Z, 2, math.random(20,45))
	MovementLoopAddLocation(NPC, X - 4, Y, Z - 4, 2, math.random(20,45))
	MovementLoopAddLocation(NPC, X - 7, Y, Z, 2, math.random(20,45))
	MovementLoopAddLocation(NPC, X - 4, Y, Z - 4, 2, math.random(20,45))
	MovementLoopAddLocation(NPC, X, Y, Z, 1, math.random(20,45))
end

function RouteThree(NPC, Spawn)
    local X = GetX(NPC)
	local Y = GetY(NPC)
	local Z = GetZ(NPC)
    MovementLoopAddLocation(NPC, X, Y, Z, 2, math.random(2,10))
	MovementLoopAddLocation(NPC, X + 4, Y, Z, 2, math.random(20,45))
	MovementLoopAddLocation(NPC, X + 4, Y, Z - 4, 2, math.random(20,45))
	MovementLoopAddLocation(NPC, X + 7, Y, Z, 2, math.random(20,45))
	MovementLoopAddLocation(NPC, X + 4, Y, Z - 4, 2, math.random(20,45))
	MovementLoopAddLocation(NPC, X, Y, Z, 2, math.random(20,45))
end

function RouteFour(NPC, Spawn)
    local X = GetX(NPC)
	local Y = GetY(NPC)
	local Z = GetZ(NPC)
    MovementLoopAddLocation(NPC, X, Y, Z, 2, math.random(2,10))
	MovementLoopAddLocation(NPC, X - 4, Y, Z, 2, math.random(20,45))
	MovementLoopAddLocation(NPC, X - 4, Y, Z + 4, 2, math.random(20,45))
	MovementLoopAddLocation(NPC, X - 7, Y, Z, 2, math.random(20,45))
	MovementLoopAddLocation(NPC, X - 4, Y, Z + 4, 2, math.random(20,45))
	MovementLoopAddLocation(NPC, X, Y, Z, 2, math.random(20,45))
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end