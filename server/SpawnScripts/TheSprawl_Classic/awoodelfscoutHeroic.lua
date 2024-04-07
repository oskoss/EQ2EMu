--[[
    Script Name    : SpawnScripts/TheSprawl_Classic/awoodelfscoutHeroic.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.11.23 05:11:26
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    woodelf(NPC)
    SpawnSet(NPC, "heroic", 1)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end