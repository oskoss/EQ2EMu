--[[
	Script Name	: SpawnScripts/Generic/random_pattern_small_short_delay.lua
	Script Purpose	: chooses a random route of a particular pattern
	Script Author	: theFoof with delay modifications by LordPazuzu
	Script Date	: 2013.5.16
	Script Notes	: If the coords are out of bounds then the spawn will still go there.
--]]
dofile("SpawnScripts/Generic/CatalogueQuestUpdates.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 8, -8, 2, 8, 15)
end
function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end