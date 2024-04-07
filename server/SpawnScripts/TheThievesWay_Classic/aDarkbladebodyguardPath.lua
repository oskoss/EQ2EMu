--[[
    Script Name    : SpawnScripts/TheThievesWay_Classic/aDarkbladebodyguardPath.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.12.22 05:12:45
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    halfelf(NPC,Spawn)
    AddTimer(NPC, 6000, "waypoints")

end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, -128.82, 0.56, 139.95, 2, 0)
	MovementLoopAddLocation(NPC, -128.53, 0.98, 135.09, 2, 0)
	MovementLoopAddLocation(NPC, -126.4, 1, 132.77, 2, 0)
	MovementLoopAddLocation(NPC, -123.08, 1, 132.05, 2, 0)
	MovementLoopAddLocation(NPC, -102.71, 1, 132.19, 2, 0)
	MovementLoopAddLocation(NPC, -100, 1, 133.59, 2, 0)
	MovementLoopAddLocation(NPC, -98.92, 0.82, 136.44, 2, 0)
	MovementLoopAddLocation(NPC, -98.87, 1, 134.42, 2, 0)
	MovementLoopAddLocation(NPC, -101.05, 1, 132.43, 2, 0)
	MovementLoopAddLocation(NPC, -105.55, 1, 131.82, 2, 0)
	MovementLoopAddLocation(NPC, -124.46, 1, 131.6, 2, 0)
	MovementLoopAddLocation(NPC, -127.17, 1, 132.74, 2, 0)
	MovementLoopAddLocation(NPC, -128.3, 1, 134.7, 2, 0)
	MovementLoopAddLocation(NPC, -128.3, 1, 134.7, 2, 0)
end

