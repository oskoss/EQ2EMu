--[[
	Script Name	: SpawnScripts/ScaleYard/SkalVethiz.lua
	Script Purpose	: Skal Vethiz 
	Script Author	: John Adams
	Script Date	: 2008.10.01
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
    if GetFactionAmount(Spawn,12) >0 then
    Dialog1(NPC, Spawn)
    else
    PlayFlavor(NPC,"","","cutthroat",0,0,Spawn)
    end
end


--		PlayFlavor(NPC, "", "What have we iksar become? We live next to barbarians and accept it? We once had a great Empire.", "pout", 0, 0, Spawn, 0)

function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("What have we iksar become? We live next to barbarians and accept it? We once had a great Empire.")
	Dialog.AddVoiceover("voiceover/english/skal_vethiz/fprt_hood06/qst_skalvethiz.mp3", 632016145, 49250829)
	Dialog.AddOption("I don't really care. Bye.")
	Dialog.AddOption("What empire?", "Dialog2")
	if HasQuest(Spawn,Mage1) and GetQuestStepProgress(Spawn,Mage1,8)== 0 then
	Dialog.AddOption("I understand you witnessed a summoning today. What was summoned?", "Dialog3")
	end
	Dialog.Start()
end

function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("What? You know nothing of the greatest empire to dominate the face of Norrath?!  We conquered the continent of Kunark!  Kingdoms on Antonica and Faydwer trembled at the mere whisper of the iksar name.   Before the Shattering, the Iksarian Empire held the entire world in its grasp! Now look at us. We're reduced to squatting in the corner of some human city.")
	Dialog.AddVoiceover("voiceover/english/skal_vethiz/fprt_hood06/qst_skalvethiz000.mp3", 4224301835, 4229334233)
	Dialog.AddOption("Sorry to hear it.")
	Dialog.Start()
end

function Dialog3(NPC, Spawn)
    SetStepComplete(Spawn,Mage1,8)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I couldn't see anything because of the blinding light, but I could feel it. That crazy mage summoned a huge snake. I barely made it out of there with my life, I did. One moment I was wondering who turned off the sun, then I felt a snake wrap around my neck.")
	Dialog.AddVoiceover("voiceover/english/skal_vethiz/fprt_hood06/qst_skalvethiz001.mp3", 3405726897, 4260366325)
    PlayFlavor(NPC,"","","confused",0,0,Spawn)
	Dialog.AddOption("He summoned a snake... thank you.")
	Dialog.Start()
end

