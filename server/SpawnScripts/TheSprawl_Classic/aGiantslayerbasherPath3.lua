--[[
    Script Name    : SpawnScripts/TheSprawl_Classic/aGiantslayerbasherPath3.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.11.19 05:11:49
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"
dofile("SpawnScripts/Generic/MonsterCallouts/Giantslayer.lua")

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    ogre(NPC)
    waypoints(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end


function respawn(NPC)
	spawn(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, 44.25, -2.67, -26.13, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 44.25, -2.67, -26.13, 2, 0)
	MovementLoopAddLocation(NPC, 46.43, -2.67, -32.19, 2, 0)
	MovementLoopAddLocation(NPC, 46.19, -2.63, -35.53, 2, 0)
	MovementLoopAddLocation(NPC, 42.08, -2.56, -46.55, 2, 0)
	MovementLoopAddLocation(NPC, 35.34, -2.47, -49.81, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 35.34, -2.47, -49.81, 2, 0)
	MovementLoopAddLocation(NPC, 38.88, -2.56, -48.9, 2, 0)
	MovementLoopAddLocation(NPC, 41.71, -2.56, -46.69, 2, 0)
	MovementLoopAddLocation(NPC, 45.44, -2.56, -37.59, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 45.44, -2.56, -37.59, 2, 0)
	MovementLoopAddLocation(NPC, 41.89, -2.56, -41.6, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 41.89, -2.56, -41.6, 2, 0)
	MovementLoopAddLocation(NPC, 44.58, -2.56, -37.55, 2, 0)
	MovementLoopAddLocation(NPC, 50.3, -2.67, -30.61, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 50.3, -2.67, -30.61, 2, 0)
	MovementLoopAddLocation(NPC, 48.39, -2.67, -32.09, 2, 0)
	MovementLoopAddLocation(NPC, 44.99, -2.56, -39.61, 2, 0)
	MovementLoopAddLocation(NPC, 42.22, -2.56, -46.44, 2, 0)
	MovementLoopAddLocation(NPC, 40.71, -2.56, -47.97, 2, 0)
	MovementLoopAddLocation(NPC, 36, -2.53, -49.92, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 36, -2.53, -49.92, 2, 0)
	MovementLoopAddLocation(NPC, 39.38, -2.56, -48.25, 2, 0)
	MovementLoopAddLocation(NPC, 42.31, -2.56, -43.66, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 42.31, -2.56, -43.66, 2, 0)
	MovementLoopAddLocation(NPC, 42.18, -2.56, -45.68, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 42.18, -2.56, -45.68, 2, 0)
	MovementLoopAddLocation(NPC, 44.43, -2.56, -42.49, 2, 0)
	MovementLoopAddLocation(NPC, 44.51, -2.56, -42.37, 2, 0)
	MovementLoopAddLocation(NPC, 44.91, -2.56, -36.8, 2, 0)
end