--[[
    Script Name    : SpawnScripts/Commonlands/aBloodskullmysticDunar2.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.21 02:01:38
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    Bloodskull(NPC)
    OrcArmorCommon(NPC)
    AddTimer(NPC, 9000, "waypoints")
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, 111.31, -45.4, 450.07, 2, 0)
	MovementLoopAddLocation(NPC, 81.76, -47.81, 495.65, 2, 0)
	MovementLoopAddLocation(NPC, 72.24, -47.86, 521.09, 2, 0)
	MovementLoopAddLocation(NPC, 78.77, -48.04, 544.38, 2, 0)
	MovementLoopAddLocation(NPC, 94.71, -48.04, 558.21, 2, 0)
	MovementLoopAddLocation(NPC, 111.58, -47.98, 560.72, 2, 0)
	MovementLoopAddLocation(NPC, 137.03, -47.7, 558.12, 2, 0)
	MovementLoopAddLocation(NPC, 153.87, -47.45, 552.18, 2, 0)
	MovementLoopAddLocation(NPC, 164.19, -46.76, 547.51, 2, 0)
	MovementLoopAddLocation(NPC, 179.35, -46.41, 532.42, 2, 0)
	MovementLoopAddLocation(NPC, 191.44, -47.68, 510.36, 2, 0)
	MovementLoopAddLocation(NPC, 194.62, -48.03, 483.67, 2, 0)
	MovementLoopAddLocation(NPC, 194.15, -48.04, 455.38, 2, 0)
	MovementLoopAddLocation(NPC, 181.07, -47.63, 440.23, 2, 0)
	MovementLoopAddLocation(NPC, 171.37, -46.5, 435.33, 2, 0)
	MovementLoopAddLocation(NPC, 146.95, -43.45, 433.92, 2, 0)
	MovementLoopAddLocation(NPC, 129.66, -42.68, 434, 2, 0)
	MovementLoopAddLocation(NPC, 119.72, -43.55, 438.55, 2, 0)
end