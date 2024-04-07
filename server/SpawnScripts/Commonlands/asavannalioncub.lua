--[[
    Script Name    : SpawnScripts/Commonlands/asavannalioncub.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.02.11 06:02:14
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