--[[
    Script Name    : SpawnScripts/EastFreeport/BarriusIacomus.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.08 01:10:10
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
	Dialog.AddDialog("Ahoy!  Welcome to the Seafarer's Roost.  Name's Barrius, but all these scallywags just call me Bar.  Be sure to mind your manners.  I don't want any more trouble!")
	Dialog.AddVoiceover("voiceover/english/barrius_iacomus/fprt_east/mer_barrius_iacomus.mp3", 1480714381, 1891140502)
	Dialog.AddOption("I am not thirsty.  Thank you anyways.")
	Dialog.AddOption("What kind of trouble?", "Dialog2")
	Dialog.Start()
end

function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("One drink too many, one word misspoken, one chair accidentally broken over someone's head and before you know it, we have the Militia in here keeping the peace.  Dead drunks don't pay their tabs!")
	Dialog.AddVoiceover("voiceover/english/barrius_iacomus/fprt_east/mer_barrius_iacomus000.mp3", 2301022032, 1978382838)
	Dialog.AddOption("Okay.")
	Dialog.Start()
end

