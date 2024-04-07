--[[
    Script Name    : SpawnScripts/Antonica/aSabertoothtormentor.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.01.22 05:01:13
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/SabertoothGnoll3.lua")
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