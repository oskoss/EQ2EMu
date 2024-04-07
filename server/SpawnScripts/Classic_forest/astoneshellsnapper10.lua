--[[
    Script Name    : SpawnScripts/Classic_forest/astoneshellsnapper10.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.10.12 07:10:03
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
	MovementLoopAddLocation(NPC, 1133.82, -22.61, -660.65, 1, 0)
	MovementLoopAddLocation(NPC, 1131.61, -20.28, -656.25, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 1131.61, -20.28, -656.25, 1, 0)
	MovementLoopAddLocation(NPC, 1129.37, -23.23, -661.36, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 1129.37, -23.23, -661.36, 1, 0)
	MovementLoopAddLocation(NPC, 1138.37, -23.22, -661.82, 1, 0)
	MovementLoopAddLocation(NPC, 1140.71, -22.26, -658.99, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 1140.71, -22.26, -658.99, 1, 0)
	MovementLoopAddLocation(NPC, 1135.71, -21.58, -658.65, 1, 0)
	MovementLoopAddLocation(NPC, 1127.28, -21.49, -657.56, 1, 0)
	MovementLoopAddLocation(NPC, 1122.88, -20.34, -655.3, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 1122.88, -20.34, -655.3, 1, 0)
	MovementLoopAddLocation(NPC, 1122.08, -23.91, -661.36, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 1122.08, -23.91, -661.36, 1, 0)
	MovementLoopAddLocation(NPC, 1126.48, -23.55, -660.64, 1, 0)
	MovementLoopAddLocation(NPC, 1129.45, -22.13, -659.39, 1, 0)
	MovementLoopAddLocation(NPC, 1133.82, -22.61, -660.65, 1, math.random(5,10))
end

