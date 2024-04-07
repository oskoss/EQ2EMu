--[[
    Script Name    : SpawnScripts/Classic_forest/arockadderRoam1.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.10.12 04:10:13
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
	MovementLoopAddLocation(NPC, 1034.02, -21.58, -596.64, 1, 0)
	MovementLoopAddLocation(NPC, 1038.07, -21.11, -597.86, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 1038.07, -21.11, -597.86, 1, 0)
	MovementLoopAddLocation(NPC, 1030.29, -21.66, -592.36, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 1030.29, -21.66, -592.36, 1, 0)
	MovementLoopAddLocation(NPC, 1030.68, -21.71, -597.55, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 1030.68, -21.71, -597.55, 1, 0)
	MovementLoopAddLocation(NPC, 1037.06, -21.33, -596.61, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 1037.06, -21.33, -596.61, 1, 0)
	MovementLoopAddLocation(NPC, 1034.02, -21.58, -596.64, 1, math.random(5,10))
end

