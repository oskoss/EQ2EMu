--[[
    Script Name    : SpawnScripts/Antonica/ashadowedservitor.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.04.05 04:04:31
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