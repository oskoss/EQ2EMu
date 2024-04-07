--[[
    Script Name    : SpawnScripts/Starcrest/gardensoil.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.26 07:09:59
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
    SetRequiredQuest(NPC,241,4,1,1,1)
end


function respawn(NPC)
	spawn(NPC)
end