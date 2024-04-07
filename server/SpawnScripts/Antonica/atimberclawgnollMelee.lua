--[[
    Script Name    : SpawnScripts/Antonica/atimberclawgnollMelee.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.07.09 01:07:19
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