--[[
    Script Name    : SpawnScripts/Oakmyst_Classic/anOakmystfairyDif7.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.10.19 05:10:25
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BaseFairy1.lua")
dofile("SpawnScripts/Generic/CatalogueQuestUpdates.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovementFlight(NPC, Spawn, 5, -5, 2, -2, 2, 8, 15)
end



function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end