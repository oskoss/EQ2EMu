--[[
    Script Name    : SpawnScripts/TheSprawl_Classic/aGiantslayerbrute.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.11.08 08:11:58
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"
dofile("SpawnScripts/Generic/MonsterCallouts/Giantslayer.lua")

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    troll(NPC)
    IdleAggressive(NPC)
end


function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end


function respawn(NPC)
	spawn(NPC)
end