--[[
    Script Name    : SpawnScripts/TheGraveyard_Classic/anEthernereguard1.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.08.14 11:08:16
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
	MovementLoopAddLocation(NPC, -35.82, -10.69, -37.06, 2, 0)
	MovementLoopAddLocation(NPC, -42.85, -11.1, -33.52, 2, 0)
	MovementLoopAddLocation(NPC, -47.68, -11.34, -28.13, 2, 0)
	MovementLoopAddLocation(NPC, -54.67, -11.68, -16.01, 2, 0)
	MovementLoopAddLocation(NPC, -54.97, -11.69, -14.13, 2, 0)
	MovementLoopAddLocation(NPC, -54.96, -11.71, 6.22, 2, 0)
	MovementLoopAddLocation(NPC, -54.51, -11.69, 22.2, 2, 0)
	MovementLoopAddLocation(NPC, -52.52, -11.62, 40.91, 2, 0)
	MovementLoopAddLocation(NPC, -52.52, -11.62, 40.91, 2, 0)
	MovementLoopAddLocation(NPC, -51.9, -11.58, 49.46, 2, 0)
	MovementLoopAddLocation(NPC, -49.3, -11.4, 57.35, 2, 0)
	MovementLoopAddLocation(NPC, -40, -10.76, 65.37, 2, 0)
	MovementLoopAddLocation(NPC, -40, -10.76, 65.37, 2, 0)
	MovementLoopAddLocation(NPC, -45.11, -11.1, 61.69, 2, 0)
	MovementLoopAddLocation(NPC, -49.16, -11.39, 57.21, 2, 0)
	MovementLoopAddLocation(NPC, -49.97, -11.45, 55.56, 2, 0)
	MovementLoopAddLocation(NPC, -51.65, -11.56, 49.58, 2, 0)
	MovementLoopAddLocation(NPC, -52.85, -11.63, 39.81, 2, 0)
	MovementLoopAddLocation(NPC, -54.14, -11.69, 30.08, 2, 0)
	MovementLoopAddLocation(NPC, -55.16, -11.72, 8.62, 2, 0)
	MovementLoopAddLocation(NPC, -55.49, -11.73, -11.2, 2, 0)
	MovementLoopAddLocation(NPC, -53.81, -11.65, -16.93, 2, 0)
	MovementLoopAddLocation(NPC, -48.86, -11.4, -26.19, 2, 0)
	MovementLoopAddLocation(NPC, -44.48, -11.18, -32.16, 2, 0)
end

