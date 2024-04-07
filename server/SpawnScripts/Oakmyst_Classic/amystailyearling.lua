--[[
    Script Name    : SpawnScripts/Oakmyst_Classic/amystailyearling.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.09.22 01:09:16
    Script Purpose : 
                   : 
--]]

dofile("SpawnScripts/Generic/CatalogueQuestUpdates.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)

end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end