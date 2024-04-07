--[[
    Script Name    : SpawnScripts/QeynosHarbor/RoyalLibrarianBrinn.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.22 04:09:46
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
    SetInfoStructString(NPC, "action_state", "drinking_idle")
end



function respawn(NPC)
	spawn(NPC)
end