--[[
    Script Name    : SpawnScripts/BeggarsCourt/Hodstock.lua
    Script Author  : torsten
    Script Date    : 2022.07.18 06:07:41
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/CombatModule"

function spawn(NPC)
    waypoints(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, -7.81, 3, -19.57, 1, math.random(2,12))
	MovementLoopAddLocation(NPC, -3.46, 3.5, -21.79, 1, math.random(2,12))
	MovementLoopAddLocation(NPC, 7.94, 4.75, -27.61, 1, math.random(2,12))
	MovementLoopAddLocation(NPC, 18.88, 5, -23.11, 1, math.random(2,12))
	MovementLoopAddLocation(NPC, 24.79, 5.25, -12.29, 1, math.random(2,12))
	MovementLoopAddLocation(NPC, 32.19, 3.5, 1.29, 1, math.random(2,12))
	MovementLoopAddLocation(NPC, 19.57, 3.5, 3.37, 1, math.random(2,12))
	MovementLoopAddLocation(NPC, 3.06, 2.5, 6.1, 1, math.random(2,12))
	MovementLoopAddLocation(NPC, -21.48, 2, -8.8, 1, math.random(2,12))
	MovementLoopAddLocation(NPC, -22.21, 3, -29.52, 1, math.random(2,12))
	MovementLoopAddLocation(NPC, -2.74, 4.75, -41.91, 1, math.random(2,12))
	MovementLoopAddLocation(NPC, -11.8, 3.75, -32.19, 1, math.random(2,12))
	MovementLoopAddLocation(NPC, -6.42, 3.25, -19.49, 1, math.random(2,12))
end