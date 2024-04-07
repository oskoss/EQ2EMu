--[[
    Script Name    : SpawnScripts/Classic_forest/astoneshellsnapper11.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.10.12 07:10:40
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
	MovementLoopAddLocation(NPC, 1145.93, -22.36, -657.25, 1, 0)
	MovementLoopAddLocation(NPC, 1151.33, -22.01, -656.62, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 1151.33, -22.01, -656.62, 1, 0)
	MovementLoopAddLocation(NPC, 1149.01, -20.21, -653.7, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 1149.01, -20.21, -653.7, 1, 0)
	MovementLoopAddLocation(NPC, 1142.3, -22.38, -658.72, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 1142.3, -22.38, -658.72, 1, 0)
	MovementLoopAddLocation(NPC, 1146.89, -23.36, -660.55, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 1146.89, -23.36, -660.55, 1, 0)
	MovementLoopAddLocation(NPC, 1139.43, -22.11, -659.1, 1, 0)
	MovementLoopAddLocation(NPC, 1134.2, -21.75, -658.95, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 1134.2, -21.75, -658.95, 1, 0)
	MovementLoopAddLocation(NPC, 1131.32, -19.44, -654.62, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 1131.32, -19.44, -654.62, 1, 0)
	MovementLoopAddLocation(NPC, 1128.61, -24.02, -662.75, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 1128.61, -24.02, -662.75, 1, 0)
	MovementLoopAddLocation(NPC, 1135.2, -23.08, -661.77, 1, 0)
	MovementLoopAddLocation(NPC, 1141.96, -22.95, -660.36, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 1141.96, -22.95, -660.36, 1, 0)
	MovementLoopAddLocation(NPC, 1149.25, -22.71, -658.64, 1, 0)
	MovementLoopAddLocation(NPC, 1151.42, -21.09, -655.47, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 1151.42, -21.09, -655.47, 1, 0)
	MovementLoopAddLocation(NPC, 1145.93, -22.36, -657.25, 1, math.random(5,10))
end

