--[[
    Script Name    : SpawnScripts/OverlordsPrivateChambers/TayilNVelex.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.24 03:09:54
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
    SetInfoStructString(NPC, "action_state", "cast_4")
end



function respawn(NPC)
	spawn(NPC)
end