--[[
    Script Name    : SpawnScripts/TheRuins_Classic/aBrokentuskpawnPath3.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.07.10 11:07:48
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BrokenTusk1.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomWeapons(NPC)
    OrcArmorCommon(NPC)
    Brokentusk(NPC)
    waypoints(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, -45.55, -2.73, 148.9, 2, math.random(10,15))
	MovementLoopAddLocation(NPC, -45.55, -2.73, 148.9, 2, 0)
	MovementLoopAddLocation(NPC, -46.1, -2.74, 150.32, 2, 0)
	MovementLoopAddLocation(NPC, -54.93, -2.67, 157.47, 2, math.random(10,15))
	MovementLoopAddLocation(NPC, -54.93, -2.67, 157.47, 2, 0)
	MovementLoopAddLocation(NPC, -52.12, -2.67, 152.89, 2, math.random(10,15))
	MovementLoopAddLocation(NPC, -52.12, -2.67, 152.89, 2, 0)
	MovementLoopAddLocation(NPC, -51.27, -2.67, 159.18, 2, math.random(10,15))
	MovementLoopAddLocation(NPC, -51.27, -2.67, 159.18, 2, 0)
	MovementLoopAddLocation(NPC, -52.92, -2.67, 157.98, 2, 0)
	MovementLoopAddLocation(NPC, -58.98, -2.67, 156.81, 2, math.random(10,15))
	MovementLoopAddLocation(NPC, -58.98, -2.67, 156.81, 2, 0)
	MovementLoopAddLocation(NPC, -56.02, -2.67, 154.52, 2, 0)
	MovementLoopAddLocation(NPC, -52.67, -2.67, 148.81, 2, math.random(10,15))
	MovementLoopAddLocation(NPC, -52.67, -2.67, 148.81, 2, 0)
	MovementLoopAddLocation(NPC, -52.85, -2.67, 144.96, 2, math.random(10,15))
	MovementLoopAddLocation(NPC, -52.85, -2.67, 144.96, 2, 0)
	MovementLoopAddLocation(NPC, -52.85, -2.67, 144.96, 2, 0)
	MovementLoopAddLocation(NPC, -61.58, -2.52, 144.2, 2, math.random(10,15))
	MovementLoopAddLocation(NPC, -61.58, -2.52, 144.2, 2, 0)
	MovementLoopAddLocation(NPC, -58.63, -2.65, 146.28, 2, 0)
	MovementLoopAddLocation(NPC, -50.61, -2.67, 155.9, 2, math.random(10,15))
	MovementLoopAddLocation(NPC, -50.61, -2.67, 155.9, 2, 0)
end


