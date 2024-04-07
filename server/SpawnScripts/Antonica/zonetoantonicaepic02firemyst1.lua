--[[
    Script Name    : SpawnScripts/Antonica/zonetoantonicaepic02firemyst1.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.18 01:09:15
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
    SetRequiredQuest(NPC,5814,1,0,0,1) --FOUL WIND
    SetRequiredQuest(NPC,5522,9,0,1,1) --LORD GRIMROT
end


function respawn(NPC)
	spawn(NPC)
end