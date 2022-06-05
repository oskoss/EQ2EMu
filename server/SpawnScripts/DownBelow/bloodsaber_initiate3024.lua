--[[
    Script Name    : SpawnScripts/DownBelow/bloodsaber_initiate3024.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.04.03 11:04:46
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
	waypoints(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, 9.14, -4, -160.34, 2, 7)
	MovementLoopAddLocation(NPC, 7.85, 0, -144.71, 2, 5)
	MovementLoopAddLocation(NPC, 6.7, -2.97, -152.32, 2, 5)
	MovementLoopAddLocation(NPC, 4.13, -4, -159.1, 2, 5)
	MovementLoopAddLocation(NPC, 9.4, -4, -158.12, 2, 5)
	MovementLoopAddLocation(NPC, 5.03, -4, -156.87, 2, 5)
	MovementLoopAddLocation(NPC, 8.41, -0.36, -147.15, 2, 5)
	MovementLoopAddLocation(NPC, 9.16, 0, -143.5, 2, 5)
	MovementLoopAddLocation(NPC, 5.51, -1.82, -150, 2, 5)
end
