--[[
    Script Name    : SpawnScripts/EastFreeport/BrucciusCapito.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.11 02:10:07
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
	Dialog.AddDialog("Helloo there!  Can you feel it?  The wind is changing direction....")
	Dialog.AddVoiceover("voiceover/english/optional1/bruccius_capito/fprt_east/qst_brucciuscapito.mp3", 2213419422, 824549942)
	Dialog.AddOption("I must meet someone soon and must be going.  Good day.")
	Dialog.Start()
end