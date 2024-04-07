--[[
    Script Name    : SpawnScripts/TheRuins_Classic/aBrokentuskpawnPath2.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.07.10 11:07:42
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
	MovementLoopAddLocation(NPC, -62.59, -2.66, 162.4, 2, math.random(10,15))
	MovementLoopAddLocation(NPC, -62.59, -2.66, 162.4, 2, 0)
	MovementLoopAddLocation(NPC, -57.18, -2.67, 154.81, 2, math.random(10,15))
	MovementLoopAddLocation(NPC, -57.18, -2.67, 154.81, 2, 0)
	MovementLoopAddLocation(NPC, -53.15, -2.67, 158.69, 2, math.random(10,15))
	MovementLoopAddLocation(NPC, -53.15, -2.67, 158.69, 2, 0)
	MovementLoopAddLocation(NPC, -57.11, -2.67, 152.18, 2, 0)
	MovementLoopAddLocation(NPC, -56.11, -2.67, 143.97, 2, math.random(10,15))
	MovementLoopAddLocation(NPC, -56.11, -2.67, 143.97, 2, 0)
	MovementLoopAddLocation(NPC, -55.91, -2.67, 148.18, 2, 0)
	MovementLoopAddLocation(NPC, -52.19, -2.67, 150.71, 2, math.random(10,15))
	MovementLoopAddLocation(NPC, -52.19, -2.67, 150.71, 2, 0)
	MovementLoopAddLocation(NPC, -62.54, -2.67, 154.17, 2, math.random(10,15))
	MovementLoopAddLocation(NPC, -62.54, -2.67, 154.17, 2, 0)
	MovementLoopAddLocation(NPC, -60.57, -2.67, 155.83, 2, 0)
	MovementLoopAddLocation(NPC, -57.74, -2.67, 161.5, 2, math.random(10,15))
	MovementLoopAddLocation(NPC, -57.74, -2.67, 161.5, 2, 0)
	MovementLoopAddLocation(NPC, -61.98, -2.55, 165.18, 2, 0)
end

