--[[
    Script Name    : SpawnScripts/Classic_forest/abonecutterfishRoam2.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.10.13 03:10:34
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
	MovementLoopAddLocation(NPC, 980.77, -24.37, -793.23, 1, 0)
	MovementLoopAddLocation(NPC, 983.03, -24.37, -781.99, 1, 0)
	MovementLoopAddLocation(NPC, 990.35, -24.33, -772.31, 1, 0)
	MovementLoopAddLocation(NPC, 993.63, -24.32, -766.31, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 993.63, -24.36, -766.31, 1, 0)
	MovementLoopAddLocation(NPC, 984.16, -24.34, -774.4, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 984.16, -24.37, -774.4, 1, 0)
	MovementLoopAddLocation(NPC, 988.1, -24.33, -778.68, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 988.1, -24.35, -778.68, 1, 0)
	MovementLoopAddLocation(NPC, 982.75, -24.35, -784.42, 1, 0)
	MovementLoopAddLocation(NPC, 978.22, -24.3, -799.42, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 978.22, -24.36, -799.42, 1, 0)
	MovementLoopAddLocation(NPC, 980.77, -24.37, -793.23, 1, math.random(5,10))
end

