--[[
    Script Name    : SpawnScripts/Antonica/questtriggerscornshameirisor.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.18 07:09:44
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
    SetRequiredQuest(NPC,1,1,0,0,1) --Two Wrongs Don't Make a Right

end

function respawn(NPC)
	spawn(NPC)
end