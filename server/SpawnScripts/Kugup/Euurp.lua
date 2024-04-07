--[[
	Script Name		: SpawnScripts/TheLostVillageofKugup/Euurp.lua
	Script Purpose	: Euurp
	Script Author	: neatz09
	Script Date		: 2023.04.18
	Script Notes	: Auto-Generated Conversation from PacketParser Data
--]]

require "SpawnScripts/Generic/DialogModule"

function spawn(NPC)
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
	RandomGreeting(NPC, Spawn)
end

function RandomGreeting(NPC, Spawn)
	local choice = MakeRandomInt(1,3)

	if choice == 1 then
		PlayFlavor(NPC, "", "It seems like you're already working on something else. Come see me again when you're finished!", "", 0, 0, Spawn, 0)
	elseif choice == 2 then
		PlayFlavor(NPC, "", "I hope you remember your lessons!", "", 0, 0, Spawn, 0)
	elseif choice == 3 then
		PlayVoice(NPC, "voiceover/english/voice_emotes/greetings/greetings_1_1059.mp3", 0, 0, Spawn)
	end
end

function Dialog3(NPC, Spawn)
	--Int 1
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Hello, friend. I am Euurp, the school teacher. We may be a small village, but we do have some youngsters and there's just so much to teach them!")
	Dialog.AddVoiceover("voiceover/english/voice_emotes/greetings/greetings_1_1059.mp3", 0, 0)
	Dialog.AddOption("What do you teach?", "Dialog11")
	Dialog.AddOption("That's interesting, but I must be going.")
	Dialog.Start()
end

function Dialog11(NPC, Spawn)
	--Int 2
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Well, everything we can! Mathematics, arcane science, alchemy, even combat when they get a bit older than these children. But, one of the most important lessons is history.")
	Dialog.AddOption("What's so interesting about history?", "Dialog14")
	Dialog.AddOption("Hmm, school was boring enough the first time.")
	Dialog.Start()
end

function Dialog14(NPC, Spawn)
	--Int 3
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("History is why we are where we are. If we don't learn from history, we will surely repeat the mistakes of the past. The Froglok people have a long and fascinating history. Would you like to learn it?")
	Dialog.AddOption("Sure, I'd like to learn the Froglok History.", "Dialog18")
	Dialog.AddOption("No thanks, I don't have the time right now.")
	Dialog.Start()
end

function Dialog18(NPC, Spawn)
	--Int 4 and Quest Accept
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("That's great news. Here, take this tome and read it. When you are done, come back and we'll see what you've learned.")
	Dialog.AddOption("Thanks. I'll be back as soon as I'm done!")
	Dialog.Start()
end

function Dialog5(NPC, Spawn)
	--Pretest
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I see you have read the book... Do you feel like you've studied well?")
	Dialog.AddVoiceover("voiceover/english/voice_emotes/greetings/greetings_1_1059.mp3", 0, 0)
	Dialog.AddOption("I read it carefully.", "Dialog10")
	Dialog.AddOption("Uh, maybe I should re-read it.")
	Dialog.Start()
end

function Dialog10(NPC, Spawn)
	--Pretest Pt2
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Good to hear, are you ready for the first question?")
	Dialog.AddOption("I am ready.", "Dialog4")
	Dialog.AddOption("Not quite yet")
	Dialog.Start()
end

function Dialog20(NPC, Spawn)
	--First answer correct
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Outstanding answer. Are you ready for the next question?")
	Dialog.AddOption("I am ready.", "Dialog9")
	Dialog.AddOption("Not quite yet.")
	Dialog.Start()
end

function Dialog2(NPC, Spawn)
	--Second Question Correct
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Again, excellent. Are you ready for the final question?")
	Dialog.AddOption("I am ready.", "Dialog15")
	Dialog.AddOption("Not quite yet.")
	Dialog.Start()
end

function Dialog1(NPC, Spawn)
	--Completion
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Absolutely correct! You are a quick study for one so old. You have learned our history well, and I am proud to be your teacher.")
	Dialog.AddOption("Thank you for teaching me.")
	Dialog.Start()
end

function Dialog7(NPC, Spawn)
	--Failure
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Hmm, I believe you should review the text some more.")
	Dialog.AddVoiceover("voiceover/english/voice_emotes/greetings/greetings_2_1059.mp3", 0, 0)
	Dialog.AddOption("I will review the text.")
	Dialog.Start()
end

function Dialog4(NPC, Spawn)
	--Question: What did we rename Grobb to after the defeat of the Trolls? Answer: Gukta.
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("What did we rename Grobb to after the defeat of the Trolls?")
	Dialog.AddOption("New Guk", "Dialog7")
	Dialog.AddOption("Frooaka", "Dialog7")
	Dialog.AddOption("Gukta", "Dialog20") --Correct
	Dialog.AddOption("I don't know.", "Dialog7")
	Dialog.Start()
end

function Dialog6(NPC, Spawn)
	--Question: What would we frogloks rather die than do? Answer: Utilize deception.
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("What would we Frogloks rather die than do?")
	Dialog.AddOption("Fail in battle", "Dialog7")
	Dialog.AddOption("Harm another living being", "Dialog7")
	Dialog.AddOption("Utilize deception", "Dialog20") --Correct
	Dialog.AddOption("I don't know.", "Dialog7")
	Dialog.Start()
end

function Dialog9(NPC, Spawn)
	--Question: What did we carry into the depths of Gukta to protect our kind? Answer: Froglok eggs.
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("What did we carry into the depths of Gukta to protect our kind?")
	Dialog.AddOption("Froglok Eggs", "Dialog2") --Correct
	Dialog.AddOption("Bug stew", "Dialog7")
	Dialog.AddOption("The King", "Dialog7")
	Dialog.AddOption("I don't know.", "Dialog7")
	Dialog.Start()
end

function Dialog12(NPC, Spawn)
	--Question: What army brought about our ruin? Answer: Rallos Zek.
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Whose army brought the Froglok people to the brink of extinction?")
	Dialog.AddOption("Rallos Zek") --Correct
	Dialog.AddOption("Cazic-Thule", "Dialog7")
	Dialog.AddOption("Bristlebane", "Dialog7")
	Dialog.AddOption("I don't know.", "Dialog7")
	Dialog.Start()
end

function Dialog15(NPC, Spawn)
	--Question: Whose punishment was swift and severe? Answer: The Gods'.
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Whose punishment was swift and severe?")
	Dialog.AddOption("The Tae'Ew", "Dialog7")
	Dialog.AddOption("The Ogres'", "Dialog7")
	Dialog.AddOption("The Gods'", "Dialog1") --Correct
	Dialog.AddOption("I don't know.", "Dialog7")
	Dialog.Start()
end

   --[[ Question: Frogloks believe everyone must abide by the... Answer: Laws of the land.
    Question: Who took us prisoner in the Feerrott? Answer: The Tae'Ew.
    Question: What did we do to disappoint the Gods? Answer: Failed to stand our ground.
    Question: What did the ogres fight without? Answer: Honor.
    Question: Which race did we defeat in Grobb? Answer: Trolls.
    Question: Where did we hide when the end was near? Answer: Deep beneath the marshes.  
    Question: What would have been far kinder than our current fate? Answer: Oblivion.
    Question: What god watched over the froglok people for generations? Answer: Mithaniel Marr.
    Question: What scattered those who survived the Rallosian onslaught? Answer: The Rending.
    Question: Who did our emissaries first contact for assistance? Answer: The Overlord of Freeport. ]]--
    