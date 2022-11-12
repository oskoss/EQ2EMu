--[[
    Script Name    : SpawnScripts/DownBelow_Classic/ajuvenileshrillerNook.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.11.09 08:11:41
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
    MovementLoopAddLocation(NPC, X, Y+0.5, Z, 1.5, 0)
    MovementLoopAddLocation(NPC, X + 1.5, Y, Z, 1.5, 0)
	MovementLoopAddLocation(NPC, X - 1.5, Y+0.5, Z + 1, 1.5, 0)
	MovementLoopAddLocation(NPC, X + 1.5, Y-0.5, Z, 1.5, 0)
	MovementLoopAddLocation(NPC, X - 1.5, Y, Z + 1, 1.5, 0)
	MovementLoopAddLocation(NPC, X, Y, Z, 1.5, 0, "ChooseMovement")
end

function RouteTwo(NPC, Spawn)
    local X = GetX(NPC)
	local Y = GetY(NPC)
	local Z = GetZ(NPC)
    MovementLoopAddLocation(NPC, X, Y, Z, 1.5, 0)
    MovementLoopAddLocation(NPC, X - 1.5, Y+ 0.5, Z, 1.5, 0)
	MovementLoopAddLocation(NPC, X + 1.5, Y+ 0.5, Z - 1, 1.5, 0)
	MovementLoopAddLocation(NPC, X - 1.5, Y- 0.5, Z, 1.5,0)
	MovementLoopAddLocation(NPC, X + 1.5, Y- 0.5, Z + 1, 1.5, 0)
	MovementLoopAddLocation(NPC, X, Y, Z, 1.5, 0, "ChooseMovement")
end

function RouteThree(NPC, Spawn)
    local X = GetX(NPC)
	local Y = GetY(NPC)
	local Z = GetZ(NPC)
    MovementLoopAddLocation(NPC, X, Y, Z, 1.5, 0)
	MovementLoopAddLocation(NPC, X + 1.5, Y+0.5, Z, 1.5, 0)
	MovementLoopAddLocation(NPC, X - 1.5, Y, Z - 1, 1.5, 0)
	MovementLoopAddLocation(NPC, X + 1.5, Y+0.5, Z+1, 1.5, 0)
	MovementLoopAddLocation(NPC, X - 1.5, Y-0.5, Z - 1, 1.5, 0)
	MovementLoopAddLocation(NPC, X, Y, Z, 1.5, 0, "ChooseMovement")
end

function RouteFour(NPC, Spawn)
    local X = GetX(NPC)
	local Y = GetY(NPC)
	local Z = GetZ(NPC)
    MovementLoopAddLocation(NPC, X, Y, Z, 1.5, 0)
	MovementLoopAddLocation(NPC, X - 1.5, Y-0.5, Z, 1.5, 0)
	MovementLoopAddLocation(NPC, X + 1.5, Y, Z + 1, 1.5, 0)
	MovementLoopAddLocation(NPC, X - 1.5, Y+0.5, Z, 1.5, 0)
	MovementLoopAddLocation(NPC, X + 1.5, Y+0.5, Z -1, 1.5, 0)
	MovementLoopAddLocation(NPC, X, Y, Z, 1.5, 0, "ChooseMovement")
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end