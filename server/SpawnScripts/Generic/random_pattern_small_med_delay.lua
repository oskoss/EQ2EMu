--[[
    Script Name    : SpawnScripts/Generic/random_pattern_small_med_delay.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.09.02 06:09:29
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/CombatModule"

function spawn(NPC, Spawn)
    combatModule(NPC, Spawn)
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
    MovementLoopAddLocation(NPC, X, Y, Z, 2, math.random(7,15))
    MovementLoopAddLocation(NPC, X + 4, Y, Z, 2, math.random(7,15))
	MovementLoopAddLocation(NPC, X + 4, Y, Z + 4, 2, math.random(7,15))
	MovementLoopAddLocation(NPC, X + 4, Y, Z, 2, math.random(7,15))
	MovementLoopAddLocation(NPC, X + 4, Y, Z + 4, 2, math.random(7,15))
	MovementLoopAddLocation(NPC, X, Y, Z, 2, math.random(7,15), "ChooseMovement")
end

function RouteTwo(NPC, Spawn)
    local X = GetX(NPC)
	local Y = GetY(NPC)
	local Z = GetZ(NPC)
    MovementLoopAddLocation(NPC, X, Y, Z, 2, math.random(7,15))
    MovementLoopAddLocation(NPC, X - 4, Y, Z, 2, math.random(7,15))
	MovementLoopAddLocation(NPC, X - 4, Y, Z - 4, 2, math.random(7,15))
	MovementLoopAddLocation(NPC, X - 4, Y, Z, 2, math.random(7,15))
	MovementLoopAddLocation(NPC, X - 4, Y, Z - 4, 2, math.random(7,15))
	MovementLoopAddLocation(NPC, X, Y, Z, 1, math.random(7,15), "ChooseMovement")
end

function RouteThree(NPC, Spawn)
    local X = GetX(NPC)
	local Y = GetY(NPC)
	local Z = GetZ(NPC)
    MovementLoopAddLocation(NPC, X, Y, Z, 2, math.random(7,15))
	MovementLoopAddLocation(NPC, X + 4, Y, Z, 2,math.random(7,15))
	MovementLoopAddLocation(NPC, X + 4, Y, Z - 4, 2, math.random(7,15))
	MovementLoopAddLocation(NPC, X + 4, Y, Z, 2, math.random(7,15))
	MovementLoopAddLocation(NPC, X + 4, Y, Z - 4, 2, math.random(7,15))
	MovementLoopAddLocation(NPC, X, Y, Z, 2, math.random(7,15), "ChooseMovement")
end

function RouteFour(NPC, Spawn)
    local X = GetX(NPC)
	local Y = GetY(NPC)
	local Z = GetZ(NPC)
    MovementLoopAddLocation(NPC, X, Y, Z, 2, math.random(7,15))
	MovementLoopAddLocation(NPC, X - 4, Y, Z, 2, math.random(7,15))
	MovementLoopAddLocation(NPC, X - 4, Y, Z + 4, 2, math.random(7,15))
	MovementLoopAddLocation(NPC, X - 4, Y, Z, 2, math.random(7,15))
	MovementLoopAddLocation(NPC, X - 4, Y, Z + 4, 2, math.random(7,15))
	MovementLoopAddLocation(NPC, X, Y, Z, 2, math.random(7,15), "ChooseMovement")
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end