--[[
    Script Name    : SpawnScripts/Commonlands/aDervishgobetween.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.04 07:01:20
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    human(NPC)
    Beggar(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end