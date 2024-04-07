--[[
    Script Name    : SpawnScripts/Commonlands/asavannalionessRaman4.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.23 05:01:34
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    AddTimer(NPC, 18000, "waypoints")
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, 872.73, -59.48, 5.77, 2, 0)
	MovementLoopAddLocation(NPC, 868.63, -59.6, 7.51, 2, 0)
	MovementLoopAddLocation(NPC, 857.94, -58.97, 22.02, 2, 0)
	MovementLoopAddLocation(NPC, 848.88, -56.66, 44.24, 2, 0)
	MovementLoopAddLocation(NPC, 834.27, -54.13, 75.68, 2, 0)
	MovementLoopAddLocation(NPC, 820.55, -54.28, 89.48, 2, 0)
	MovementLoopAddLocation(NPC, 784.63, -51.93, 118.05, 2, 0)
	MovementLoopAddLocation(NPC, 737.83, -52.15, 145.18, 2, 0)
	MovementLoopAddLocation(NPC, 724.07, -52.44, 149.85, 2, 0)
	MovementLoopAddLocation(NPC, 706.64, -53.53, 150.58, 2, 0)
	MovementLoopAddLocation(NPC, 692.28, -53.02, 147.84, 2, 0)
	MovementLoopAddLocation(NPC, 668.76, -49.59, 143.34, 2, 0)
	MovementLoopAddLocation(NPC, 658.93, -48.75, 137.79, 2, 0)
	MovementLoopAddLocation(NPC, 652.8, -47.94, 132.35, 2, 0)
	MovementLoopAddLocation(NPC, 623.66, -46.49, 101.58, 2, 0)
	MovementLoopAddLocation(NPC, 601.59, -47.18, 79.95, 2, 0)
	MovementLoopAddLocation(NPC, 566.07, -48.14, 58.63, 2, 0)
	MovementLoopAddLocation(NPC, 536.11, -48.1, 48.66, 2, 0)
	MovementLoopAddLocation(NPC, 518.76, -48.82, 36.77, 2, 0)
	MovementLoopAddLocation(NPC, 496.68, -50.61, 9.58, 2, 0)
	MovementLoopAddLocation(NPC, 476.98, -49.4, -12.76, 2, 0)
	MovementLoopAddLocation(NPC, 458.44, -48.6, -36.86, 2, 0)
	MovementLoopAddLocation(NPC, 443.35, -48.02, -65.33, 2, 0)
	MovementLoopAddLocation(NPC, 433.57, -47.05, -100.47, 2, 0)
	MovementLoopAddLocation(NPC, 437.06, -46.41, -116.65, 2, 0)
	MovementLoopAddLocation(NPC, 449.78, -47.56, -139.24, 2, 0)
	MovementLoopAddLocation(NPC, 464.61, -47.6, -163.46, 2, 0)
	MovementLoopAddLocation(NPC, 469.28, -47.43, -197.32, 2, 0)
	MovementLoopAddLocation(NPC, 465.41, -46.83, -213.62, 2, 0)
	MovementLoopAddLocation(NPC, 416.2, -46.91, -272.97, 2, 0)
	MovementLoopAddLocation(NPC, 423.34, -47.81, -295.2, 2, 0)
	MovementLoopAddLocation(NPC, 448.67, -47.43, -306.49, 2, 0)
	MovementLoopAddLocation(NPC, 485.21, -47.94, -306.16, 2, 0)
	MovementLoopAddLocation(NPC, 512.96, -47.41, -311.94, 2, 0)
	MovementLoopAddLocation(NPC, 562.88, -46.01, -317.03, 2, 0)
	MovementLoopAddLocation(NPC, 615.54, -47.65, -314.87, 2, 0)
	MovementLoopAddLocation(NPC, 638.49, -47.98, -313.82, 2, 0)
	MovementLoopAddLocation(NPC, 665.53, -51.3, -316.33, 2, 0)
	MovementLoopAddLocation(NPC, 747.99, -57.15, -325.5, 2, 0)
	MovementLoopAddLocation(NPC, 778.08, -59.39, -323.36, 2, 0)
	MovementLoopAddLocation(NPC, 853.7, -58.95, -348.76, 2, 0)
	MovementLoopAddLocation(NPC, 890.58, -57.88, -355.88, 2, 0)
	MovementLoopAddLocation(NPC, 955.9, -57.98, -357.5, 2, 0)
	MovementLoopAddLocation(NPC, 994.19, -56.23, -358.15, 2, 0)
	MovementLoopAddLocation(NPC, 1025.93, -52.07, -358.68, 2, 0)
	MovementLoopAddLocation(NPC, 1045.84, -49.34, -349.85, 2, 0)
	MovementLoopAddLocation(NPC, 1059.88, -47.58, -327.3, 2, 0)
	MovementLoopAddLocation(NPC, 1061.43, -48.91, -297.02, 2, 0)
	MovementLoopAddLocation(NPC, 1062.22, -50.07, -266.84, 2, 0)
	MovementLoopAddLocation(NPC, 1057, -54.46, -242.51, 2, 0)
	MovementLoopAddLocation(NPC, 1045.23, -55.51, -220.31, 2, 0)
	MovementLoopAddLocation(NPC, 1016.25, -56.11, -175.52, 2, 0)
	MovementLoopAddLocation(NPC, 995.12, -56.95, -147.84, 2, 0)
	MovementLoopAddLocation(NPC, 975.36, -55.9, -104.81, 2, 0)
	MovementLoopAddLocation(NPC, 949.16, -57.17, -72.14, 2, 0)
	MovementLoopAddLocation(NPC, 913.48, -58.87, -30.68, 2, 0)
end