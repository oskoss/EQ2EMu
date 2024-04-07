--[[
    Script Name    : SpawnScripts/Longshadow/aspiderhatchling.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.15 01:10:53
    Script Purpose : 
                   : 
--]]

require "SpawnScripts/Generic/CombatModule"

function spawn(NPC, Spawn)
    combatModule(NPC, Spawn)
    if GetSpawnLocationID(NPC) == 406177 or
    GetSpawnLocationID(NPC) == 405853 or
    GetSpawnLocationID(NPC) == 406036 or
    GetSpawnLocationID(NPC) == 133787022 or
    GetSpawnLocationID(NPC) == 133787023 or
    GetSpawnLocationID(NPC) == 133787024 then
    AddTimer(NPC,MakeRandomInt(0,4000),"ChooseMovement")
    elseif GetSpawnLocationID(NPC) == 405595 then
        AddTimer(NPC,MakeRandomInt(0,3500),"waypoints")
    end
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, -27.86, 4.13, 55.03, 6, math.random(11,15))
	MovementLoopAddLocation(NPC, -21.53, 4.00, 48.61, 6,  math.random(10,15))
	MovementLoopAddLocation(NPC, -26.84, 4.00, 47.38,6, math.random(10,15))
	MovementLoopAddLocation(NPC, -24.00, 4.41, 54.65, 6, math.random(10,15))
	MovementLoopAddLocation(NPC, -24.70, 4.00, 45.53, 6, math.random(10,15))
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
    MovementLoopAddLocation(NPC, X, Y, Z, 6, math.random(6,10))
    MovementLoopAddLocation(NPC, X + 4, Y, Z, 6, math.random(10,15))
	MovementLoopAddLocation(NPC, X + 4, Y, Z + 4, 6, math.random(10,15))
	MovementLoopAddLocation(NPC, X + 7, Y, Z, 6, math.random(10,15))
	MovementLoopAddLocation(NPC, X + 4, Y, Z + 4, 6, math.random(10,15))
	MovementLoopAddLocation(NPC, X, Y, Z, 6, math.random(10,15))
end

function RouteTwo(NPC, Spawn)
    local X = GetX(NPC)
	local Y = GetY(NPC)
	local Z = GetZ(NPC)
    MovementLoopAddLocation(NPC, X, Y, Z, 6, math.random(6,10))
    MovementLoopAddLocation(NPC, X - 4, Y, Z, 6, math.random(10,15))
	MovementLoopAddLocation(NPC, X - 4, Y, Z - 4, 6, math.random(10,15))
	MovementLoopAddLocation(NPC, X - 7, Y, Z, 6, math.random(10,15))
	MovementLoopAddLocation(NPC, X - 4, Y, Z - 4, 6, math.random(10,15))
	MovementLoopAddLocation(NPC, X, Y, Z, 6, math.random(10,15))
end

function RouteThree(NPC, Spawn)
    local X = GetX(NPC)
	local Y = GetY(NPC)
	local Z = GetZ(NPC)
    MovementLoopAddLocation(NPC, X, Y, Z, 6, math.random(6,10))
	MovementLoopAddLocation(NPC, X + 4, Y, Z, 6, math.random(10,15))
	MovementLoopAddLocation(NPC, X + 4, Y, Z - 4, 6, math.random(10,15))
	MovementLoopAddLocation(NPC, X + 7, Y, Z, 6, math.random(10,15))
	MovementLoopAddLocation(NPC, X + 4, Y, Z - 4, 6, math.random(10,15))
	MovementLoopAddLocation(NPC, X, Y, Z, 6, math.random(10,15))
end

function RouteFour(NPC, Spawn)
    local X = GetX(NPC)
	local Y = GetY(NPC)
	local Z = GetZ(NPC)
    MovementLoopAddLocation(NPC, X, Y, Z, 6, math.random(6,10))
	MovementLoopAddLocation(NPC, X - 4, Y, Z, 6, math.random(10,15))
	MovementLoopAddLocation(NPC, X - 4, Y, Z + 4, 6, math.random(10,15))
	MovementLoopAddLocation(NPC, X - 7, Y, Z, 6, math.random(10,15))
	MovementLoopAddLocation(NPC, X - 4, Y, Z + 4, 6, math.random(10,15))
	MovementLoopAddLocation(NPC, X, Y, Z, 6, math.random(10,15))
end

function respawn(NPC, Spawn)
    spawn(NPC)
end
