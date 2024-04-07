--[[
    Script Name    : SpawnScripts/Antonica/aSabertoothbattlerHeroic.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.01.31 07:01:46
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