--[[
    Script Name    : SpawnScripts/Classic_forest/astoneshellsnapper7.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.10.12 04:10:06
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
	MovementLoopAddLocation(NPC, 939.95, -25.64, -626.15, 1, 0)
	MovementLoopAddLocation(NPC, 944.12, -24.73, -630.87, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 944.12, -24.73, -630.87, 1, 0)
	MovementLoopAddLocation(NPC, 941.33, -26.26, -623.96, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 941.33, -26.26, -623.96, 1, 0)
	MovementLoopAddLocation(NPC, 945.4, -26.74, -627.3, 1, 0)
	MovementLoopAddLocation(NPC, 947.08, -25.57, -631.86, 1, 0)
	MovementLoopAddLocation(NPC, 950.99, -26.31, -633.69, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 956.45, -26.65, -633.56, 1, 0)
	MovementLoopAddLocation(NPC, 959.33, -25.15, -635.85, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 959.33, -25.15, -635.85, 1, 0)
	MovementLoopAddLocation(NPC, 954.76, -24.52, -635.31, 1, 0)
	MovementLoopAddLocation(NPC, 950.52, -26.37, -633.44, 1, 0)
	MovementLoopAddLocation(NPC, 947.73, -25.44, -632.84, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 947.73, -25.44, -632.84, 1, 0)
	MovementLoopAddLocation(NPC, 945.87, -26.38, -628.8, 1, 0)
	MovementLoopAddLocation(NPC, 942.74, -26.6, -624.85, 1, 0)
	MovementLoopAddLocation(NPC, 939.95, -25.64, -626.15, 1, math.random(5,10))
end

