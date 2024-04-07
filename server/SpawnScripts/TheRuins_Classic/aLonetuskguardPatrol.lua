--[[
    Script Name    : SpawnScripts/TheRuins_Classic/aLonetuskguardPatrol.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.07.03 04:07:12
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/LoneTusk2.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomWeapons(NPC)
    OrcArmorCommon(NPC)
    Lonetusk(NPC)
    waypoints(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, -102.25, -2.65, 22.64, 2, 10)
	MovementLoopAddLocation(NPC, -102.25, -2.65, 22.64, 2, 0)
	MovementLoopAddLocation(NPC, -112.04, -2.61, 19.86, 2, 0)
	MovementLoopAddLocation(NPC, -120.98, -2.59, 18.02, 2, 0)
	MovementLoopAddLocation(NPC, -121.97, -2.58, 18.39, 2, 0)
	MovementLoopAddLocation(NPC, -126.98, -2.59, 21.28, 2, 0)
	MovementLoopAddLocation(NPC, -130.07, -2.59, 23.51, 2, 0)
	MovementLoopAddLocation(NPC, -137, -2.59, 26.03, 2, 10)
	MovementLoopAddLocation(NPC, -137, -2.59, 26.03, 2, 0)
	MovementLoopAddLocation(NPC, -132.45, -2.59, 25.01, 2, 0)
	MovementLoopAddLocation(NPC, -128.31, -2.59, 22.53, 2, 0)
	MovementLoopAddLocation(NPC, -123.77, -2.58, 18.95, 2, 0)
	MovementLoopAddLocation(NPC, -118.68, -2.59, 18.74, 2, 0)
	MovementLoopAddLocation(NPC, -112.85, -2.61, 19.69, 2, 0)
	MovementLoopAddLocation(NPC, -108.17, -2.63, 21.75, 2, 0)
end

