--[[
    Script Name    : SpawnScripts/Caves_Classic/analbinopython.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.11 01:09:40
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/CatalogueQuestUpdates.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)

end


function respawn(NPC)
	spawn(NPC)
end