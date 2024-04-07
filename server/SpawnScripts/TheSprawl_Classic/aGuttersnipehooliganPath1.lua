--[[
    Script Name    : SpawnScripts/TheSprawl_Classic/aGuttersnipehooliganPath1.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.11.10 04:11:20
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
	MovementLoopAddLocation(NPC, -83.41, -5.02, -13.62, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -83.41, -5.02, -13.62, 2, 0)
	MovementLoopAddLocation(NPC, -90.06, -5.29, -19.28, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -90.06, -5.29, -19.28, 2, 0)
	MovementLoopAddLocation(NPC, -83.67, -4.83, -12.07, 2, 0)
	MovementLoopAddLocation(NPC, -83.96, -4.24, 3.98, 2, 0)
	MovementLoopAddLocation(NPC, -79.49, -4.24, 8.29, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -79.49, -4.24, 8.29, 2, 0)
	MovementLoopAddLocation(NPC, -82.79, -4.24, 6.55, 2, 0)
	MovementLoopAddLocation(NPC, -88.38, -4.26, 10.9, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -88.38, -4.26, 10.9, 2, 0)
	MovementLoopAddLocation(NPC, -85.52, -4.24, 1.29, 2, 0)
	MovementLoopAddLocation(NPC, -83.59, -4.73, -11.24, 2, 0)
	MovementLoopAddLocation(NPC, -81.12, -4.99, -11.41, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -81.12, -4.99, -11.41, 2, 0)
	MovementLoopAddLocation(NPC, -82.85, -4.7, -10.62, 2, 0)
	MovementLoopAddLocation(NPC, -83.92, -4.28, -4.22, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -83.92, -4.28, -4.22, 2, 0)
end

