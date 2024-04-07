--[[
    Script Name    : SpawnScripts/ADecrepitCrypt/acaravantrafficker.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.02.12 05:02:15
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