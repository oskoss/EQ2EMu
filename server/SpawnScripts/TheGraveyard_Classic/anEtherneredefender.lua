--[[
    Script Name    : SpawnScripts/TheGraveyard_Classic/anEtherneredefender.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.08.17 08:08:45
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