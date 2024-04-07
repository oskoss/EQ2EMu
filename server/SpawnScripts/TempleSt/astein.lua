--[[
    Script Name    : SpawnScripts/TempleSt/astein.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.29 12:10:06
    Script Purpose : 
                   : 
--]]
local MucksQuest = 5874

function spawn(NPC)
		SetRequiredQuest(NPC, MucksQuest, 2, 1)
end


function respawn(NPC)
	spawn(NPC)
end