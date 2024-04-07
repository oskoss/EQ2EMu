--[[
    Script Name    : SpawnScripts/Antonica/SentrySmythe.lua
    Script Author  : Dorbin
    Script Date    : 2023.05.10 08:05:16
    Script Purpose : 
                   : 
--]]

dofile("SpawnScripts/Generic/MonsterCallouts/BaseHuman1.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	PlayFlavor(NPC,"voiceover/english/voice_emotes/greetings/greetings_1_1034.mp3","","agree",0,0,Spawn)
end

function respawn(NPC)
	spawn(NPC)
end