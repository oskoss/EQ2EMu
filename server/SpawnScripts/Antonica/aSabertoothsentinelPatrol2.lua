--[[
    Script Name    : SpawnScripts/Antonica/aSabertoothsentinelPatrol2.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.04.03 11:04:08
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    AddTimer(NPC, 6000, "waypoints")
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, -1012.66, -12.85, 1040.7, 2, 0)
	MovementLoopAddLocation(NPC, -1012.66, -12.85, 1040.7, 2, 0)
	MovementLoopAddLocation(NPC, -985.63, -14.68, 1039.87, 2, 0)
	MovementLoopAddLocation(NPC, -963.32, -16.12, 1041.07, 2, 0)
	MovementLoopAddLocation(NPC, -950.17, -15.73, 1040.11, 2, 0)
	MovementLoopAddLocation(NPC, -941.55, -15.06, 1039.62, 2, 0)
	MovementLoopAddLocation(NPC, -932.39, -14.92, 1043.3, 2, 0)
	MovementLoopAddLocation(NPC, -900.19, -19.73, 1051.7, 2, 0)
	MovementLoopAddLocation(NPC, -883.28, -20.95, 1063.63, 2, 0)
	MovementLoopAddLocation(NPC, -860.68, -20.87, 1055.82, 2, 0)
	MovementLoopAddLocation(NPC, -851.81, -22.3, 1052.95, 2, 0)
	MovementLoopAddLocation(NPC, -842.79, -24.43, 1049.27, 2, 0)
	MovementLoopAddLocation(NPC, -831.19, -27.37, 1043.87, 2, 0)
	MovementLoopAddLocation(NPC, -822.58, -28.14, 1040.19, 2, 8)
	MovementLoopAddLocation(NPC, -822.58, -28.14, 1040.19, 2, 0)
	MovementLoopAddLocation(NPC, -827.49, -27.81, 1042.35, 2, 0)
	MovementLoopAddLocation(NPC, -838.6, -25.62, 1046.96, 2, 0)
	MovementLoopAddLocation(NPC, -846.51, -23.53, 1050.72, 2, 0)
	MovementLoopAddLocation(NPC, -855.57, -21.45, 1053.98, 2, 0)
	MovementLoopAddLocation(NPC, -859.32, -20.83, 1055.43, 2, 0)
	MovementLoopAddLocation(NPC, -861.3, -20.77, 1059.3, 2, 0)
	MovementLoopAddLocation(NPC, -862.63, -21.48, 1075.94, 2, 0)
	MovementLoopAddLocation(NPC, -863.11, -22.86, 1082.91, 2, 0)
	MovementLoopAddLocation(NPC, -869.18, -23.47, 1086.49, 2, 0)
	MovementLoopAddLocation(NPC, -887.65, -24.1, 1089.52, 2, 0)
	MovementLoopAddLocation(NPC, -897.69, -26.65, 1094.02, 2, 0)
	MovementLoopAddLocation(NPC, -921.53, -33.3, 1098.82, 2, 0)
	MovementLoopAddLocation(NPC, -939.57, -36.63, 1101.55, 2, 0)
	MovementLoopAddLocation(NPC, -947.31, -38.03, 1100.06, 2, 8)
	MovementLoopAddLocation(NPC, -947.31, -38.03, 1100.06, 2, 0)
	MovementLoopAddLocation(NPC, -941.43, -37.03, 1101.1, 2, 0)
	MovementLoopAddLocation(NPC, -930.25, -34.51, 1100.48, 2, 0)
	MovementLoopAddLocation(NPC, -923.48, -33.87, 1099.25, 2, 0)
	MovementLoopAddLocation(NPC, -894.87, -25.84, 1093.11, 2, 0)
	MovementLoopAddLocation(NPC, -887.09, -22.84, 1080.23, 2, 0)
	MovementLoopAddLocation(NPC, -886.82, -21.42, 1069.72, 2, 0)
	MovementLoopAddLocation(NPC, -905.67, -19.1, 1050.3, 2, 0)
	MovementLoopAddLocation(NPC, -926.53, -15.17, 1042.3, 2, 0)
	MovementLoopAddLocation(NPC, -942.44, -15.19, 1040.6, 2, 0)
	MovementLoopAddLocation(NPC, -958.11, -16.25, 1040.49, 2, 0)
	MovementLoopAddLocation(NPC, -986.05, -14.61, 1039.15, 2, 0)
	MovementLoopAddLocation(NPC, -1012.66, -12.85, 1040.7, 2, 8)
end