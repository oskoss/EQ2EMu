--[[
    Script Name    : SpawnScripts/Commonlands/asandstonegiantPath3.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.02.18 03:02:57
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
	MovementLoopAddLocation(NPC, 1444.53, -45.69, -294.66, 2, 0)
	MovementLoopAddLocation(NPC, 1447.06, -44.32, -251.28, 2, 0)
	MovementLoopAddLocation(NPC, 1440.4, -43.85, -246.98, 2, 0)
	MovementLoopAddLocation(NPC, 1429.25, -41.44, -241.38, 2, 0)
	MovementLoopAddLocation(NPC, 1412.97, -37.95, -230.22, 2, 0)
	MovementLoopAddLocation(NPC, 1407.73, -36.67, -220.97, 2, 0)
	MovementLoopAddLocation(NPC, 1402.79, -35.82, -205.01, 2, 0)
	MovementLoopAddLocation(NPC, 1399.58, -35.79, -180.39, 2, 0)
	MovementLoopAddLocation(NPC, 1404.6, -35.94, -170.29, 2, 0)
	MovementLoopAddLocation(NPC, 1414.26, -36.7, -164.24, 2, 0)
	MovementLoopAddLocation(NPC, 1423.63, -37.54, -156.78, 2, 0)
	MovementLoopAddLocation(NPC, 1434.95, -38.15, -150.49, 2, 0)
	MovementLoopAddLocation(NPC, 1445.03, -38.4, -146.8, 2, 0)
	MovementLoopAddLocation(NPC, 1451.73, -38.41, -138.1, 2, 0)
	MovementLoopAddLocation(NPC, 1452.72, -38.16, -130.8, 2, 0)
	MovementLoopAddLocation(NPC, 1452.81, -38.38, -119.11, 2, 0)
	MovementLoopAddLocation(NPC, 1448.73, -40.25, -104.65, 2, 0)
	MovementLoopAddLocation(NPC, 1444.76, -42.69, -92.43, 2, 0)
	MovementLoopAddLocation(NPC, 1439.56, -44.51, -84.3, 2, 0)
	MovementLoopAddLocation(NPC, 1434.04, -45.43, -78.4, 2, 0)
	MovementLoopAddLocation(NPC, 1421.29, -45.67, -75.6, 2, 0)
	MovementLoopAddLocation(NPC, 1409.84, -46.66, -80.18, 2, 0)
	MovementLoopAddLocation(NPC, 1403.25, -46.09, -87.17, 2, 0)
	MovementLoopAddLocation(NPC, 1398.53, -44.73, -94.77, 2, 0)
	MovementLoopAddLocation(NPC, 1393.32, -42.87, -104.36, 2, 0)
	MovementLoopAddLocation(NPC, 1391.53, -41.26, -113.48, 2, 0)
	MovementLoopAddLocation(NPC, 1392.49, -37.5, -156.45, 2, 0)
	MovementLoopAddLocation(NPC, 1400.03, -35.75, -194.59, 2, 0)
	MovementLoopAddLocation(NPC, 1404.51, -36, -213.66, 2, 0)
	MovementLoopAddLocation(NPC, 1410.28, -37.35, -226.39, 2, 0)
	MovementLoopAddLocation(NPC, 1414.64, -38.33, -232.32, 2, 0)
	MovementLoopAddLocation(NPC, 1430.67, -41.71, -242, 2, 0)
	MovementLoopAddLocation(NPC, 1445.06, -44.32, -252.13, 2, 0)
	MovementLoopAddLocation(NPC, 1448.11, -45.47, -262.59, 2, 0)
	MovementLoopAddLocation(NPC, 1444.53, -45.69, -294.66, 2, 0)
end

