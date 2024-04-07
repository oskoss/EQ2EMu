--[[
    Script Name    : SpawnScripts/Antonica/aSabertoothbattler.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.01.22 03:01:11
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    IdleAggressive(NPC)
    RandomWeapons(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end