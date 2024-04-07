--[[
    Script Name    : SpawnScripts/TheGraveyard_Classic/anEthernereguard4.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.08.15 01:08:50
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
	MovementLoopAddLocation(NPC, 57.67, -2.74, -91.79, 2, 0)
	MovementLoopAddLocation(NPC, 57.67, -2.74, -91.79, 2, 0)
	MovementLoopAddLocation(NPC, 48.41, -3.01, -67.11, 2, 0)
	MovementLoopAddLocation(NPC, 47.28, -3.1, -49.44, 2, 0)
	MovementLoopAddLocation(NPC, 45.98, -3.4, -45.47, 2, 0)
	MovementLoopAddLocation(NPC, 31.59, -4.46, -34.78, 2, 0)
	MovementLoopAddLocation(NPC, 28.95, -4.71, -31.4, 2, 0)
	MovementLoopAddLocation(NPC, 25.88, -5.01, -19.05, 2, 0)
	MovementLoopAddLocation(NPC, 24.87, -5.11, -8.81, 2, 0)
	MovementLoopAddLocation(NPC, 21.26, -5.46, 4.07, 2, 0)
	MovementLoopAddLocation(NPC, 19.84, -5.6, 5.86, 2, 0)
	MovementLoopAddLocation(NPC, 16.59, -5.91, 6.89, 2, 0)
	MovementLoopAddLocation(NPC, 13.24, -6.2, 6.57, 2, 0)
	MovementLoopAddLocation(NPC, 4.24, -6.93, 5.55, 2, 0)
	MovementLoopAddLocation(NPC, -4.64, -7.65, 2.24, 2, 0)
	MovementLoopAddLocation(NPC, -9.55, -8.05, -0.46, 2, 0)
	MovementLoopAddLocation(NPC, -11.68, -8.2, -2.84, 2, 0)
	MovementLoopAddLocation(NPC, -13.76, -8.39, -6.88, 2, 0)
	MovementLoopAddLocation(NPC, -17.9, -8.73, -11.53, 2, 0)
	MovementLoopAddLocation(NPC, -20.01, -8.9, -14.78, 2, 0)
	MovementLoopAddLocation(NPC, -23.23, -9.28, -23.25, 2, 0)
	MovementLoopAddLocation(NPC, -25.11, -9.5, -25.5, 2, 0)
	MovementLoopAddLocation(NPC, -34.33, -10.52, -34.3, 2, 0)
	MovementLoopAddLocation(NPC, -34.33, -10.52, -34.3, 2, 0)
	MovementLoopAddLocation(NPC, -25.19, -9.51, -25.88, 2, 0)
	MovementLoopAddLocation(NPC, -23.78, -9.34, -23.85, 2, 0)
	MovementLoopAddLocation(NPC, -20.1, -8.91, -14.68, 2, 0)
	MovementLoopAddLocation(NPC, -15.06, -8.48, -9.21, 2, 0)
	MovementLoopAddLocation(NPC, -11.17, -8.16, -2.09, 2, 0)
	MovementLoopAddLocation(NPC, -7.68, -7.9, 0.74, 2, 0)
	MovementLoopAddLocation(NPC, -7.68, -7.9, 0.74, 2, 0)
	MovementLoopAddLocation(NPC, 1.27, -7.16, 4.21, 2, 0)
	MovementLoopAddLocation(NPC, 9.43, -6.51, 6.33, 2, 0)
	MovementLoopAddLocation(NPC, 16.71, -5.9, 7.01, 2, 0)
	MovementLoopAddLocation(NPC, 19.88, -5.6, 6.63, 2, 0)
	MovementLoopAddLocation(NPC, 20.92, -5.49, 5.19, 2, 0)
	MovementLoopAddLocation(NPC, 24.62, -5.13, -7.58, 2, 0)
	MovementLoopAddLocation(NPC, 25.43, -5.06, -19.69, 2, 0)
	MovementLoopAddLocation(NPC, 29.44, -4.66, -32.18, 2, 0)
	MovementLoopAddLocation(NPC, 32.71, -4.35, -35.82, 2, 0)
	MovementLoopAddLocation(NPC, 45.09, -3.49, -44.3, 2, 0)
	MovementLoopAddLocation(NPC, 47.15, -3.2, -48.6, 2, 0)
	MovementLoopAddLocation(NPC, 48.78, -2.96, -68.4, 2, 0)
	MovementLoopAddLocation(NPC, 51.46, -2.89, -75.44, 2, 0)
end

