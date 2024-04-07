--[[
    Script Name    : SpawnScripts/TheSprawl_Classic/aGuttersnipecrookPath6.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.11.10 08:11:59
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
	MovementLoopAddLocation(NPC, -84.38, -4.24, 109.5, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -84.38, -4.24, 109.5, 2, 0)
	MovementLoopAddLocation(NPC, -79.74, -4.24, 107.78, 2, 0)
	MovementLoopAddLocation(NPC, -74.8, -4.24, 104.19, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -74.8, -4.24, 104.19, 2, 0)
	MovementLoopAddLocation(NPC, -78.64, -4.24, 107.01, 2, 0)
	MovementLoopAddLocation(NPC, -86.33, -4.24, 108.63, 2, 0)
	MovementLoopAddLocation(NPC, -92.7, -4.24, 111.32, 2, 0)
	MovementLoopAddLocation(NPC, -94.5, -4.3, 113.47, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -94.5, -4.3, 113.47, 2, 0)
	MovementLoopAddLocation(NPC, -93.16, -4.24, 110.35, 2, 0)
	MovementLoopAddLocation(NPC, -90.94, -4.42, 101.91, 2, 0)
	MovementLoopAddLocation(NPC, -89.38, -4.42, 101.71, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -89.38, -4.42, 101.71, 2, 0)
	MovementLoopAddLocation(NPC, -89.88, -4.42, 102.15, 2, 0)
	MovementLoopAddLocation(NPC, -89.69, -4.24, 108.86, 2, 0)
	MovementLoopAddLocation(NPC, -80.9, -4.24, 108.65, 2, 0)
	MovementLoopAddLocation(NPC, -74.12, -4.42, 111.17, 2, 0)
	MovementLoopAddLocation(NPC, -71.58, -4.42, 114.69, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -71.58, -4.42, 114.69, 2, 0)
	MovementLoopAddLocation(NPC, -75.18, -4.42, 111.51, 2, 0)
	MovementLoopAddLocation(NPC, -79.94, -4.24, 108.73, 2, 0)
	MovementLoopAddLocation(NPC, -92.17, -4.24, 107.61, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -92.17, -4.24, 107.61, 2, 0)
	MovementLoopAddLocation(NPC, -89.01, -4.24, 109.33, 2, 0)
	MovementLoopAddLocation(NPC, -80.21, -4.24, 108.17, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -80.21, -4.24, 108.17, 2, 0)
end
