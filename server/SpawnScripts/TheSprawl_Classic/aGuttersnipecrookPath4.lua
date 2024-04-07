--[[
    Script Name    : SpawnScripts/TheSprawl_Classic/aGuttersnipecrookPath4.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.11.10 07:11:57
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
	MovementLoopAddLocation(NPC, -77.85, -4.29, 62.21, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -77.85, -4.29, 62.21, 2, 0)
	MovementLoopAddLocation(NPC, -72.6, -4.42, 67.17, 2, 0)
	MovementLoopAddLocation(NPC, -68.36, -4.42, 74.23, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -68.36, -4.42, 74.23, 2, 0)
	MovementLoopAddLocation(NPC, -72.31, -4.42, 69.09, 2, 0)
	MovementLoopAddLocation(NPC, -86.31, -4.24, 56.54, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -86.31, -4.24, 56.54, 2, 0)
	MovementLoopAddLocation(NPC, -79.99, -4.24, 61.65, 2, 0)
	MovementLoopAddLocation(NPC, -77.69, -4.42, 72.62, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -77.69, -4.42, 72.62, 2, 0)
	MovementLoopAddLocation(NPC, -73.83, -4.42, 64.21, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -73.83, -4.42, 64.21, 2, 0)
	MovementLoopAddLocation(NPC, -74.09, -4.42, 70.83, 2, 0)
	MovementLoopAddLocation(NPC, -72.8, -4.42, 76.81, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -72.8, -4.42, 76.81, 2, 0)
	MovementLoopAddLocation(NPC, -78.88, -4.24, 61.92, 2, 0)
	MovementLoopAddLocation(NPC, -76.32, -4.31, 53.17, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -76.32, -4.31, 53.17, 2, 0)
end
