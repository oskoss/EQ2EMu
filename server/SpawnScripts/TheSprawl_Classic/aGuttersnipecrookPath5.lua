--[[
    Script Name    : SpawnScripts/TheSprawl_Classic/aGuttersnipecrookPath5.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.11.10 07:11:24
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
	MovementLoopAddLocation(NPC, -71.86, -4.42, 73.95, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -71.86, -4.42, 73.95, 2, 0)
	MovementLoopAddLocation(NPC, -69.51, -4.42, 86.58, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -69.51, -4.42, 86.58, 2, 0)
	MovementLoopAddLocation(NPC, -71.29, -4.42, 79.04, 2, 0)
	MovementLoopAddLocation(NPC, -79.43, -4.42, 70.16, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -79.43, -4.42, 70.16, 2, 0)
	MovementLoopAddLocation(NPC, -72.75, -4.42, 72.22, 2, 0)
	MovementLoopAddLocation(NPC, -61.2, -4.19, 80.74, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -61.2, -4.19, 80.74, 2, 0)
	MovementLoopAddLocation(NPC, -69.07, -4.42, 79.25, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -69.07, -4.42, 79.25, 2, 0)
	MovementLoopAddLocation(NPC, -61.43, -4.22, 81.96, 2, 0)
	MovementLoopAddLocation(NPC, -53.99, -2.79, 84.6, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -53.99, -2.79, 84.6, 2, 0)
	MovementLoopAddLocation(NPC, -59.52, -3.85, 83.78, 2, 0)
	MovementLoopAddLocation(NPC, -68.65, -4.42, 75.45, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -68.65, -4.42, 75.45, 2, 0)
	MovementLoopAddLocation(NPC, -68.68, -4.42, 81.99, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -68.68, -4.42, 81.99, 2, 0)
	MovementLoopAddLocation(NPC, -70.72, -4.42, 74, 2, 0)
	MovementLoopAddLocation(NPC, -75.14, -4.42, 66.68, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -75.14, -4.42, 66.68, 2, 0)
end
