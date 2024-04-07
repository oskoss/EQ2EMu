--[[
    Script Name    : SpawnScripts/Commonlands/aDervishthugPath2.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.03.07 09:03:59
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    ogre(NPC)
    DervishThug(NPC)
    IdleAggressive(NPC)
    AddTimer(NPC, 6000, "waypoints")
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, 1280.67, -43.02, 153.66, 2, 0)
	MovementLoopAddLocation(NPC, 1277.96, -42.85, 142.76, 2, 0)
	MovementLoopAddLocation(NPC, 1270.96, -40.17, 103.19, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 1270.96, -40.17, 103.19, 2, 0)
	MovementLoopAddLocation(NPC, 1271.03, -41.73, 118.61, 2, 0)
	MovementLoopAddLocation(NPC, 1277.39, -43, 145.81, 2, 0)
	MovementLoopAddLocation(NPC, 1274.85, -43.4, 151.77, 2, 0)
	MovementLoopAddLocation(NPC, 1260.27, -44.7, 165.8, 2, 0)
	MovementLoopAddLocation(NPC, 1254.9, -44.65, 176.88, 2, 0)
	MovementLoopAddLocation(NPC, 1250.52, -44.13, 193.31, 2, 0)
	MovementLoopAddLocation(NPC, 1233.28, -41.93, 235.59, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 1233.28, -41.93, 235.59, 2, 0)
	MovementLoopAddLocation(NPC, 1239.49, -42.58, 221.05, 2, 0)
	MovementLoopAddLocation(NPC, 1249.2, -44.02, 196.1, 2, 0)
	MovementLoopAddLocation(NPC, 1256.07, -44.71, 172.87, 2, 0)
	MovementLoopAddLocation(NPC, 1273, -43.75, 157.98, 2, 0)
	MovementLoopAddLocation(NPC, 1283.9, -42.9, 158.73, 2, 0)
	MovementLoopAddLocation(NPC, 1295.23, -41.95, 164.41, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 1295.23, -41.95, 164.41, 2, 0)
	MovementLoopAddLocation(NPC, 1286.03, -42.75, 160.61, 2, 0)
	MovementLoopAddLocation(NPC, 1280.67, -43.02, 153.66, 2, 0)
end