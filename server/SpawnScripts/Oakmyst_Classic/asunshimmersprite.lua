--[[
    Script Name    : SpawnScripts/Oakmyst_Classic/asunshimmersprite.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.10 03:09:27
    Script Purpose : 
                   : 
--]]

dofile("SpawnScripts/Generic/CatalogueQuestUpdates.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    
end

function hailed(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

