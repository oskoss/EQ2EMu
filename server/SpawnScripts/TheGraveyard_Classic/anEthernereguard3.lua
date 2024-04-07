--[[
    Script Name    : SpawnScripts/TheGraveyard_Classic/anEthernereguard3.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.08.14 11:08:39
    Script Purpose : 
                   : 
--]]

dofile("SpawnScripts/Generic/MonsterCallouts/BaseDarkElf1.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    AddTimer(NPC, 6000, "waypoints")
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	SendMessage(Spawn,"The ethernere guard stares you down. They obviously don't have time for you.","white")
end

function respawn(NPC)
	spawn(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, 90.95, -1.77, 102.9, 2, 0)
	MovementLoopAddLocation(NPC, 90.95, -1.77, 102.9, 2, 0)
	MovementLoopAddLocation(NPC, 86.74, -1.87, 92.78, 2, 0)
	MovementLoopAddLocation(NPC, 83.35, -1.93, 85.72, 2, 0)
	MovementLoopAddLocation(NPC, 76.43, -2.04, 78.53, 2, 0)
	MovementLoopAddLocation(NPC, 68.95, -2.22, 75.45, 2, 0)
	MovementLoopAddLocation(NPC, 58.53, -2.73, 75.28, 2, 0)
	MovementLoopAddLocation(NPC, 47.8, -3.32, 76.48, 2, 0)
	MovementLoopAddLocation(NPC, 35.66, -4.11, 77.36, 2, 0)
	MovementLoopAddLocation(NPC, 35.66, -4.11, 77.36, 2, 0)
	MovementLoopAddLocation(NPC, 41.35, -3.74, 77.1, 2, 0)
	MovementLoopAddLocation(NPC, 51.59, -3.08, 75.73, 2, 0)
	MovementLoopAddLocation(NPC, 60.87, -2.61, 74.78, 2, 0)
	MovementLoopAddLocation(NPC, 68.66, -2.23, 75.51, 2, 0)
	MovementLoopAddLocation(NPC, 74.56, -2.07, 77.29, 2, 0)
	MovementLoopAddLocation(NPC, 78.75, -2, 80.6, 2, 0)
	MovementLoopAddLocation(NPC, 83.38, -1.92, 85.55, 2, 0)
	MovementLoopAddLocation(NPC, 85.6, -1.89, 90.62, 2, 0)
end

