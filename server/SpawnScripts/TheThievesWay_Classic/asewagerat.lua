--[[
    Script Name    : SpawnScripts/TheThievesWay_Classic/asewagerat.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.12.02 04:12:26
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