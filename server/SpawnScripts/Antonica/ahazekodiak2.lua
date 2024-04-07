--[[
    Script Name    : SpawnScripts/Antonica/ahazekodiak2.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.08.24 08:08:39
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
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, -2077.68, 32.79, 807.1, 2, 5)
	MovementLoopAddLocation(NPC, -2085.26, 27.19, 793.26, 2, 0)
	MovementLoopAddLocation(NPC, -2086.8, 21.47, 781.34, 2, 0)
	MovementLoopAddLocation(NPC, -2083.91, 16.52, 771.65, 2, 0)
	MovementLoopAddLocation(NPC, -2075.17, 7.98, 753.03, 2, 0)
	MovementLoopAddLocation(NPC, -2070.47, -9.33, 721.61, 2, 0)
	MovementLoopAddLocation(NPC, -2057.57, -21.1, 701.56, 2, 0)
	MovementLoopAddLocation(NPC, -2054.09, -20.58, 702.68, 2, 0)
	MovementLoopAddLocation(NPC, -2058.37, -17.3, 709.95, 2, 0)
	MovementLoopAddLocation(NPC, -2068.21, -9.43, 722.08, 2, 0)
	MovementLoopAddLocation(NPC, -2072.94, 7.37, 751.96, 2, 0)
	MovementLoopAddLocation(NPC, -2083.04, 16.5, 772.11, 2, 0)
	MovementLoopAddLocation(NPC, -2084.73, 20.42, 779.57, 2, 0)
	MovementLoopAddLocation(NPC, -2083.28, 27.09, 792.53, 2, 0)
	MovementLoopAddLocation(NPC, -2074.05, 35.17, 812.44, 2, 0)
	MovementLoopAddLocation(NPC, -2074.43, 41.43, 854.47, 2, 0)
	MovementLoopAddLocation(NPC, -2063.53, 47.44, 915.92, 2, 0)
	MovementLoopAddLocation(NPC, -2066.67, 47.47, 916.71, 2, 0)
	MovementLoopAddLocation(NPC, -2076.98, 41.91, 860.97, 2, 0)
	MovementLoopAddLocation(NPC, -2075.58, 35.33, 813.12, 2, 0)
	MovementLoopAddLocation(NPC, -2077.41, 33.23, 808.1, 2, 0)
end

