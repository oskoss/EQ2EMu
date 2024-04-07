--[[
    Script Name    : SpawnScripts/Classic_forest/arockadderRoam2.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.10.12 04:10:09
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
	MovementLoopAddLocation(NPC, 1029.24, -20.6, -605.15, 1, 0)
	MovementLoopAddLocation(NPC, 1024.65, -20.57, -606.07, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 1024.65, -20.57, -606.07, 1, 0)
	MovementLoopAddLocation(NPC, 1027.29, -21.17, -603.02, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 1027.29, -21.17, -603.02, 1, 0)
	MovementLoopAddLocation(NPC, 1027.01, -20.3, -606.72, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 1027.01, -20.3, -606.72, 1, 0)
	MovementLoopAddLocation(NPC, 1031.39, -20.19, -606.71, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 1031.39, -20.19, -606.71, 1, 0)
	MovementLoopAddLocation(NPC, 1029.24, -20.6, -605.15, 1, math.random(5,10))
end

