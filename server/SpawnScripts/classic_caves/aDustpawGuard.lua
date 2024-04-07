--[[
    Script Name    : SpawnScripts/classic_caves/aDustpawGuard.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.11 01:09:04
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/CatalogueQuestUpdates.lua")
dofile("SpawnScripts/Generic/MonsterCallouts/BaseGnoll1.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)

end


function respawn(NPC)
	spawn(NPC)
end