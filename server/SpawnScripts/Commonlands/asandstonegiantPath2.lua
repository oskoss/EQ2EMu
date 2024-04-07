--[[
    Script Name    : SpawnScripts/Commonlands/asandstonegiantPath2.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.02.18 03:02:14
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
	MovementLoopAddLocation(NPC, 1462.17, -31.31, 119.09, 2, 0)
	MovementLoopAddLocation(NPC, 1456.5, -31.85, 100.86, 2, 0)
	MovementLoopAddLocation(NPC, 1450.11, -36.37, 48.15, 2, 0)
	MovementLoopAddLocation(NPC, 1447.17, -38.1, 36.8, 2, 0)
	MovementLoopAddLocation(NPC, 1442.79, -39.28, 30.42, 2, 0)
	MovementLoopAddLocation(NPC, 1437.14, -40.56, 24.8, 2, 0)
	MovementLoopAddLocation(NPC, 1429.39, -42.6, 16.54, 2, 0)
	MovementLoopAddLocation(NPC, 1403.77, -49.46, -14.55, 2, 0)
	MovementLoopAddLocation(NPC, 1401.02, -50.35, -21.42, 2, 0)
	MovementLoopAddLocation(NPC, 1398.19, -49.85, -37.05, 2, 0)
	MovementLoopAddLocation(NPC, 1398.42, -49.14, -46.3, 2, 0)
	MovementLoopAddLocation(NPC, 1403.82, -48.4, -58.58, 2, 0)
	MovementLoopAddLocation(NPC, 1412.29, -46.65, -73.53, 2, 0)
	MovementLoopAddLocation(NPC, 1407.89, -47.9, -66.93, 2, 0)
	MovementLoopAddLocation(NPC, 1400.36, -48.81, -52.02, 2, 0)
	MovementLoopAddLocation(NPC, 1398.31, -50.06, -33.4, 2, 0)
	MovementLoopAddLocation(NPC, 1400.27, -50.44, -22.55, 2, 0)
	MovementLoopAddLocation(NPC, 1404.49, -49.58, -15.2, 2, 0)
	MovementLoopAddLocation(NPC, 1428.79, -42.58, 16.89, 2, 0)
	MovementLoopAddLocation(NPC, 1439.33, -40.12, 26.48, 2, 0)
	MovementLoopAddLocation(NPC, 1446.13, -38.72, 32.88, 2, 0)
	MovementLoopAddLocation(NPC, 1449.56, -36.6, 46.5, 2, 0)
	MovementLoopAddLocation(NPC, 1456.02, -31.92, 99.24, 2, 0)
	MovementLoopAddLocation(NPC, 1462.17, -31.31, 119.09, 2, 0)
end
