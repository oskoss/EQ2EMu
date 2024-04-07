--[[
    Script Name    : SpawnScripts/Classic_forest/aruinsskulker2.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.10.14 08:10:01
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/CatalogueQuestUpdates.lua")
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
	MovementLoopAddLocation(NPC, 997.99, -26.5, -907.33, 2, 0)
	MovementLoopAddLocation(NPC, 980.26, -26.69, -899.13, 2, 0)
	MovementLoopAddLocation(NPC, 957.91, -27.04, -884.64, 2, 0)
	MovementLoopAddLocation(NPC, 946.25, -24.76, -850.75, 2, 6)
	MovementLoopAddLocation(NPC, 946.25, -24.76, -850.75, 2, 0)
	MovementLoopAddLocation(NPC, 954.38, -25.36, -858, 2, 0)
	MovementLoopAddLocation(NPC, 973.92, -24.38, -871.07, 2, 0)
	MovementLoopAddLocation(NPC, 981.75, -24.57, -878.75, 2, 0)
	MovementLoopAddLocation(NPC, 993.5, -23.89, -880.54, 2, 0)
	MovementLoopAddLocation(NPC, 998.83, -25.05, -890.62, 2, 0)
	MovementLoopAddLocation(NPC, 997.99, -26.5, -907.33, 2, 6)
end

