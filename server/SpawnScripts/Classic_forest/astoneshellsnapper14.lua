--[[
    Script Name    : SpawnScripts/Classic_forest/astoneshellsnapper14.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.10.12 07:10:59
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
	MovementLoopAddLocation(NPC, 1143.22, -22.25, -715.03, 1, 0)
	MovementLoopAddLocation(NPC, 1148.32, -21.65, -713.9, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 1148.32, -21.65, -713.9, 1, 0)
	MovementLoopAddLocation(NPC, 1142.7, -22.84, -714.25, 1, 0)
	MovementLoopAddLocation(NPC, 1140.42, -22.95, -721.4, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 1140.42, -22.95, -721.4, 1, 0)
	MovementLoopAddLocation(NPC, 1136.08, -22.83, -721.82, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 1136.08, -22.83, -721.82, 1, 0)
	MovementLoopAddLocation(NPC, 1140.27, -22.37, -724.02, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 1140.27, -22.37, -724.02, 1, 0)
	MovementLoopAddLocation(NPC, 1130.32, -22.86, -717.15, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 1130.32, -22.86, -717.15, 1, 0)
	MovementLoopAddLocation(NPC, 1134.81, -22.9, -720.71, 1, 0)
	MovementLoopAddLocation(NPC, 1140.3, -22.81, -721.85, 1, 0)
	MovementLoopAddLocation(NPC, 1141.71, -22.85, -715.78, 1, 0)
	MovementLoopAddLocation(NPC, 1143.22, -22.25, -715.03, 1, math.random(5,10))
end

