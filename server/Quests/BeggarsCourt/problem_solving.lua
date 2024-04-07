--[[
	Script Name		:	problem_solving.lua
	Script Purpose	:	Handles the quest, "Problem Solving"
	Script Author	:	torsten\\Dorbin
	Script Date		:	17.07.2022
	Script Notes	:	

	Zone			:	The Sprawl
	Quest Giver		:	Crispin Luvinius
	Preceded by		:	None
	Followed by		:	Advanced Problem Solving
--]]

require "SpawnScripts/Generic/DialogModule"

function Init(Quest)
	AddQuestStepKill(Quest, 1, "Kill vagrant squatters", 10, 100, "I need to send a message to the vagrant squatters in the Ruins.  The message will involve a lot of them breathing dirt.  I can reach the Ruins by using any of the bells in and around the City of Freeport.", 611, 8420023,8420066)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
    UpdateQuestZone(Quest,"Ruins")	
        
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I've dealt with the vagrants.")
	UpdateQuestTaskGroupDescription(Quest, 1, "Those vagrants got the message loud and clear.")
    UpdateQuestZone(Quest,"Beggar's Court")	
	AddQuestStepChat(Quest, 2, "Talk with Crispin", 1, "I should let Crispin in Beggar's Court know that his problem has been solved.  I should get paid, too.", 11, 1370126)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 2, "I've spoken with Crispin.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I've let Crispin know that I've solved his problem.")

	UpdateQuestDescription(Quest, "I've taken care of Crispin's problem. It shouldn't be long before his business partner decides to step in line.")
	GiveQuestReward(Quest, Player)
end

function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("Okay, here's the deal. The guy is a vagrant who lives out in the ruins, right?  We want to send the message that no one messes with us. You need to head south of here and do some dirty work to his buddies, understand?")
	Dialog.AddVoiceover("voiceover/english/crispin_luvinius/fprt_hood04/quests/crispinluvinius/crispin_x1_accept.mp3", 121176241, 3802962144)
	PlayFlavor(QuestGiver, "", "", "sniff", 0, 0, Player, 0)
	Dialog.AddOption("Sounds like an easy job.", "Dialog3")
	Dialog.Start()
end

function Declined(Quest, QuestGiver, Player)
	-- Add dialog here for when the quest is declined
end

function Deleted(Quest, QuestGiver, Player)
	-- Remove any quest specific items here when the quest is deleted
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		Step1Complete(Quest, QuestGiver, Player)
	elseif Step == 2 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end

