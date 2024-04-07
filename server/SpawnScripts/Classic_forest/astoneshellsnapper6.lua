--[[
    Script Name    : SpawnScripts/Classic_forest/astoneshellsnapper6.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.10.12 04:10:44
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
	MovementLoopAddLocation(NPC, 963.68, -24.08, -637.53, 1, 0)
	MovementLoopAddLocation(NPC, 957.73, -25.46, -634.93, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 957.73, -25.46, -634.93, 1, 0)
	MovementLoopAddLocation(NPC, 955.8, -27.23, -632.87, 1, 0)
	MovementLoopAddLocation(NPC, 950.77, -26.45, -633.32, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 950.77, -26.45, -633.32, 1, 0)
	MovementLoopAddLocation(NPC, 957.09, -26.03, -634.13, 1, 0)
	MovementLoopAddLocation(NPC, 958.41, -24.47, -636.4, 1, 0)
	MovementLoopAddLocation(NPC, 961.45, -23.55, -639.12, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 961.45, -23.55, -639.12, 1, 0)
	MovementLoopAddLocation(NPC, 968.27, -22.76, -637.23, 1, 0)
	MovementLoopAddLocation(NPC, 972.34, -22.49, -634.14, 1, 0)
	MovementLoopAddLocation(NPC, 978.9, -25.29, -627.6, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 978.9, -25.29, -627.6, 1, 0)
	MovementLoopAddLocation(NPC, 973.03, -26.06, -629.85, 1, 0)
	MovementLoopAddLocation(NPC, 966.01, -27.11, -633.89, 1, 0)
	MovementLoopAddLocation(NPC, 961.09, -26.28, -635.24, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 961.09, -26.28, -635.24, 1, 0)
	MovementLoopAddLocation(NPC, 958.92, -24.58, -636.43, 1, 0)
	MovementLoopAddLocation(NPC, 958.85, -22.79, -639.16, 1, math.random(5,10))
	MovementLoopAddLocation(NPC, 958.85, -22.79, -639.16, 1, 0)
	MovementLoopAddLocation(NPC, 963.68, -24.08, -637.53, 1, math.random(5,10))
end

