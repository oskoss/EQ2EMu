--[[
    Script Name    : SpawnScripts/Antonica/aSabertoothsentinel.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.04.03 11:04:16
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