--[[
    Script Name    : SpawnScripts/TheSprawl_Classic/ahalflingupstartPath1.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.11.24 10:11:35
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"
dofile("SpawnScripts/Generic/MonsterCallouts/QeynosAgitator.lua")

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    halfling(NPC)
    waypoints(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, -14.01, -2.53, -2.99, 2, MakeRandomInt(8,10))
	MovementLoopAddLocation(NPC, -14.01, -2.53, -2.99, 2, 0)
	MovementLoopAddLocation(NPC, -14.69, -2.57, -6.51, 2, 0)
	MovementLoopAddLocation(NPC, -11.7, -2.67, -12.15, 2, 0)
	MovementLoopAddLocation(NPC, -10.44, -2.67, -16.17, 2, 0)
	MovementLoopAddLocation(NPC, -7.71, -2.56, -18.81, 2, 0)
	MovementLoopAddLocation(NPC, -2.21, -2.62, -18.75, 2, 0)
	MovementLoopAddLocation(NPC, 0.01, -2.66, -18.87, 2, 0)
	MovementLoopAddLocation(NPC, 1.12, -2.67, -18.62, 2, MakeRandomInt(8,10))
	MovementLoopAddLocation(NPC, 1.12, -2.67, -18.62, 2, 0)
	MovementLoopAddLocation(NPC, 0.34, -2.67, -18.85, 2, 0)
	MovementLoopAddLocation(NPC, -2.67, -2.63, -18.65, 2, 0)
	MovementLoopAddLocation(NPC, -6.95, -2.67, -16.82, 2, 0)
	MovementLoopAddLocation(NPC, -14.24, -2.67, -8.71, 2, 0)
	MovementLoopAddLocation(NPC, -12.96, -2.53, 1.37, 2, 0)
	MovementLoopAddLocation(NPC, -12.26, -2.53, 9.5, 2, 0)
	MovementLoopAddLocation(NPC, -9.48, -2.53, 11.66, 2, MakeRandomInt(8,10))
	MovementLoopAddLocation(NPC, -9.48, -2.53, 11.66, 2, 0)
	MovementLoopAddLocation(NPC, -12.92, -2.53, 8.84, 2, 0)
	MovementLoopAddLocation(NPC, -15.2, -2.53, -5.31, 2, 0)
	MovementLoopAddLocation(NPC, -18.2, -2.67, -9.23, 2, 0)
	MovementLoopAddLocation(NPC, -18.2, -2.67, -9.23, 2, 0)
	MovementLoopAddLocation(NPC, -15.82, -2.64, -6.74, 2, 0)
	MovementLoopAddLocation(NPC, -12.68, -2.53, 3.75, 2, 0)
	MovementLoopAddLocation(NPC, -10.31, -2.53, 5.49, 2, MakeRandomInt(8,10))
	MovementLoopAddLocation(NPC, -10.31, -2.53, 5.49, 2, 0)
	MovementLoopAddLocation(NPC, -11.58, -2.53, 5.39, 2, 0)
	MovementLoopAddLocation(NPC, -16.09, -2.53, 12.84, 2, MakeRandomInt(8,10))
	MovementLoopAddLocation(NPC, -16.09, -2.53, 12.84, 2, 0)
	MovementLoopAddLocation(NPC, -13.95, -2.53, 8.85, 2, 0)
	MovementLoopAddLocation(NPC, -13.7, -2.53, 5.33, 2, 0)
	MovementLoopAddLocation(NPC, -16.94, -2.61, 3.88, 2, 0)
	MovementLoopAddLocation(NPC, -21.03, -2.67, 4.08, 2, MakeRandomInt(8,10))
	MovementLoopAddLocation(NPC, -21.03, -2.67, 4.08, 2, 0)
	MovementLoopAddLocation(NPC, -16.68, -2.6, 4.12, 2, 0)
	MovementLoopAddLocation(NPC, -8.41, -2.67, -0.5, 2, MakeRandomInt(8,10))
	MovementLoopAddLocation(NPC, -8.41, -2.67, -0.5, 2, 0)
	MovementLoopAddLocation(NPC, -12.58, -2.53, 0.39, 2, 0)
	MovementLoopAddLocation(NPC, -15.15, -2.67, -7.13, 2, MakeRandomInt(8,10))
	MovementLoopAddLocation(NPC, -15.15, -2.67, -7.13, 2, 0)
	MovementLoopAddLocation(NPC, -14.17, -2.53, -0.48, 2, 0)
	MovementLoopAddLocation(NPC, -12.4, -2.53, 4.21, 2, MakeRandomInt(8,10))
	MovementLoopAddLocation(NPC, -12.4, -2.53, 4.21, 2, 0)
end
