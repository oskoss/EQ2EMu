--[[
	Script Name		: SpawnScripts/ScaleYard/SavasDranak.lua
	Script Purpose	: Savas Dranak
	Script Author	: torsten/Dorbin
	Script Date		: 2022.07.25
	Script Notes	: Auto-Generated Conversation from PacketParser Data
--]]

require "SpawnScripts/Generic/DialogModule"
local Fighter = 5898

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
	Dialog.AddDialog("It is a shame this one didn't do what he was told.  He was my favorite thrall too.")
	Dialog.AddVoiceover("voiceover/english/savas_dranak/fprt_hood06/savasdranak000.mp3", 312427882, 4132285907)
	if HasQuest(Spawn,Fighter) and GetQuestStep(Spawn,Fighter)>=7 and  GetQuestStep(Spawn,Fighter)<=97  and GetQuestStepProgress(Spawn,Fighter,8)==0 then
	Dialog.AddOption("By orders of Overlord Lucan, you are to ensure that no Guttersnipe tries to take up residence in Scale Yard.","Dialog2")
	end
	Dialog.AddOption("I don't want to see how you treat your least favorite.  ")
	Dialog.Start()
end

function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I do not listen to orders from silly little messengers.")
    PlayFlavor(NPC, "", "", "sniff", 0, 0, Spawn)
	Dialog.AddVoiceover("voiceover/english/savas_dranak/fprt_hood06/savasdranak001.mp3", 1404750927, 2071684844)
	Dialog.AddOption("Does the Militia need to help you understand this message?","Dialog3")
	Dialog.Start()
end

function Dialog3(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Ha!  Who do you think you are, runt?  Do you know whom you're talking to?  I rule this district!  I own everyone here!")
    PlayFlavor(NPC, "", "", "chuckle", 0, 0, Spawn)
	Dialog.AddVoiceover("voiceover/english/savas_dranak/fprt_hood06/savasdranak002.mp3", 503647552, 1623345428)
	Dialog.AddOption("The Overlord will not tolerate anyone stealing his things. Refugees included. Perhaps a cell is in your future?","Dialog3a")
	Dialog.Start()
end

function Dialog3a(NPC, Spawn)
	FaceTarget(Spawn, NPC)
    PlayFlavor(Spawn, "", "", "shakefist", 0, 0, NPC)
    AddTimer(NPC,800,"Dialog4",1,Spawn)
end

function Dialog4(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	SetStepComplete(Spawn,Fighter,8)
	Dialog.AddDialog("I shall do as the Overlord demands only because it pleases me to do so.  Now leave my district. You're not welcome here.")
    PlayFlavor(NPC, "", "", "glare", 0, 0, Spawn)
	Dialog.AddVoiceover("voiceover/english/savas_dranak/fprt_hood06/savasdranak003.mp3", 1045929350, 3685896097)
	if GetRace(Spawn) == 0 or GetRace(Spawn) == 18 or GetRace(Spawn) == 10 then
	Dialog.AddOption("This district is as much yours as it is mine, 'friend'.")
	end
	Dialog.AddOption("The Overlord will be pleased to hear it.")
	Dialog.Start()
end

