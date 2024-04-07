--[[
    Script Name    : SpawnScripts/HiddenVillage/Reppoh.lua
    Script Author  : neatz09
    Script Date    : 2023.12.13 03:12:27
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
    waypoints(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, -97.46, 13.72, 208.56, 2, 0)
	MovementLoopAddLocation(NPC, -96.87, 13.72, 199.38, 2, 0)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end