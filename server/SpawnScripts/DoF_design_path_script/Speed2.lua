--[[
    Script Name    : SpawnScripts/DoF_design_path_script/Speed2.lua
    Script Author  : Dorbin
    Script Date    : 2023.07.18 06:07:12
    Script Purpose : 
                   : 
--]]

function spawn(NPC)

end

function death(NPC, Spawn)
	Despawn(NPC)
end

function respawn(NPC)
	spawn(NPC)
end