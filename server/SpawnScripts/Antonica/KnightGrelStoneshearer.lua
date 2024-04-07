--[[
    Script Name    : SpawnScripts/Antonica/KnightGrelStoneshearer.lua
    Script Author  : Premierio015
    Script Date    : 2022.05.09 12:05:20
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
	Dialog.AddDialog("And who might you be?")
	Dialog.AddVoiceover("voiceover/english/knight_grel_stoneshearer/antonica/quests/firemyst/grel_stoneshearer000.mp3", 3381463190, 2283836874)
	if GetQuestStepProgress(Spawn, LordGrimrotsScythe,1) == 0 and HasQuest(Spawn,LordGrimrotsScythe) then
	Dialog.AddOption( "Ignar Steadirt sent me.", "Option1")
	end
	Dialog.AddOption("Just passing through, sorry to interrupt you.")
	Dialog.Start()
end

function Option1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Ignar?  Oh, I'll bet he's waiting on a report!  Poor fellow, he can't hear with one ear, you know. That's why he's been assigned duty out of harm's way.")
	Dialog.AddVoiceover("voiceover/english/knight_grel_stoneshearer/antonica/quests/firemyst/grel_stoneshearer001.mp3", 1129984683, 980692304)
	Dialog.AddOption("Do you have your report?  Ignar asked me to pick them up.", "Option2")
	Dialog.Start()
end

function Option2(NPC, Spawn)
    SetStepComplete(Spawn, LordGrimrotsScythe, 1)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Yes, here it is.  The word is, something peculiar's going on ... apparently, there's a group of gnolls--the little wretches--that are trying to conjure up an undead invasion.  I'm not sure what they're using, but the activity of the undead has increased. I will send word to Ignar without delay should I learn more.")
	Dialog.AddVoiceover("voiceover/english/knight_grel_stoneshearer/antonica/quests/firemyst/grel_stoneshearer002.mp3", 1531924790, 1319128858)
    PlayFlavor(NPC, "", "", "nod", 0, 0, Spawn)
	Dialog.AddOption("I'll let Ignar know.")
	Dialog.Start()
end

function respawn(NPC)
	spawn(NPC)
end

