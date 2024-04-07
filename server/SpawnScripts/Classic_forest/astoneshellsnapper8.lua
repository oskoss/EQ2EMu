--[[
    Script Name    : SpawnScripts/Classic_forest/astoneshellsnapper8.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.10.12 06:10:01
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
	MovementLoopAddLocation(NPC, 1109.2, -22.29, -675.84, 1, 0)
	MovementLoopAddLocation(NPC, 1109.77, -22.6, -684.51, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 1109.77, -22.6, -684.51, 1, 0)
	MovementLoopAddLocation(NPC, 1107.11, -20.11, -685.53, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 1107.11, -20.11, -685.53, 1, 0)
	MovementLoopAddLocation(NPC, 1107.47, -20.77, -677.18, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 1107.47, -20.77, -677.18, 1, 0)
	MovementLoopAddLocation(NPC, 1109.71, -23.79, -671.39, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 1109.71, -23.79, -671.39, 1, 0)
	MovementLoopAddLocation(NPC, 1109.31, -23.36, -667.97, 1, 0)
	MovementLoopAddLocation(NPC, 1112.52, -22.8, -663.1, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 1112.52, -22.8, -663.1, 1, 0)
	MovementLoopAddLocation(NPC, 1109.17, -22.07, -663.87, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 1109.17, -22.07, -663.87, 1, 0)
	MovementLoopAddLocation(NPC, 1106.67, -21.91, -667.83, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 1109.2, -22.29, -675.84, 1, 0)
end

