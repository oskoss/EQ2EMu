--[[
    Script Name    : SpawnScripts/Classic_forest/astoneshellsnapper9.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.10.12 06:10:06
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
	MovementLoopAddLocation(NPC, 1117.85, -22.91, -660.81, 1, 0)
	MovementLoopAddLocation(NPC, 1115.06, -22.84, -661.54, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 1115.06, -22.84, -661.54, 1, 0)
	MovementLoopAddLocation(NPC, 1120.84, -22.57, -659.72, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 1120.84, -22.57, -659.72, 1, 0)
	MovementLoopAddLocation(NPC, 1123.91, -21.27, -657.26, 1, 0)
	MovementLoopAddLocation(NPC, 1127.22, -21.07, -656.96, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 1127.22, -21.07, -656.96, 1, 0)
	MovementLoopAddLocation(NPC, 1128.81, -23.2, -661.06, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 1128.81, -23.2, -661.06, 1, 0)
	MovementLoopAddLocation(NPC, 1123.13, -23.02, -659.92, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 1123.13, -23.02, -659.92, 1, 0)
	MovementLoopAddLocation(NPC, 1117.35, -21.18, -657.81, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 1117.35, -21.18, -657.81, 1, 0)
	MovementLoopAddLocation(NPC, 1113.76, -23.06, -662.75, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 1113.76, -23.06, -662.75, 1, 0)
	MovementLoopAddLocation(NPC, 1117.85, -22.91, -660.81, 1, math.random(5,10))
end

