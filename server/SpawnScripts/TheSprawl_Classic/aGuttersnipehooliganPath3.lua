--[[
    Script Name    : SpawnScripts/TheSprawl_Classic/aGuttersnipehooliganPath3.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.11.10 07:11:28
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
	MovementLoopAddLocation(NPC, -82.15, -4.24, 45.42, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -82.15, -4.24, 45.42, 2, 0)
	MovementLoopAddLocation(NPC, -89.7, -4.42, 41.81, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -89.7, -4.42, 41.81, 2, 0)
	MovementLoopAddLocation(NPC, -83.6, -4.24, 45.72, 2, 0)
	MovementLoopAddLocation(NPC, -74.27, -4.42, 45.08, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -74.27, -4.42, 45.08, 2, 0)
	MovementLoopAddLocation(NPC, -80.13, -4.28, 45.03, 2, 0)
	MovementLoopAddLocation(NPC, -82.81, -4.24, 47.67, 2, 0)
	MovementLoopAddLocation(NPC, -82.47, -4.24, 60.83, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -82.47, -4.24, 60.83, 2, 0)
	MovementLoopAddLocation(NPC, -82.23, -4.24, 58.34, 2, 0)
	MovementLoopAddLocation(NPC, -75.78, -4.25, 55.02, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -75.78, -4.25, 55.02, 2, 0)
	MovementLoopAddLocation(NPC, -80.8, -4.24, 57.8, 2, 0)
	MovementLoopAddLocation(NPC, -80.57, -4.42, 68.19, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -80.57, -4.42, 68.19, 2, 0)
	MovementLoopAddLocation(NPC, -80.21, -4.24, 62.85, 2, 0)
	MovementLoopAddLocation(NPC, -84.14, -4.24, 41.95, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -84.14, -4.24, 41.95, 2, 0)
end


