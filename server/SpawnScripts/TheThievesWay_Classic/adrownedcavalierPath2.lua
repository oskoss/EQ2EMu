--[[
    Script Name    : SpawnScripts/TheThievesWay_Classic/adrownedcavalierPath2.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.12.24 06:12:14
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    AddTimer(NPC, 6000, "waypoints")
    SetSpawnAnimation(NPC, 13016)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, -38.66, 0, 214.49, 2, 0)
	MovementLoopAddLocation(NPC, -38.29, 0, 204.28, 2, 0)
	MovementLoopAddLocation(NPC, -41.36, 0, 202.01, 2, 0)
	MovementLoopAddLocation(NPC, -45.9, 0, 201.75, 2, 0)
	MovementLoopAddLocation(NPC, -65.02, 0, 201, 2, 0)
	MovementLoopAddLocation(NPC, -67.8, 0, 199.83, 2, 0)
	MovementLoopAddLocation(NPC, -68.86, 0, 197.64, 2, 0)
	MovementLoopAddLocation(NPC, -67.13, 0, 200.47, 2, 0)
	MovementLoopAddLocation(NPC, -41.54, 0, 200.81, 2, 0)
	MovementLoopAddLocation(NPC, -37.91, 0, 204.23, 2, 0)
end