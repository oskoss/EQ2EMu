--[[
    Script Name    : SpawnScripts/DownBelow_Classic/adustcrawlerhatchling.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.11.10 07:11:35
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