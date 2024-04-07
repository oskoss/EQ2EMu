--[[
    Script Name    : SpawnScripts/TheSprawl_Classic/aGuttersnipehooliganPath2.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.11.10 04:11:53
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"
dofile ("SpawnScripts/Generic/MonsterCallouts/Guttersnipe.lua")

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    human(NPC)
    waypoints(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, -84.19, -4.24, 23.4, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -84.19, -4.24, 23.4, 2, 0)
	MovementLoopAddLocation(NPC, -83.79, -4.24, 30.8, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -83.79, -4.24, 30.8, 2, 0)
	MovementLoopAddLocation(NPC, -81.94, -4.24, 28.78, 2, 0)
	MovementLoopAddLocation(NPC, -75.81, -4.42, 26.35, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -75.81, -4.42, 26.35, 2, 0)
	MovementLoopAddLocation(NPC, -80.64, -4.24, 26.86, 2, 0)
	MovementLoopAddLocation(NPC, -85.33, -4.24, 24.85, 2, 0)
	MovementLoopAddLocation(NPC, -90.24, -4.28, 19.01, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -90.24, -4.28, 19.01, 2, 0)
	MovementLoopAddLocation(NPC, -87.85, -4.24, 25.15, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -87.85, -4.24, 25.15, 2, 0)
	MovementLoopAddLocation(NPC, -86.61, -4.24, 19.4, 2, 0)
	MovementLoopAddLocation(NPC, -79.62, -4.24, 12.38, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -79.62, -4.24, 12.38, 2, 0)
	MovementLoopAddLocation(NPC, -81.65, -4.24, 13.84, 2, 0)
	MovementLoopAddLocation(NPC, -83.62, -4.24, 20.29, 2, 0)
	MovementLoopAddLocation(NPC, -83.76, -4.24, 28.31, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -83.76, -4.24, 28.31, 2, 0)
	MovementLoopAddLocation(NPC, -89.81, -4.24, 29.44, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -89.81, -4.24, 29.44, 2, 0)
end

