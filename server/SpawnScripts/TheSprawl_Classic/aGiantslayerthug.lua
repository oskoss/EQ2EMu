--[[
    Script Name    : SpawnScripts/TheSprawl_Classic/aGiantslayerthug.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.11.08 08:11:14
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"
dofile("SpawnScripts/Generic/MonsterCallouts/Giantslayer.lua")

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    barbarian(NPC)
    IdleAggressive(NPC)
end


function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end


function respawn(NPC)
	spawn(NPC)
end