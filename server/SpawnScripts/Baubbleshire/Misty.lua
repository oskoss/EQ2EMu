--[[
	Script Name	: SpawnScripts/Baubbleshire/Misty.lua
	Script Purpose	: Misty
	Script Author	: Scatman
	Script Date	: 2009.05.11
	Script Notes	: 
--]]

function spawn(NPC)
	MovementLoopAddLocation(NPC, 886.51, -13.74, -433.7, 3, 0)
	MovementLoopAddLocation(NPC, 893.35, -15.1, -442.65, 3, 0)
	MovementLoopAddLocation(NPC, 893.22, -18.07, -453.45, 3, 0)
	MovementLoopAddLocation(NPC, 897.16, -18.12, -463.73, 3, 0)
	MovementLoopAddLocation(NPC, 896.33, -17.98, -468.75, 3, 0)
	MovementLoopAddLocation(NPC, 884.48, -18.47, -479.11, 3, 0)
	MovementLoopAddLocation(NPC, 888.89, -17.96, -490.04, 3, math.random(0, 30))
	MovementLoopAddLocation(NPC, 893.55, -17.65, -496.84, 3, 0)
	MovementLoopAddLocation(NPC, 894.02, -16.24, -519.28, 3, 0)
	MovementLoopAddLocation(NPC, 888.24, -13.86, -538.79, 3, 0)
	MovementLoopAddLocation(NPC, 880.94, -14.64, -532.11, 3, 0)
	MovementLoopAddLocation(NPC, 870.38, -16.37, -530.64, 3, 0)
	MovementLoopAddLocation(NPC, 878.59, -16.88, -514.71, 3, 0)
	MovementLoopAddLocation(NPC, 870.89, -17.85, -491.59, 3, 0)
	MovementLoopAddLocation(NPC, 864.27, -18.18, -485.9, 3, 0)
	MovementLoopAddLocation(NPC, 863.76, -18.43, -474.64, 3, 0)
	MovementLoopAddLocation(NPC, 855.6, -18.89, -460.24, 3, math.random(0, 30))
	MovementLoopAddLocation(NPC, 863.53, -18.78, -446.69, 3, 0)
	MovementLoopAddLocation(NPC, 872.08, -18.49, -442.15, 3, 0)
	MovementLoopAddLocation(NPC, 875.7, -15.04, -425.86, 3, 0)
	MovementLoopAddLocation(NPC, 880.6, -13.86, -432.16, 3, 0)
	MovementLoopAddLocation(NPC, 880.84, -13.44, -438.9, 3, 0)
end

function respawn(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end