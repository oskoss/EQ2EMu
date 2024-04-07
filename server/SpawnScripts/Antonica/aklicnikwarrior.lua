--[[
    Script Name    : SpawnScripts/Antonica/aklicnikwarrior.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.15 04:09:30
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