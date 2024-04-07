--[[
    Script Name    : SpawnScripts/TheGraveyard_Classic/adisturbedsoul.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.10.02 01:10:32
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