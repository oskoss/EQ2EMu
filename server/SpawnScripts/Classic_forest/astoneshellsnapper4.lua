--[[
    Script Name    : SpawnScripts/Classic_forest/astoneshellsnapper4.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.10.12 04:10:28
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
	MovementLoopAddLocation(NPC, 986.43, -23.64, -589.79, 1, 0)
	MovementLoopAddLocation(NPC, 986.47, -24.75, -597.75, 1, 0)
	MovementLoopAddLocation(NPC, 986.47, -24.75, -597.75, 1, 0)
	MovementLoopAddLocation(NPC, 984.55, -24.2, -589.41, 1, 0)
	MovementLoopAddLocation(NPC, 978.9, -25.02, -585.73, 1, 0)
	MovementLoopAddLocation(NPC, 971.06, -25.45, -583.25, 1, 0)
	MovementLoopAddLocation(NPC, 971.06, -25.45, -583.25, 1, 0)
	MovementLoopAddLocation(NPC, 973.85, -26.72, -586.33, 1, 0)
	MovementLoopAddLocation(NPC, 973.85, -26.72, -586.33, 1, 0)
	MovementLoopAddLocation(NPC, 980.02, -27.32, -590.26, 1, 0)
	MovementLoopAddLocation(NPC, 980.02, -27.32, -590.26, 1, 0)
	MovementLoopAddLocation(NPC, 983.3, -25.49, -591.43, 1, 0)
	MovementLoopAddLocation(NPC, 983.3, -25.49, -591.43, 1, 0)
	MovementLoopAddLocation(NPC, 983.47, -23.82, -586.33, 1, 0)
	MovementLoopAddLocation(NPC, 983.47, -23.82, -586.33, 1, 0)
end

