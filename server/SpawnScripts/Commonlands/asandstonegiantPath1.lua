--[[
    Script Name    : SpawnScripts/Commonlands/asandstonegiantPath1.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.02.18 02:02:51
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
	MovementLoopAddLocation(NPC, 1196.56, -36.76, -254.75, 2, 0)
	MovementLoopAddLocation(NPC, 1203.43, -38.75, -268.04, 2, 0)
	MovementLoopAddLocation(NPC, 1211.1, -40.27, -274.3, 2, 0)
	MovementLoopAddLocation(NPC, 1226.86, -43.18, -285.75, 2, 0)
	MovementLoopAddLocation(NPC, 1232.98, -44.58, -292.12, 2, 0)
	MovementLoopAddLocation(NPC, 1243.06, -47.92, -303.33, 2, 0)
	MovementLoopAddLocation(NPC, 1254.59, -51.3, -314.8, 2, 0)
	MovementLoopAddLocation(NPC, 1266.9, -54.61, -323.06, 2, 0)
	MovementLoopAddLocation(NPC, 1282.23, -58.65, -329.59, 2, 0)
	MovementLoopAddLocation(NPC, 1286.86, -59.04, -331.71, 2, 0)
	MovementLoopAddLocation(NPC, 1291.02, -59.02, -338.74, 2, 0)
	MovementLoopAddLocation(NPC, 1290.82, -58.79, -346.75, 2, 0)
	MovementLoopAddLocation(NPC, 1283.04, -58.14, -355.61, 2, 0)
	MovementLoopAddLocation(NPC, 1269.71, -57.01, -360.04, 2, 0)
	MovementLoopAddLocation(NPC, 1252.81, -55.85, -363.15, 2, 0)
	MovementLoopAddLocation(NPC, 1237.19, -54.24, -366.16, 2, 0)
	MovementLoopAddLocation(NPC, 1217.65, -49.15, -369.1, 2, 0)
	MovementLoopAddLocation(NPC, 1202.23, -45.13, -369.3, 2, 0)
	MovementLoopAddLocation(NPC, 1192.18, -42.34, -368.56, 2, 0)
	MovementLoopAddLocation(NPC, 1185.04, -40.82, -364.27, 2, 0)
	MovementLoopAddLocation(NPC, 1180.61, -39.65, -357.25, 2, 0)
	MovementLoopAddLocation(NPC, 1173.92, -36.56, -346.84, 2, 0)
	MovementLoopAddLocation(NPC, 1169.77, -33.97, -335.46, 2, 0)
	MovementLoopAddLocation(NPC, 1167.97, -30.4, -311.22, 2, 0)
	MovementLoopAddLocation(NPC, 1171.53, -30.8, -297.24, 2, 0)
	MovementLoopAddLocation(NPC, 1176.93, -33.08, -283.35, 2, 0)
	MovementLoopAddLocation(NPC, 1196.56, -36.76, -254.75, 2, 0)
end