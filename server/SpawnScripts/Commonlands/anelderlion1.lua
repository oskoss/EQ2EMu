--[[
    Script Name    : SpawnScripts/Commonlands/anelderlion1.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.02.11 03:02:58
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    AddTimer(NPC, 9000, "waypoints")
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, 757.48, -59.71, -34.43, 2, 0)
	MovementLoopAddLocation(NPC, 710.13, -59.96, 21.93, 2, 0)
	MovementLoopAddLocation(NPC, 686.98, -59.8, 22.15, 2, 0)
	MovementLoopAddLocation(NPC, 639.48, -59.8, -3.96, 2, 0)
	MovementLoopAddLocation(NPC, 633.63, -59.8, -17.26, 2, 0)
	MovementLoopAddLocation(NPC, 638.71, -59.8, -27.25, 2, 0)
	MovementLoopAddLocation(NPC, 681.22, -59.8, -27.35, 2, 0)
	MovementLoopAddLocation(NPC, 703.23, -59.8, -33.28, 2, 0)
	MovementLoopAddLocation(NPC, 745.87, -59.8, -59.43, 2, 0)
	MovementLoopAddLocation(NPC, 761.52, -58.83, -58.62, 2, 0)
	MovementLoopAddLocation(NPC, 766.92, -58.69, -48.79, 2, 0)
end