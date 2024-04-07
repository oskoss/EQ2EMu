--[[
    Script Name    : SpawnScripts/Longshadow/abrinesifter.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.16 03:10:30
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/CombatModule"

function spawn(NPC)
	waypoints(NPC)
end

function hailed(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function waypoints(NPC)
    if GetSpawnLocationID(NPC)==133787088 then
	MovementLoopAddLocation(NPC, -49.07, -17.26, -112.17, 1, math.random(10,20))
	MovementLoopAddLocation(NPC, -52.76, -17.94, -103.60, 1,  math.random(6,20))
	MovementLoopAddLocation(NPC, -53.88, -17.61, -109.86, 1, math.random(6,20))
	MovementLoopAddLocation(NPC, -47.11, -17.36, -105.66, 1, math.random(6,20))

    elseif GetSpawnLocationID(NPC)==133787089 then
    MovementLoopAddLocation(NPC,-60.76, -18.16, -107.26, 1, math.random(6,20))
	MovementLoopAddLocation(NPC, -62.21, -17.98, -100.15, 1, math.random(6,20))
	MovementLoopAddLocation(NPC, -68.03, -16.41, -103.28, 1, math.random(10,20))
	MovementLoopAddLocation(NPC,-58.41, -18.25, -103.04, 1, math.random(6,20))
	
    elseif GetSpawnLocationID(NPC)==133787090 then
	MovementLoopAddLocation(NPC, -55.81, -13.50, -69.65, 1, math.random(6,20))
	MovementLoopAddLocation(NPC, -61.08, -14.65, -76.12, 1, math.random(10,20))
	MovementLoopAddLocation(NPC, -58.91, -15.46, -81.00, 1, math.random(6,20))
	MovementLoopAddLocation(NPC, -60.19, -13.80, -68.21, 1, math.random(6,20))
    end
end
