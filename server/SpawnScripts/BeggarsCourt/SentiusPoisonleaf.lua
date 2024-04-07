--[[
	Script Name		: SpawnScripts/BeggarsCourt/SentiusPoisonleaf.lua
	Script Purpose	: Sentius Poisonleaf
	Script Author	: torsten\\Dorbin
	Script Date		: 2022.07.17
	Script Notes	: 
--]]

require "SpawnScripts/Generic/DialogModule"

local SiricusandtheMilitia = 5663

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
	Dialog.AddDialog("This mead is quite exquisite! It's a good thing I just came into some money. I've seen what Banwyn does to people who don't pay their tab.")
	Dialog.AddVoiceover("voiceover/english/guard_sentius_verus/fprt_hood04/std_sentius_poisonleaf.mp3", 3476707665, 1763780062)
    if GetQuestStep(Spawn, SiricusandtheMilitia) == 1 then
	Dialog.AddOption("Siricus is asking about his Militia application fee.","Dialog2")
    end
	Dialog.AddOption("I don't really care.")
	Dialog.Start()
end

function Dialog2(NPC, Spawn)
    SetStepComplete(Spawn, SiricusandtheMilitia, 1)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Oh... ummm... tell that gimp - er - guy that things like this take time. They - uhh - are seriously considering it but it might take some more money. If it does, I'll come around to get some more. Let him know I'm working on it, okay?")
	PlayFlavor(NPC, "", "", "confused", 0, 0, Spawn, 0)
	Dialog.AddVoiceover("voiceover/english/guard_sentius_verus/fprt_hood04/quests/siricuscalventius/sentius_siricus_x1_initial.mp3", 4034795420, 833256719)
	Dialog.AddOption("I'll let him know...")
	Dialog.Start()
end

