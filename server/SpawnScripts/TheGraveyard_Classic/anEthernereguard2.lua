--[[
    Script Name    : SpawnScripts/TheGraveyard_Classic/anEthernereguard2.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.08.14 11:08:11
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
	MovementLoopAddLocation(NPC, -36.74, -10.49, 67.44, 2, 0)
	MovementLoopAddLocation(NPC, -36.74, -10.49, 67.44, 2, 0)
	MovementLoopAddLocation(NPC, -31.87, -10.02, 69.86, 2, 0)
	MovementLoopAddLocation(NPC, -28.24, -9.69, 72.8, 2, 0)
	MovementLoopAddLocation(NPC, -26.34, -9.5, 75.66, 2, 0)
	MovementLoopAddLocation(NPC, -22.27, -8.8, 83.57, 2, 0)
	MovementLoopAddLocation(NPC, -18.42, -8.42, 87.52, 2, 0)
	MovementLoopAddLocation(NPC, -14.25, -8.22, 89.74, 2, 0)
	MovementLoopAddLocation(NPC, -5.76, -7.75, 93.09, 2, 0)
	MovementLoopAddLocation(NPC, -2.14, -7.46, 93.26, 2, 0)
	MovementLoopAddLocation(NPC, 3.22, -7.01, 91.14, 2, 0)
	MovementLoopAddLocation(NPC, 5.42, -6.89, 87.81, 2, 0)
	MovementLoopAddLocation(NPC, 5.9, -6.83, 82.26, 2, 0)
	MovementLoopAddLocation(NPC, 11.35, -6.36, 67.05, 2, 0)
	MovementLoopAddLocation(NPC, 11.91, -6.31, 63.15, 2, 0)
	MovementLoopAddLocation(NPC, 10.8, -6.4, 60.54, 2, 0)
	MovementLoopAddLocation(NPC, 4.35, -6.92, 54.2, 2, 0)
	MovementLoopAddLocation(NPC, 2.31, -7.09, 51.03, 2, 0)
	MovementLoopAddLocation(NPC, 0.69, -7.2, 43.22, 2, 0)
	MovementLoopAddLocation(NPC, 1.22, -7.18, 36.23, 2, 0)
	MovementLoopAddLocation(NPC, 2.55, -7.07, 32.95, 2, 0)
	MovementLoopAddLocation(NPC, 5.41, -6.84, 27.74, 2, 0)
	MovementLoopAddLocation(NPC, 13.43, -6.19, 18.24, 2, 0)
	MovementLoopAddLocation(NPC, 18.22, -5.76, 11.75, 2, 0)
	MovementLoopAddLocation(NPC, 18.94, -5.69, 9.96, 2, 0)
	MovementLoopAddLocation(NPC, 18.94, -5.69, 9.96, 2, 0)
	MovementLoopAddLocation(NPC, 17, -5.88, 13.17, 2, 0)
	MovementLoopAddLocation(NPC, 11.72, -6.33, 20.57, 2, 0)
	MovementLoopAddLocation(NPC, 5.91, -6.79, 27.1, 2, 0)
	MovementLoopAddLocation(NPC, 1.75, -7.13, 34.93, 2, 0)
	MovementLoopAddLocation(NPC, 1.03, -7.18, 43.56, 2, 0)
	MovementLoopAddLocation(NPC, 2.43, -7.08, 50.65, 2, 0)
	MovementLoopAddLocation(NPC, 5.11, -6.86, 54.33, 2, 0)
	MovementLoopAddLocation(NPC, 11.08, -6.38, 60.21, 2, 0)
	MovementLoopAddLocation(NPC, 12.85, -6.23, 61.31, 2, 0)
	MovementLoopAddLocation(NPC, 17.75, -5.8, 61.56, 2, 0)
	MovementLoopAddLocation(NPC, 22.64, -5.33, 62.22, 2, 0)
	MovementLoopAddLocation(NPC, 24.84, -5.11, 63.25, 2, 0)
	MovementLoopAddLocation(NPC, 28.38, -4.77, 66.2, 2, 0)
	MovementLoopAddLocation(NPC, 30.37, -4.57, 68.2, 2, 0)
	MovementLoopAddLocation(NPC, 31.95, -4.42, 70.63, 2, 0)
	MovementLoopAddLocation(NPC, 32.76, -4.34, 73.38, 2, 0)
	MovementLoopAddLocation(NPC, 31.91, -4.43, 78.54, 2, 0)
	MovementLoopAddLocation(NPC, 29.56, -4.77, 82.34, 2, 0)
	MovementLoopAddLocation(NPC, 26.37, -5.27, 84.81, 2, 0)
	MovementLoopAddLocation(NPC, 16.53, -6.74, 89.88, 2, 0)
	MovementLoopAddLocation(NPC, 14.34, -6.82, 90.48, 2, 0)
	MovementLoopAddLocation(NPC, 8.58, -6.86, 89.89, 2, 0)
	MovementLoopAddLocation(NPC, 5.52, -6.91, 90.47, 2, 0)
	MovementLoopAddLocation(NPC, 0.82, -7.21, 92.81, 2, 0)
	MovementLoopAddLocation(NPC, -1.38, -7.4, 93.38, 2, 0)
	MovementLoopAddLocation(NPC, -6.56, -7.81, 92.71, 2, 0)
	MovementLoopAddLocation(NPC, -16.35, -8.31, 88.84, 2, 0)
	MovementLoopAddLocation(NPC, -19.98, -8.55, 86.09, 2, 0)
	MovementLoopAddLocation(NPC, -23.11, -8.96, 81.68, 2, 0)
	MovementLoopAddLocation(NPC, -25.31, -9.4, 77.28, 2, 0)
	MovementLoopAddLocation(NPC, -28.94, -9.75, 72.92, 2, 0)
end

