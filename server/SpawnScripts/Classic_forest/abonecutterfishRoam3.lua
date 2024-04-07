--[[
    Script Name    : SpawnScripts/Classic_forest/abonecutterfishRoam3.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.10.13 03:10:43
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
	MovementLoopAddLocation(NPC, 984.75, -24.37, -781.6, 1, 0)
	MovementLoopAddLocation(NPC, 983.32, -24.35, -776.16, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 983.32, -24.36, -776.16, 1, 0)
	MovementLoopAddLocation(NPC, 987.39, -24.36, -781.28, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 987.39, -24.36, -781.28, 1, 0)
	MovementLoopAddLocation(NPC, 987, -24.37, -777.59, 1, 0)
	MovementLoopAddLocation(NPC, 987.23, -24.34, -773.78, 1, 0)
	MovementLoopAddLocation(NPC, 993.85, -24.49, -766.19, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 993.85, -24.49, -766.19, 1, 0)
	MovementLoopAddLocation(NPC, 985.53, -24.32, -774.67, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 985.53, -24.37, -774.67, 1, 0)
	MovementLoopAddLocation(NPC, 984.75, -24.37, -781.6, 1, math.random(5,10))
end

