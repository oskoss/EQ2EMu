--[[
    Script Name    : SpawnScripts/Antonica/NoaSails.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.17 02:09:08
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
    Dialog2(NPC, Spawn)
 end


function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Oh, then you want to speak with Rusty.")
	Dialog.AddVoiceover("voiceover/english/optional1/noa_sails/antonica/noasails002.mp3", 2706720397, 3494092819)
	Dialog.AddOption("Thanks.")
	Dialog.Start()
end

function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Keep your distance, friend. We have important cargo here. Step any closer and I'll have to pummel you ... and you don't want me to leave you stranded out here, do ya?")
	Dialog.AddVoiceover("voiceover/english/optional1/noa_sails/antonica/noasails001.mp3", 2484455293, 304406635)
    PlayFlavor(NPC,"","","glare",0,0,Spawn)
	Dialog.AddOption("Yes, I know.  Captain Abella Coranis sent me.", "Dialog1")
	Dialog.Start()
end

