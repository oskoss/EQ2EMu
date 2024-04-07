--[[
    Script Name    : SpawnScripts/Classic_forest/astoneshellsnapper1.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.10.12 03:10:50
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
	MovementLoopAddLocation(NPC, 960.68, -24.05, -577.75, 1, 0)
	MovementLoopAddLocation(NPC, 966.67, -26.64, -584.45, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 966.67, -26.64, -584.45, 1, 0)
	MovementLoopAddLocation(NPC, 971.99, -25.25, -583.13, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 971.99, -25.25, -583.13, 1, 0)
	MovementLoopAddLocation(NPC, 972.92, -23.41, -579.01, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 972.92, -23.41, -579.01, 1, 0)
	MovementLoopAddLocation(NPC, 967.17, -23, -575.46, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 967.17, -23, -575.46, 1, 0)
	MovementLoopAddLocation(NPC, 963.16, -25.78, -581.93, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 963.16, -25.78, -581.93, 1, 0)
	MovementLoopAddLocation(NPC, 961.61, -26.88, -584.15, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 961.61, -26.88, -584.15, 1, 0)
	MovementLoopAddLocation(NPC, 959.02, -25.54, -580.57, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 959.02, -25.54, -580.57, 1, 0)
	MovementLoopAddLocation(NPC, 958.39, -23.66, -576.73, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 958.39, -23.66, -576.73, 1, 0)
	MovementLoopAddLocation(NPC, 960.68, -24.05, -577.75, 1, math.random(5,10))
end

