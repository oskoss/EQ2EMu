--[[
    Script Name    : SpawnScripts/TheGraveyard_Classic/anEthernerecaretaker.lua
    Script Author  : Dorbin
    Script Date    : 2023.08.29 12:08:02
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
	PlayFlavor(NPC, "voiceover/english/voice_emotes/greetings/greetings_2_1047.mp3", "Be gone! I have work to do.", "glare", 0, 0, Spawn, 0)
end

function respawn(NPC)
	spawn(NPC)
end