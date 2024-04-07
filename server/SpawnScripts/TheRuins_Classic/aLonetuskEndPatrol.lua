--[[
    Script Name    : SpawnScripts/TheRuins_Classic/aLonetuskEndPatrol.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.07.04 04:07:21
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
	MovementLoopAddLocation(NPC, -164.04, -2.67, 34.78, 2, 10)
	MovementLoopAddLocation(NPC, -159.92, -2.67, 34.68, 2, 0)
	MovementLoopAddLocation(NPC, -147.13, -2.67, 34.18, 2, 0)
	MovementLoopAddLocation(NPC, -142.66, -2.67, 31.82, 2, 10)
	MovementLoopAddLocation(NPC, -142.66, -2.67, 31.82, 2, 0)
	MovementLoopAddLocation(NPC, -146.47, -2.67, 33.88, 2, 0)
	
end
