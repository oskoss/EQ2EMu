--[[
    Script Name    : SpawnScripts/TheSprawl_Classic/aGiantslayerbasherPath1.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.11.18 09:11:50
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
	MovementLoopAddLocation(NPC, 1.87, -2.58, -55, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 1.87, -2.58, -55, 2, 0)
	MovementLoopAddLocation(NPC, -7.61, -2.51, -55.75, 2, 0)
	MovementLoopAddLocation(NPC, -21.91, -2.59, -51.93, 2, 0)
	MovementLoopAddLocation(NPC, -28.34, -2.82, -49, 2, 0)
	MovementLoopAddLocation(NPC, -32.28, -3.65, -46.4, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -32.28, -3.65, -46.4, 2, 0)
	MovementLoopAddLocation(NPC, -29.2, -2.93, -48.01, 2, 0)
	MovementLoopAddLocation(NPC, -24.54, -2.67, -50.65, 2, 0)
	MovementLoopAddLocation(NPC, -19.3, -2.51, -52.23, 2, 0)
	MovementLoopAddLocation(NPC, -13, -2.51, -53.07, 2, 0)
	MovementLoopAddLocation(NPC, -8.82, -2.51, -54.99, 2, 0)
	MovementLoopAddLocation(NPC, 8.7, -2.67, -54.65, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 8.7, -2.67, -54.65, 2, 0)
	MovementLoopAddLocation(NPC, 7.41, -2.67, -54.27, 2, 0)
	MovementLoopAddLocation(NPC, 5.85, -2.67, -48.76, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 5.85, -2.67, -48.76, 2, 0)
	MovementLoopAddLocation(NPC, 5.09, -2.67, -51.9, 2, 0)
	MovementLoopAddLocation(NPC, -6.5, -2.51, -57.11, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -6.5, -2.51, -57.11, 2, 0)
	MovementLoopAddLocation(NPC, -2.67, -2.51, -56.01, 2, 0)
	MovementLoopAddLocation(NPC, 8.94, -2.67, -54.34, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 8.94, -2.67, -54.34, 2, 0)
end