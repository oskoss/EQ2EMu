--[[
    Script Name    : SpawnScripts/TheRuins_Classic/aBrokentuskpawnPath1.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.07.10 11:07:00
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
	MovementLoopAddLocation(NPC, -57.01, -2.67, 149.23, 2, math.random(10,15))
	MovementLoopAddLocation(NPC, -57.01, -2.67, 149.23, 2, 0)
	MovementLoopAddLocation(NPC, -48.26, -2.56, 137.92, 2, math.random(10,15))
	MovementLoopAddLocation(NPC, -48.26, -2.56, 137.92, 2, 0)
	MovementLoopAddLocation(NPC, -60.21, -2.67, 159.33, 2, math.random(10,15))
	MovementLoopAddLocation(NPC, -60.21, -2.67, 159.33, 2, 0)
	MovementLoopAddLocation(NPC, -60.84, -2.52, 142.45, 2, math.random(10,15))
	MovementLoopAddLocation(NPC, -60.84, -2.52, 142.45, 2, 0)
	MovementLoopAddLocation(NPC, -60.64, -2.54, 144.59, 2, 0)
	MovementLoopAddLocation(NPC, -46.77, -2.59, 145.59, 2, math.random(10,15))
	MovementLoopAddLocation(NPC, -46.77, -2.59, 145.59, 2, 0)
	MovementLoopAddLocation(NPC, -50.22, -2.67, 146.25, 2, 0)
	MovementLoopAddLocation(NPC, -53.32, -2.67, 154.03, 2, math.random(10,15))
	MovementLoopAddLocation(NPC, -53.32, -2.67, 154.03, 2, 0)
	MovementLoopAddLocation(NPC, -57.61, -2.67, 153.46, 2, 0)
end

