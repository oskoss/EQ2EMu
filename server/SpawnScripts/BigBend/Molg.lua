--[[
	Script Name		: SpawnScripts/BigBend/Molg.lua
	Script Purpose	: Molg
	Script Author	: torsten
	Script Date		: 2022.07.13
	Script Notes	: Auto-Generated Conversation from PacketParser Data
--]]
local Mage1 = 5902

require "SpawnScripts/Generic/DialogModule"

function spawn(NPC)
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
    if GetFactionAmount(Spawn,12) >=0 then
    Dialog1(NPC, Spawn)
    else
    PlayFlavor(NPC,"","","shakefist",0,0,Spawn)
end
end

function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Molg here!  Things for sale!  Buy!  Buy!  Buy!  Things!")
	Dialog.AddVoiceover("voiceover/english/merchant_molg/fprt_hood1/mer_molg.mp3", 3931295597, 1000874360)
	Dialog.AddOption("I must be going.")
	Dialog.AddOption("What kind of things?", "Dialog2")
	if HasQuest(Spawn,Mage1) and GetQuestStepProgress(Spawn,Mage1,6)== 0 then
	Dialog.AddOption("I understand you witnessed a summoning today. What was summoned?", "Dialog3")
	end
	Dialog.Start()
end

function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("All kinds of things!  Big things, little things, shiny things, even dull things!  But not so much the dull things.  Molg also buys things you know.  But Molg is a discriminating shopper.  Buy things!")
	Dialog.AddVoiceover("voiceover/english/merchant_molg/fprt_hood1/mer_molg000.mp3", 3100594732, 343855012)
	Dialog.AddOption("Ok.")
	Dialog.Start()
end

function Dialog3(NPC, Spawn)
    SetStepComplete(Spawn,Mage1,6)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I can't say... there was a bright flash of light when it was summoned.  I was blinded.  I do know I felt a large sheet of leather smack me in the face.  I think the mage was summoning something requiring leather. This is what I saw.")
	Dialog.AddVoiceover("voiceover/english/merchant_molg/fprt_hood1/mer_molg001.mp3", 3794527944, 1139225489)
	PlayFlavor(NPC,"","","confused",0,0,Spawn)
	Dialog.AddOption("You think he summoned a sheet of leather... thank you.")
	Dialog.Start()
end

