--[[
    Script Name    : SpawnScripts/TheSprawl_Classic/aGuttersnipehooliganPath7.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.11.10 08:11:44
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
	MovementLoopAddLocation(NPC, -111.88, -4.23, 109.26, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -111.88, -4.23, 109.26, 2, 0)
	MovementLoopAddLocation(NPC, -114.55, -4.21, 107.69, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -114.55, -4.21, 107.69, 2, 0)
	MovementLoopAddLocation(NPC, -109.62, -4.24, 109.14, 2, 0)
	MovementLoopAddLocation(NPC, -94.82, -4.24, 109.43, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -94.82, -4.24, 109.43, 2, 0)
	MovementLoopAddLocation(NPC, -98.01, -4.24, 108.9, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -98.01, -4.24, 108.9, 2, 0)
	MovementLoopAddLocation(NPC, -100.72, -4.41, 105.04, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -100.72, -4.41, 105.04, 2, 0)
	MovementLoopAddLocation(NPC, -99.36, -4.24, 108.39, 2, 0)
	MovementLoopAddLocation(NPC, -93.67, -4.24, 111.07, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -93.67, -4.24, 111.07, 2, 0)
	MovementLoopAddLocation(NPC, -99.3, -4.24, 112.69, 2, 0)
	MovementLoopAddLocation(NPC, -102.32, -4.42, 117.96, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -102.32, -4.42, 117.96, 2, 0)
	MovementLoopAddLocation(NPC, -101.23, -4.24, 112.48, 2, 0)
	MovementLoopAddLocation(NPC, -102.58, -4.24, 111.2, 2, 0)
	MovementLoopAddLocation(NPC, -113.67, -4.22, 108.44, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -113.67, -4.22, 108.44, 2, 0)
	MovementLoopAddLocation(NPC, -113.29, -4.22, 110.43, 2, 0)
	MovementLoopAddLocation(NPC, -115.09, -4.35, 113.3, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -115.09, -4.35, 113.3, 2, 0)
	MovementLoopAddLocation(NPC, -112.75, -4.23, 110.67, 2, 0)
	MovementLoopAddLocation(NPC, -100.01, -4.24, 110.09, 2, math.random(8,15))
	MovementLoopAddLocation(NPC, -100.01, -4.24, 110.09, 2, 0)
end
