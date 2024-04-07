--[[
    Script Name    : SpawnScripts/TempleSt/forestspidershipment.lua
    Script Author  : Dorbin
    Script Date    : 2023.11.14 04:11:00
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
    SetRequiredQuest(NPC, 1, 1,0)
end


function respawn(NPC)
	spawn(NPC)
end