--[[
    Script Name    : SpawnScripts/Commonlands/aDervishthugPath1.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.03.07 09:03:00
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
	MovementLoopAddLocation(NPC, 1315.52, -39.9, 309.75, 2, 0)
	MovementLoopAddLocation(NPC, 1304.61, -38.81, 331.46, 2, 0)
	MovementLoopAddLocation(NPC, 1285.44, -37.55, 352.9, 2, 0)
	MovementLoopAddLocation(NPC, 1272.77, -34.04, 370.05, 2, 0)
	MovementLoopAddLocation(NPC, 1257.84, -28.24, 390.04, 2, 0)
	MovementLoopAddLocation(NPC, 1243.77, -25.57, 399.86, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 1243.77, -25.57, 399.86, 2, 0)
	MovementLoopAddLocation(NPC, 1255.04, -27.14, 393.77, 2, 0)
	MovementLoopAddLocation(NPC, 1266.76, -31.26, 379.54, 2, 0)
	MovementLoopAddLocation(NPC, 1275.19, -37.44, 355.24, 2, 0)
	MovementLoopAddLocation(NPC, 1284.7, -40.38, 320.99, 2, 0)
	MovementLoopAddLocation(NPC, 1316.89, -41, 263.45, 2, 0)
	MovementLoopAddLocation(NPC, 1320.01, -41.52, 223.6, 2, 0)
	MovementLoopAddLocation(NPC, 1316.87, -41.29, 180.22, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 1316.87, -41.29, 180.22, 2, 0)
	MovementLoopAddLocation(NPC, 1320.8, -41.52, 236.11, 2, 0)
	MovementLoopAddLocation(NPC, 1331.83, -40.36, 269.42, 2, 0)
	MovementLoopAddLocation(NPC, 1315.52, -39.9, 309.75, 2, 0)
end