--[[
    Script Name    : SpawnScripts/Graystone/ScribeBoomcast.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.22 12:09:38
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
    SetInfoStructString(NPC, "action_state", "artificing_idle")
end


function respawn(NPC)
	spawn(NPC)
end