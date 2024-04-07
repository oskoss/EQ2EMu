--[[
    Script Name    : SpawnScripts/Antonica/KnightGreldaStoneshearer.lua
    Script Author  : Premierio015
    Script Date    : 2022.05.09 01:05:28
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/DialogModule"

local LordGrimrotsScythe = 5522

function spawn(NPC)

end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Stop right where you are, or I'll slit your throat, stranger!")
	Dialog.AddVoiceover("voiceover/english/knight_grelda_stoneshearer/antonica/quests/firemyst/grelda_stoneshearer000.mp3", 2872853431, 2142483830)
	PlayFlavor(NPC, "", "", "threaten", 0, 0, Spawn)
	if GetQuestStepProgress(Spawn, LordGrimrotsScythe,2) == 0 and HasQuest(Spawn,LordGrimrotsScythe) then
	Dialog.AddOption("Uh...Ignar Steadirt sent me.", "Option1")
	end
	Dialog.AddOption("Back off and I'll go easy on you.")
	Dialog.Start()
end

function Option1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Oh.  If Ignar sent you, then I can't kill you.  Pity.  Well, what did that old goat send you all the way out here for, eh?  He's not going to try swappin' assignments with me again, is he?  He's a good dwarf, good strategist ... shame about his hearing, though.  So, what is it?  Speak up!")
	Dialog.AddVoiceover("voiceover/english/knight_grelda_stoneshearer/antonica/quests/firemyst/grelda_stoneshearer001.mp3", 1637699836, 8526247)
	Dialog.AddOption("Sorry to bother, but he's asking for his reports.", "Option2")
	Dialog.Start()
end


function Option2(NPC, Spawn)
    SetStepComplete(Spawn, LordGrimrotsScythe, 2)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Did you know those Sabertooth gnolls dug up a relic of ancient power?  Well, that's what they say anyhow.  I don't believe a word of it.  They're trying to scare off their competition by claiming it's a relic of Lord Grimrot himself!  Can you imagine?  What little fools they are, eh?  That's all I have to report.")
	Dialog.AddVoiceover("voiceover/english/knight_grelda_stoneshearer/antonica/quests/firemyst/grelda_stoneshearer002.mp3", 955376682, 564992177)
	PlayFlavor(NPC, "", "", "sniff", 0, 0, Spawn)
	Dialog.AddOption("I'll let Ignar know.")
	Dialog.Start()
end

function respawn(NPC)
	spawn(NPC)
end