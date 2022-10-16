--[[
    Script Name    : SpawnScripts/Antonica/acisternworm.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.07.19 05:07:43
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
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
    MovementLoopAddLocation(NPC, X + 8, Y, Z, 2, math.random(20,45))
	MovementLoopAddLocation(NPC, X + 8, Y, Z + 4, 2, math.random(20,45))
	MovementLoopAddLocation(NPC, X + 14, Y, Z, 2, math.random(20,45))
	MovementLoopAddLocation(NPC, X + 8, Y, Z + 4, 2, math.random(20,45))
	MovementLoopAddLocation(NPC, X, Y, Z, 2, math.random(20,45))
end

function RouteTwo(NPC, Spawn)
    local X = GetX(NPC)
	local Y = GetY(NPC)
	local Z = GetZ(NPC)
    MovementLoopAddLocation(NPC, X, Y, Z, 2, math.random(2,10))
    MovementLoopAddLocation(NPC, X - 8, Y, Z, 2, math.random(20,45))
	MovementLoopAddLocation(NPC, X - 8, Y, Z - 4, 2, math.random(20,45))
	MovementLoopAddLocation(NPC, X - 14, Y, Z, 2, math.random(20,45))
	MovementLoopAddLocation(NPC, X - 8, Y, Z - 4, 2, math.random(20,45))
	MovementLoopAddLocation(NPC, X, Y, Z, 1, math.random(20,45))
end

function RouteThree(NPC, Spawn)
    local X = GetX(NPC)
	local Y = GetY(NPC)
	local Z = GetZ(NPC)
    MovementLoopAddLocation(NPC, X, Y, Z, 2, math.random(2,10))
	MovementLoopAddLocation(NPC, X + 8, Y, Z, 2, math.random(20,45))
	MovementLoopAddLocation(NPC, X + 8, Y, Z - 4, 2, math.random(20,45))
	MovementLoopAddLocation(NPC, X + 14, Y, Z, 2, math.random(20,45))
	MovementLoopAddLocation(NPC, X + 8, Y, Z - 4, 2, math.random(20,45))
	MovementLoopAddLocation(NPC, X, Y, Z, 2, math.random(20,45))
end

function RouteFour(NPC, Spawn)
    local X = GetX(NPC)
	local Y = GetY(NPC)
	local Z = GetZ(NPC)
    MovementLoopAddLocation(NPC, X, Y, Z, 2, math.random(2,10))
	MovementLoopAddLocation(NPC, X - 8, Y, Z, 2, math.random(20,45))
	MovementLoopAddLocation(NPC, X - 8, Y, Z + 4, 2, math.random(20,45))
	MovementLoopAddLocation(NPC, X - 14, Y, Z, 2, math.random(20,45))
	MovementLoopAddLocation(NPC, X - 8, Y, Z + 4, 2, math.random(20,45))
	MovementLoopAddLocation(NPC, X, Y, Z, 2, math.random(20,45))
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end