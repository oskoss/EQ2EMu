--[[
    Script Name    : SpawnScripts/Antonica/anearthcrawler.lua
    Script Author  : Dorbin
    Script Date    : 2023.05.15 12:05:12
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    SetSpawnAnimation(NPC, 13016)
end

function respawn(NPC)
	spawn(NPC)
end