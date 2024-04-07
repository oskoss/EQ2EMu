--[[
    Script Name    : SpawnScripts/TheSprawl_Classic/ahalflingupstartPath3.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.11.24 10:11:33
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
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, -14.74, -2.53, 16.9, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -14.74, -2.53, 16.9, 2, 0)
	MovementLoopAddLocation(NPC, -18.45, -2.53, 19.78, 2, 0)
	MovementLoopAddLocation(NPC, -22.74, -2.53, 24.09, 2, 0)
	MovementLoopAddLocation(NPC, -22.87, -2.61, 30.96, 2, 0)
	MovementLoopAddLocation(NPC, -20.91, -2.57, 35.81, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -20.91, -2.57, 35.81, 2, 0)
	MovementLoopAddLocation(NPC, -23.44, -2.67, 31.46, 2, 0)
	MovementLoopAddLocation(NPC, -24.44, -2.53, 26.55, 2, 0)
	MovementLoopAddLocation(NPC, -30.17, -2.67, 24.49, 2, 0)
	MovementLoopAddLocation(NPC, -40.85, -2.65, 20.83, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -40.85, -2.65, 20.83, 2, 0)
	MovementLoopAddLocation(NPC, -35.18, -2.67, 22.51, 2, 0)
	MovementLoopAddLocation(NPC, -25.51, -2.53, 23.44, 2, 0)
	MovementLoopAddLocation(NPC, -19, -2.53, 20.47, 2, 0)
	MovementLoopAddLocation(NPC, -15.49, -2.53, 14.54, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -15.49, -2.53, 14.54, 2, 0)
	MovementLoopAddLocation(NPC, -15.12, -2.53, 17.62, 2, 0)
	MovementLoopAddLocation(NPC, -12.78, -2.67, 21.84, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -12.78, -2.67, 21.84, 2, 0)
	MovementLoopAddLocation(NPC, -15.77, -2.53, 18.11, 2, 0)
	MovementLoopAddLocation(NPC, -13.35, -2.53, 12.57, 2, 0)
	MovementLoopAddLocation(NPC, -9.82, -2.53, 8.48, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -9.82, -2.53, 8.48, 2, 0)
	MovementLoopAddLocation(NPC, -12.45, -2.53, 10.42, 2, 0)
	MovementLoopAddLocation(NPC, -16.5, -2.53, 16.93, 2, 0)
	MovementLoopAddLocation(NPC, -21.29, -2.53, 21.15, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -21.29, -2.53, 21.15, 2, 0)
	MovementLoopAddLocation(NPC, -17.87, -2.53, 17.75, 2, 0)
	MovementLoopAddLocation(NPC, -10.57, -2.56, 15.86, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -10.57, -2.56, 15.86, 2, 0)
end
