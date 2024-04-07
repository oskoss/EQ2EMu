--[[
    Script Name    : SpawnScripts/EastFreeport/Javvy.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.11 05:10:56
    Script Purpose : 
                   : 
--]]

require "SpawnScripts/Generic/DialogModule"

function spawn(NPC)
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
Dialog1(NPC, Spawn)
end

function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Shove off! Not interested in company. Leave me to my grog. ")
	Dialog.AddVoiceover("voiceover/english/voice_emotes/greetings/greetings_1_1048.mp3", 0, 0)
	Dialog.AddOption("Whatever...")
	Dialog.Start()
end