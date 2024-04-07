--[[
    Script Name    : SpawnScripts/TheThievesWay_Classic/adrownedcavalierPath1.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.12.24 06:12:53
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
	MovementLoopAddLocation(NPC, -28.81, 0, 214.05, 2, 0)
	MovementLoopAddLocation(NPC, -30.6, 0, 198.2, 2, 0)
	MovementLoopAddLocation(NPC, -33.31, 0, 193.28, 2, 0)
	MovementLoopAddLocation(NPC, -42.36, 0, 186.31, 2, 0)
	MovementLoopAddLocation(NPC, -62.84, 0, 185.26, 2, 0)
	MovementLoopAddLocation(NPC, -68.79, 0, 187.39, 2, 0)
	MovementLoopAddLocation(NPC, -70.73, 0, 190.33, 2, 0)
	MovementLoopAddLocation(NPC, -68.56, 0, 188.49, 2, 0)
	MovementLoopAddLocation(NPC, -64.17, 0, 186.99, 2, 0)
	MovementLoopAddLocation(NPC, -38.26, 0, 187.09, 2, 0)
	MovementLoopAddLocation(NPC, -28.01, 0, 196.59, 2, 0)
end
