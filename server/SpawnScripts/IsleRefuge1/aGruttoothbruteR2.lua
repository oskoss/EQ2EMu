--[[
    Script Name    : SpawnScripts/IsleRefuge1/aGruttoothbruteR2.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.09.09 09:09:37
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BaseGoblin2.lua")
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
	MovementLoopAddLocation(NPC, 175.23, 1.72, -156.04, 4, 5)
	MovementLoopAddLocation(NPC, 211.45, -0.74, -152.61, 4, 0)
	MovementLoopAddLocation(NPC, 231.75, -0.81, -158.94, 4, math.random(5,10))
	MovementLoopAddLocation(NPC, 231.75, -0.81, -158.94, 4, 0)
	MovementLoopAddLocation(NPC, 189.91, -0.66, -156.27, 4, 0)
	MovementLoopAddLocation(NPC, 175.23, 1.72, -156.04, 4, 0)
end