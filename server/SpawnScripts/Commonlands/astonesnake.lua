--[[
    Script Name    : SpawnScripts/Commonlands/astonesnake.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.02.19 02:02:01
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