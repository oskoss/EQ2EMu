--[[
    Script Name    : SpawnScripts/TempleSt/Cog.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.26 04:10:47
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/CombatModule"

function spawn(NPC)
    if GetSpawnLocationID(NPC) == 420519 then
	waypoints(NPC)
	end
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, 59.08, 2.98, 66.57, 1, 0)
	MovementLoopAddLocation(NPC, 65.75, 2.66, 68.99, 1, 0)
	MovementLoopAddLocation(NPC, 70.73, 1.31, 71.18, 1, 0)
	MovementLoopAddLocation(NPC, 72.64, 0.15, 76.22, 1, 0)
	MovementLoopAddLocation(NPC, 73.22, -1.54, 81.16, 1, 0)
	MovementLoopAddLocation(NPC, 76.99, -3.86, 86.28, 1, 0)
	MovementLoopAddLocation(NPC, 82.14, -4.57, 94.41, 1, 0)
	MovementLoopAddLocation(NPC, 85.63, -4.57, 99.11, 1, 0)
	MovementLoopAddLocation(NPC, 89.04, -4.57, 100.72, 1, 0)
	MovementLoopAddLocation(NPC, 96.62, -4.57, 103.5, 1, 0)
	MovementLoopAddLocation(NPC, 102.64, -4.57, 103.44, 1, 0)
	MovementLoopAddLocation(NPC, 102.64, -4.57, 103.44, 1, 6)
	MovementLoopAddLocation(NPC, 103.05, -4.57, 100.13, 1, 6)
	MovementLoopAddLocation(NPC, 107, -4.57, 100.34, 1, 6)
	MovementLoopAddLocation(NPC, 105.18, -4.57, 105.33, 1, 6)
	MovementLoopAddLocation(NPC, 104.3, -4.57, 100.09, 1, 6)
	MovementLoopAddLocation(NPC, 102.29, -4.57, 104.05, 1, 0)
	MovementLoopAddLocation(NPC, 94.93, -4.57, 103.03, 1, 0)
	MovementLoopAddLocation(NPC, 86.36, -4.57, 104.07, 1, 0)
	MovementLoopAddLocation(NPC, 82.36, -4.57, 113.99, 1, 6)
	MovementLoopAddLocation(NPC, 81.93, -4.57, 118.26, 1, 6)
	MovementLoopAddLocation(NPC, 78.49, -4.57, 117.05, 1, 6)
	MovementLoopAddLocation(NPC, 84.56, -4.57, 109.62, 1, 0)
	MovementLoopAddLocation(NPC, 83.57, -4.57, 102.47, 1, 0)
	MovementLoopAddLocation(NPC, 78.62, -4.57, 92.98, 1, 0)
	MovementLoopAddLocation(NPC, 72.17, -1.28, 80.91, 1, 0)
	MovementLoopAddLocation(NPC, 71.47, 0.53, 74.66, 1, 0)
	MovementLoopAddLocation(NPC, 69.29, 1.76, 71.19, 1, 0)
	MovementLoopAddLocation(NPC, 64.14, 2.83, 69.97, 1, 0)
	MovementLoopAddLocation(NPC, 58.83, 2.97, 68.83, 1, 0)
	MovementLoopAddLocation(NPC, 55, 3, 67.84, 1, 0)
	MovementLoopAddLocation(NPC, 45, 3, 74.12, 1, 0)
	MovementLoopAddLocation(NPC, 40.11, 3, 76.12, 1, 0)
	MovementLoopAddLocation(NPC, 35.9, 3, 76.99, 1, 0)
	MovementLoopAddLocation(NPC, 25.88, 3, 78.71, 1, 6)
	MovementLoopAddLocation(NPC, 20.76, 2.98, 76.22, 1, 6)
	MovementLoopAddLocation(NPC, 18.87, 3.02, 70.05, 1, 6)
	MovementLoopAddLocation(NPC, 14.13, 3.01, 69.73, 1, 0)
	MovementLoopAddLocation(NPC, 0.67, 3, 68.21, 1, 6)
	MovementLoopAddLocation(NPC, 5.59, 3, 68.99, 1, 0)
	MovementLoopAddLocation(NPC, 16.07, 3.01, 70.82, 1, 0)
	MovementLoopAddLocation(NPC, 24.89, 3, 64.64, 1, 6)
	MovementLoopAddLocation(NPC, 22.21, 2.99, 77.51, 1, 6)
	MovementLoopAddLocation(NPC, 25.83, 3, 76.99, 1, 6)
	MovementLoopAddLocation(NPC, 25.15, 3, 66.7, 1, 0)
	MovementLoopAddLocation(NPC, 28.38, 3, 59.2, 1, 0)
	MovementLoopAddLocation(NPC, 33.12, 3, 53.7, 1, 0)
	MovementLoopAddLocation(NPC, 45.03, 3, 47.48, 1, 6)
	MovementLoopAddLocation(NPC, 48.11, 3, 46.05, 1, 6)
	MovementLoopAddLocation(NPC, 46, 3, 50.1, 1, 0)
	MovementLoopAddLocation(NPC, 50.89, 3, 60.39, 1, 0)
	MovementLoopAddLocation(NPC, 55.36, 3, 65.37, 1, 0)
end


