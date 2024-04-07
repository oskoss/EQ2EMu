--[[
    Script Name    : SpawnScripts/Commonlands/aDervishthugPath3.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.03.07 09:03:22
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
	MovementLoopAddLocation(NPC, 1358.88, -35.03, 160.58, 2, 0)
	MovementLoopAddLocation(NPC, 1360.45, -35.25, 135.55, 2, 0)
	MovementLoopAddLocation(NPC, 1353.37, -36.62, 112.53, 2, 0)
	MovementLoopAddLocation(NPC, 1341.46, -36.31, 65.76, 2, 0)
	MovementLoopAddLocation(NPC, 1330.56, -34.78, 41.97, 2, 0)
	MovementLoopAddLocation(NPC, 1315.82, -31.18, 10.23, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 1315.82, -31.18, 10.23, 2, 0)
	MovementLoopAddLocation(NPC, 1321.88, -32.89, 26.63, 2, 0)
	MovementLoopAddLocation(NPC, 1339.77, -37.33, 75.03, 2, 0)
	MovementLoopAddLocation(NPC, 1335.56, -38.74, 117.57, 2, 0)
	MovementLoopAddLocation(NPC, 1343.48, -37.9, 149.02, 2, 0)
	MovementLoopAddLocation(NPC, 1365.04, -34.36, 161.36, 2, 0)
	MovementLoopAddLocation(NPC, 1387.19, -34.28, 168.85, 2, 0)
	MovementLoopAddLocation(NPC, 1411.39, -34.48, 174.26, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 1411.39, -34.48, 174.26, 2, 0)
	MovementLoopAddLocation(NPC, 1397.17, -34.54, 168.6, 2, 0)
	MovementLoopAddLocation(NPC, 1384.65, -34.1, 166.81, 2, 0)
	MovementLoopAddLocation(NPC, 1370.97, -34.29, 167.51, 2, 0)
	MovementLoopAddLocation(NPC, 1358.83, -35.04, 165.67, 2, 0)
	MovementLoopAddLocation(NPC, 1322.55, -40.53, 160.8, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, 1322.55, -40.53, 160.8, 2, 0)
	MovementLoopAddLocation(NPC, 1342.82, -38.44, 167.08, 2, 0)
	MovementLoopAddLocation(NPC, 1349.38, -37.27, 166.22, 2, 0)
	MovementLoopAddLocation(NPC, 1358.88, -35.03, 160.59, 2, 0)
end

