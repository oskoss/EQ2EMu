--[[
    Script Name    : SpawnScripts/Peatbog_Classic/abogfaerie.lua
    Script Author  : Dorbin
    Script Date    : 2022.11.05 03:11:57
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/Fairy_PeatBog.lua")
dofile("SpawnScripts/Generic/CatalogueQuestUpdates.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
end

function respawn(NPC, Spawn)
    spawn()
end
