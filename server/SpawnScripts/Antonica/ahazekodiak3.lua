--[[
    Script Name    : SpawnScripts/Antonica/ahazekodiak3.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.08.24 08:08:18
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
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, -2075.21, 41.68, 859.18, 2, 5)
	MovementLoopAddLocation(NPC, -2063.19, 47.45, 916.56, 2, 0)
	MovementLoopAddLocation(NPC, -2066.38, 47.5, 916.81, 2, 0)
	MovementLoopAddLocation(NPC, -2076.86, 41.74, 859.34, 2, 0)
	MovementLoopAddLocation(NPC, -2075.83, 35.37, 813.15, 2, 0)
	MovementLoopAddLocation(NPC, -2085.01, 27.21, 793.39, 2, 0)
	MovementLoopAddLocation(NPC, -2086.81, 21.61, 781.61, 2, 0)
	MovementLoopAddLocation(NPC, -2084.05, 16.68, 772.05, 2, 0)
	MovementLoopAddLocation(NPC, -2075.38, 7.84, 752.29, 2, 0)
	MovementLoopAddLocation(NPC, -2071.03, -9.15, 721.71, 2, 0)
	MovementLoopAddLocation(NPC, -2063.19, -18.18, 708.74, 2, 0)
	MovementLoopAddLocation(NPC, -2056.05, -21.62, 699.68, 2, 0)
	MovementLoopAddLocation(NPC, -2053.2, -20.4, 703.13, 2, 0)
	MovementLoopAddLocation(NPC, -2067.33, -10.09, 720.9, 2, 0)
	MovementLoopAddLocation(NPC, -2072.72, 7.17, 751.51, 2, 0)
	MovementLoopAddLocation(NPC, -2083.09, 16.84, 772.81, 2, 0)
	MovementLoopAddLocation(NPC, -2084.99, 20.58, 779.85, 2, 0)
	MovementLoopAddLocation(NPC, -2083.21, 27.05, 792.4, 2, 0)
	MovementLoopAddLocation(NPC, -2074.36, 35.13, 812.5, 2, 0)
	MovementLoopAddLocation(NPC, -2075.21, 41.68, 859.18, 2, 0)
end

