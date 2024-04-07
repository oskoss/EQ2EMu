--[[
    Script Name    : SpawnScripts/Oakmyst_Classic/aStaticBadgerl.lua
    Script Author  : Dorbin
    Script Date    : 2022.10.21 01:10:23
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