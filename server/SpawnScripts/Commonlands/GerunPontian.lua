--[[
        Script Name: SpawnScripts/Commonlands/GerunPontian.lua
        Script Purpose: Gerun Pontian
        Script Author: vo1d
        Script Date: 10/8/2019
        Script Notes: n/a
--]]

require "SpawnScripts/Generic/DialogModule"

local SpeckledRattlerVenom = 375

function spawn(NPC)
	spawn(NPC)
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)

	if HasCompletedQuest(Spawn, SpeckledRattlerVenom) == false and HasQuest(Spawn, SpeckledRattlerVenom) == false then
		Dialog.AddDialog("Gerun Pontian of the Militia. I watch the gates. I assure you a more dreary job does not exist in all of D'Lere.")
		Dialog.AddVoiceover("voiceover/english/voice_emotes/greetings/greetings_3_1022.mp3", 0, 0)
		Dialog.AddOption("What makes it so dreary?", "dlg_2")
		Dialog.AddOption("I have to go.")
		Dialog.Start()
	elseif GetQuestStep(Spawn, SpeckledRattlerVenom) == 1 then
		Dialog.New(NPC, Spawn)
		Dialog.AddDialog("Did you get the venom?")
		Dialog.AddOption("Not yet.")
		Dialog.Start()
	elseif GetQuestStep(Spawn, SpeckledRattlerVenom) == 2 then
		Dialog.New(NPC, Spawn)
		Dialog.AddDialog("Did you get the venom?")
		Dialog.AddOption("Yes, here it is.", "CompleteSpeckledRattlerVenom")
		Dialog.Start()
	elseif HasCompletedQuest(Spawn, SpeckledRattlerVenom) == true then
		Dialog.AddVoiceover("voiceover/english/voice_emotes/greetings/greetings_3_1022.mp3", 0, 0)
	end
end

function dlg_2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)

	Dialog.AddDialog("Who attacks the gates of Freeport? Orcs? Dervish Cutthroats? Qeynosians? Hah! The only good thing about this post is it gives me a lot of time. And even the most daft of fools knows that time equals money.")
	Dialog.AddVoiceover("", "", 0)
	Dialog.AddOption("How does this post turn profit?", "dlg_3")

	Dialog.Start()
end

function dlg_3(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)

	Dialog.AddDialog("Like I said, I've got free time. So while I'm out here I can acquire commodities that I can then sell to the merchants of Freeport. If I can't be out there earning glory, I'll stay back here and earn coin. Care to help?")
	Dialog.AddOption("What do you need?", "dlg_4")
	Dialog.AddOption("No thanks.")

	Dialog.Start()
end

function dlg_4(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)

	Dialog.AddDialog("Venom has been selling quite nicely. There are quite a few speckled rattlers around here. They're a great source of venom. If you bring me back the venom from eight of them I'll give you a portion of what the profit will be. Sound good?")
	Dialog.AddOption("Sure.", "OfferSpeckledRattlerVenom")
	Dialog.Start()
end

function dlg_5(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)

	Dialog.AddDialog("Great! I'll be here, of course.")
	Dialog.AddVoiceover("", "", 0)
	Dialog.AddOption("I'll be back.")

	Dialog.Start()
end

function OfferSpeckledRattlerVenom(NPC, Spawn)
	OfferQuest(NPC, Spawn, SpeckledRattlerVenom)
end

function CompleteSpeckledRattlerVenom(NPC, Spawn)
	SetStepComplete(Spawn, SpeckledRattlerVenom, 2)
        PlaySound(NPC, "sounds/ui/gui_quest_complete.wav", GetX(Spawn), GetY(Spawn), GetZ(Spawn), Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)

	Dialog.AddDialog("Good work. You've made us both quite a bit of coin. Thanks for the help. I'm sorry that my tasks have been so dull, it's hard to pull the important missions when you're a lowly gate patrol. I do have something a bit more exciting if you're interested.")

	Dialog.AddOption("What is it?")
	Dialog.AddOption("No thanks.")
	Dialog.Start()
end