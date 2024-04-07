--[[
    Script Name    : SpawnScripts/Commonlands/aBlackshieldsmugglerPath.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.31 04:01:27
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    human(NPC)
    AddTimer(NPC, 6000, "waypoints")
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, -596.61, -145.62, -879.3, 2, 6)
	MovementLoopAddLocation(NPC, -592.55, -145.13, -878.11, 2, 0)
	MovementLoopAddLocation(NPC, -586.81, -142.64, -875.93, 2, 0)
	MovementLoopAddLocation(NPC, -576.01, -138.05, -877.41, 2, 0)
	MovementLoopAddLocation(NPC, -542.73, -124.13, -891.91, 2, 0)
	MovementLoopAddLocation(NPC, -499.94, -108.79, -910.24, 2, 0)
	MovementLoopAddLocation(NPC, -472.84, -96.4, -925.18, 2, 0)
	MovementLoopAddLocation(NPC, -466.64, -93.32, -928.65, 2, 0)
	MovementLoopAddLocation(NPC, -463.17, -91.84, -931.08, 2, 0)
	MovementLoopAddLocation(NPC, -460.98, -90.89, -936.1, 2, 0)
	MovementLoopAddLocation(NPC, -457.28, -90.8, -944.59, 2, MakeRandomInt(8,15))
	MovementLoopAddLocation(NPC, -457.28, -90.8, -944.59, 2, 0)
	MovementLoopAddLocation(NPC, -457.91, -90.66, -942.88, 2, 0)
	MovementLoopAddLocation(NPC, -461.38, -90.95, -936.12, 2, 0)
	MovementLoopAddLocation(NPC, -467.97, -93.5, -930.86, 2, 0)
	MovementLoopAddLocation(NPC, -493.78, -106.37, -915.46, 2, 0)
	MovementLoopAddLocation(NPC, -513.53, -113.29, -904.24, 2, 0)
	MovementLoopAddLocation(NPC, -535.26, -121.34, -896.48, 2, 0)
	MovementLoopAddLocation(NPC, -550.44, -126.96, -890.56, 2, 0)
	MovementLoopAddLocation(NPC, -579.21, -139.55, -879.26, 2, 0)
	MovementLoopAddLocation(NPC, -588.2, -143.32, -878.41, 2, 0)
end

