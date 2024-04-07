--[[
    Script Name    : SpawnScripts/ForestRuins_Classic/atatteredspellbook.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.09.22 01:09:27
    Script Purpose : 
                   : 
--]]
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