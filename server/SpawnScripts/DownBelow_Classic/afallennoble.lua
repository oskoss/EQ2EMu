--[[
    Script Name    : SpawnScripts/DownBelow_Classic/afallennoble.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.09.22 02:09:26
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