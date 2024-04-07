--[[
    Script Name    : SpawnScripts/TheThievesWay_Classic/adrownedcavalierPath3.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.12.24 06:12:22
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
	MovementLoopAddLocation(NPC, -75.43, 0.1, 193.04, 2, 0)
	MovementLoopAddLocation(NPC, -82.76, 0.47, 193, 2, 0)
	MovementLoopAddLocation(NPC, -106.29, 0.03, 192.47, 2, 0)
	MovementLoopAddLocation(NPC, -110.22, 0.02, 191.45, 2, 0)
	MovementLoopAddLocation(NPC, -113.14, 0.01, 188.72, 2, 0)
	MovementLoopAddLocation(NPC, -113.97, 1, 186.39, 2, 0)
	MovementLoopAddLocation(NPC, -114.16, 0.48, 163.91, 2, 0)
	MovementLoopAddLocation(NPC, -114.04, 0, 182.98, 2, 0)
	MovementLoopAddLocation(NPC, -114, 1, 185.88, 2, 0)
	MovementLoopAddLocation(NPC, -113.77, 0.01, 188.22, 2, 0)
	MovementLoopAddLocation(NPC, -110.41, 0.02, 191.29, 2, 0)
	MovementLoopAddLocation(NPC, -100.42, 0.52, 192.63, 2, 0)
	MovementLoopAddLocation(NPC, -82.67, 0.47, 192.94, 2, 0)
end