--[[
    Script Name    : SpawnScripts/MizansCellar/WorkBench.lua
    Script Author  : Dorbin
    Script Date    : 2022.09.22 06:09:20
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
    SetRequiredQuest(NPC,5749,10,1,1,1)

end


function respawn(NPC)
	spawn(NPC)
end