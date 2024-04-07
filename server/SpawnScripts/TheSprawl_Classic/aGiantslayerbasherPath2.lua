--[[
    Script Name    : SpawnScripts/TheSprawl_Classic/aGiantslayerbasherPath2.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.11.18 09:11:16
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
	MovementLoopAddLocation(NPC, 14.49, -2.54, -54.5, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 14.49, -2.54, -54.5, 2, 0)
	MovementLoopAddLocation(NPC, 18.89, -2.54, -53.47, 2, 0)
	MovementLoopAddLocation(NPC, 25.99, -2.54, -53.76, 2, 0)
	MovementLoopAddLocation(NPC, 30.6, -2.54, -53.16, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 30.6, -2.54, -53.16, 2, 0)
	MovementLoopAddLocation(NPC, 27, -2.54, -53.13, 2, 0)
	MovementLoopAddLocation(NPC, 23.63, -2.59, -50.38, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 23.63, -2.59, -50.38, 2, 0)
	MovementLoopAddLocation(NPC, 19.31, -2.54, -54.49, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 19.31, -2.54, -54.49, 2, 0)
	MovementLoopAddLocation(NPC, 26.79, -2.54, -52.52, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 26.79, -2.54, -52.52, 2, 0)
	MovementLoopAddLocation(NPC, 18.57, -2.54, -53.02, 2, 0)
	MovementLoopAddLocation(NPC, 12.01, -2.62, -50.82, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 12.01, -2.62, -50.82, 2, 0)
	MovementLoopAddLocation(NPC, 19.73, -2.54, -55.21, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 19.73, -2.54, -55.21, 2, 0)
end