--[[
    Script Name    : SpawnScripts/DoF_design_path_script/Chonk.lua
    Script Author  : Dorbin
    Script Date    : 2023.07.20 07:07:58
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
	spawn(NPC)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, -66.19, -0.02, 28.33, 2, 3)
	MovementLoopAddLocation(NPC, -66.19, -0.02, 28.33, 2, 0)
	MovementLoopAddLocation(NPC, -70.77, 0, 42.94, 2, 3)
	MovementLoopAddLocation(NPC, -70.77, 0, 42.94, 2, 0)
	MovementLoopAddLocation(NPC, -79.66, 0, 26.81, 2, 3)
	MovementLoopAddLocation(NPC, -79.66, 0, 26.81, 2, 0)
end


