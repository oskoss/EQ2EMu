--[[
    Script Name    : SpawnScripts/Oakmyst_Classic/anOakmystgreatbearPatrol2.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.10.19 03:10:32
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    waypoints(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, 996.04, 12.11, -292.01, 2, 5)
	MovementLoopAddLocation(NPC, 995.66, 12.23, -288.73, 2, 0)
	MovementLoopAddLocation(NPC, 1000.29, 12.87, -281.54, 2, math.random(8,12))
	MovementLoopAddLocation(NPC, 1000.29, 12.87, -281.54, 2, 0)
	MovementLoopAddLocation(NPC, 991.59, 12.5, -283.18, 2, math.random(8,12))
	MovementLoopAddLocation(NPC, 991.59, 12.5, -283.18, 2, 0)
	MovementLoopAddLocation(NPC, 999.06, 12.61, -291.83, 2, math.random(8,12))
	MovementLoopAddLocation(NPC, 999.06, 12.61, -291.83, 2, 0)
	MovementLoopAddLocation(NPC, 999.67, 12.78, -267.14, 2, math.random(8,12))
	MovementLoopAddLocation(NPC, 999.67, 12.78, -267.14, 2, 0)
	MovementLoopAddLocation(NPC, 1000.46, 12.86, -268.17, 2, 0)
	MovementLoopAddLocation(NPC, 987.28, 12.84, -280.18, 2, 0)
	MovementLoopAddLocation(NPC, 1001.09, 12.85, -291.37, 2, math.random(8,12))
	MovementLoopAddLocation(NPC, 1001.09, 12.85, -291.37, 2, 0)
	MovementLoopAddLocation(NPC, 992.59, 12.17, -288.44, 2, 0)
	MovementLoopAddLocation(NPC, 990.64, 12.54, -282.91, 2, 0)
	MovementLoopAddLocation(NPC, 985.3, 12.82, -281.42, 2, 0)
	MovementLoopAddLocation(NPC, 983.3, 12.58, -285.56, 2, math.random(8,12))
	MovementLoopAddLocation(NPC, 983.3, 12.58, -285.56, 2, 0)
	MovementLoopAddLocation(NPC, 983.62, 12.81, -282.04, 2, 0)
	MovementLoopAddLocation(NPC, 988.82, 12.77, -281.33, 2, 0)
	MovementLoopAddLocation(NPC, 992.13, 12.55, -284.39, 2, 0)
	MovementLoopAddLocation(NPC, 996.04, 12.11, -292.01, 2, 5)
end

