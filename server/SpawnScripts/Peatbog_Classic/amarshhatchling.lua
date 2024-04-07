--[[
    Script Name    : SpawnScripts/Peatbog_Classic/amarshhatchling.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.11 02:09:24
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/random_pattern_small_med_delay.lua")
dofile("SpawnScripts/Generic/CatalogueQuestUpdates.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end