--[[
    Script Name    : SpawnScripts/IsleRefuge1/aGruttoothbruteR1.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.09.09 09:09:09
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
	MovementLoopAddLocation(NPC, 210.34, -0.75, -126.85, 4, 5)
	MovementLoopAddLocation(NPC, 212.94, -0.75, -135.43, 4, 0)
	MovementLoopAddLocation(NPC, 219.28, -0.77, -186.7, 4, 0)
	MovementLoopAddLocation(NPC, 218.06, -0.76, -189.27, 4, math.random(5,10))
	MovementLoopAddLocation(NPC, 218.06, -0.76, -189.27, 4, 0)
	MovementLoopAddLocation(NPC, 218.94, -0.76, -187.36, 4, 0)
	MovementLoopAddLocation(NPC, 207.88, -0.73, -136.6, 4, 0)
	MovementLoopAddLocation(NPC, 210.34, -0.75, -126.85, 4, 0)
end

