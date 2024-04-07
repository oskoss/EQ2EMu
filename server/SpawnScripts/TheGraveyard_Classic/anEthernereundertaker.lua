--[[
    Script Name    : SpawnScripts/TheGraveyard_Classic/anEthernereundertaker.lua
    Script Author  : Dorbin
    Script Date    : 2023.08.29 12:08:57
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BaseDarkElf1.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	PlayFlavor(NPC, "voiceover/english/voice_emotes/greetings/greetings_2_1052.mp3", "Do not interrupt my work or you may become part of it.", "no", 0, 0, Spawn, 0)
end

function respawn(NPC)
	spawn(NPC)
end