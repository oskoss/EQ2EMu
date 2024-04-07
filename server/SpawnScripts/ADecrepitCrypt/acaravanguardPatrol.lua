--[[
    Script Name    : SpawnScripts/ADecrepitCrypt/acaravanguardPatrol.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.02.12 07:02:06
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
	MovementLoopAddLocation(NPC, 1.28, -1.04, 10.07, 2, 0)
	MovementLoopAddLocation(NPC, 0.45, -1.04, -23.23, 2, 6)
end