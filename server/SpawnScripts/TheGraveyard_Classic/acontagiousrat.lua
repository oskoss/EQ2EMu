--[[
    Script Name    : SpawnScripts/TheGraveyard_Classic/acontagiousrat.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.08.19 09:08:24
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