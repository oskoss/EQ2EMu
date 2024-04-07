--[[
    Script Name    : SpawnScripts/DoF_design_path_script/Venekor.lua
    Script Author  : Dorbin
    Script Date    : 2023.07.16 11:07:19
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
SetSpawnAnimation(NPC,"1643")
end

function hailed(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end