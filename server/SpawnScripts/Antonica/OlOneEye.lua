--[[
    Script Name    : SpawnScripts/Antonica/OlOneEye.lua
    Script Author  : Premierio015
    Script Date    : 2021.08.13 07:08:33
    Script Purpose : 
                   : 
--]]

local TheOneThatGotAway = 5338

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
    MovementLoopAddLocation(NPC, X, Y, Z, 2, 0)
    MovementLoopAddLocation(NPC, X + 5, Y, Z, 2,0)
	MovementLoopAddLocation(NPC, X , Y, Z + 8, 2, 0)
	MovementLoopAddLocation(NPC, X + 5, Y, Z -5, 2, 0)
	MovementLoopAddLocation(NPC, X + 8, Y, Z + 4, 2, 0)
	MovementLoopAddLocation(NPC, X, Y, Z, 2, math.random(5,10), "ChooseMovement")
end

function RouteTwo(NPC, Spawn)
    local X = GetX(NPC)
	local Y = GetY(NPC)
	local Z = GetZ(NPC)
    MovementLoopAddLocation(NPC, X, Y, Z, 2, 0)
    MovementLoopAddLocation(NPC, X - 8, Y, Z, 2, 0)
	MovementLoopAddLocation(NPC, X, Y, Z - 8, 2, 0)
	MovementLoopAddLocation(NPC, X - 5, Y, Z -5, 2, 0)
	MovementLoopAddLocation(NPC, X , Y, Z - 4, 2, 0)
	MovementLoopAddLocation(NPC, X, Y, Z, 1, 0,  "ChooseMovement")
end

function RouteThree(NPC, Spawn)
    local X = GetX(NPC)
	local Y = GetY(NPC)
	local Z = GetZ(NPC)
    MovementLoopAddLocation(NPC, X, Y, Z, 2, 0)
	MovementLoopAddLocation(NPC, X + 5, Y, Z, 2, 0)
	MovementLoopAddLocation(NPC, X -8, Y, Z - 4, 2, 0)
	MovementLoopAddLocation(NPC, X + 8, Y, Z -5, 2, 0)
	MovementLoopAddLocation(NPC, X + 5, Y, Z - 5, 2, 0)
	MovementLoopAddLocation(NPC, X, Y, Z, 2, 0, "ChooseMovement")
end

function RouteFour(NPC, Spawn)
    local X = GetX(NPC)
	local Y = GetY(NPC)
	local Z = GetZ(NPC)
    MovementLoopAddLocation(NPC, X, Y, Z, 2, 0)
	MovementLoopAddLocation(NPC, X - 5, Y, Z -8, 2, 0)
	MovementLoopAddLocation(NPC, X - 8, Y, Z + 5, 2, 0)
	MovementLoopAddLocation(NPC, X + 5, Y, Z, 2, 0)
	MovementLoopAddLocation(NPC, X - 8, Y, Z + 5, 2, 0)
	MovementLoopAddLocation(NPC, X, Y, Z, 2, 0, "ChooseMovement")
end



function spawn(NPC)
SetPlayerProximityFunction(NPC, 5, "InRange", "InRange", Spawn)
ChooseMovement(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end


function InRange(NPC, Spawn)
if GetQuestStep(Spawn, TheOneThatGotAway) == 1 then
SetStepComplete(Spawn, TheOneThatGotAway, 1)
end
	end


function respawn(NPC)
	spawn(NPC)
end