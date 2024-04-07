--[[
    Script Name    : SpawnScripts/IsleRefuge1/aGruttoothmystic2.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.09.06 12:09:51
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    waypoints(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, 116.87, 1.55, 115.45, 4, math.random(5,10))
	MovementLoopAddLocation(NPC, 126.95, 1.51, 100.08, 4, math.random(5,10))
	MovementLoopAddLocation(NPC, 126.95, 1.51, 100.08, 4, 0)
	MovementLoopAddLocation(NPC, 123.01, 1.53, 103.13, 4,math.random(5,10))
	MovementLoopAddLocation(NPC, 123.01, 1.53, 103.13, 4, 0)
	MovementLoopAddLocation(NPC, 137.92, 1.5, 99.36, 4, math.random(5,10))
	MovementLoopAddLocation(NPC, 137.92, 1.5, 99.36, 4, 0)
	MovementLoopAddLocation(NPC, 117.2, 1.55, 93.12, 4, math.random(5,10))
	MovementLoopAddLocation(NPC, 117.2, 1.55, 93.12, 4, 0)
	MovementLoopAddLocation(NPC, 137.15, 1.48, 95.36, 4, math.random(5,10))
	MovementLoopAddLocation(NPC, 137.15, 1.48, 95.36, 4, 0)
	MovementLoopAddLocation(NPC, 124.22, 1.52, 102.77, 4, math.random(5,10))
	MovementLoopAddLocation(NPC, 124.22, 1.52, 102.77, 4, 0)
end

