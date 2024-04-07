--[[
    Script Name    : SpawnScripts/DoF_design_path_script/aGruttoothlookout.lua
    Script Author  : Dorbin
    Script Date    : 2023.07.19 08:07:58
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
	MovementLoopAddLocation(NPC, 84.06, 0, 11.79, 2, 3)
	MovementLoopAddLocation(NPC, 51.82, 0, -21.66, 2, 3)
end
