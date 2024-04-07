--[[
	Script Name		:	advanced_problem_solving.lua
	Script Purpose	:	Handles the quest, "Advanced Problem Solving"
	Script Author	:	torsten\\Dorbin
	Script Date		:	17.07.2022
	Script Notes	:	

	Zone			:	The Sprawl
	Quest Giver		:	Crispin Luvinius
	Preceded by		:	Problem Solving
	Followed by		:	None
--]]
require "SpawnScripts/Generic/DialogModule"


function Init(Quest)
	AddQuestStepKill(Quest, 1, "Defeat Giantslayer bashers", 5, 100, "I've heard that Giantslayer bashers hang out in the Sprawl.  I should pay them a little visit.  I can reach the Sprawl by using any of the bells in and around the City of Freeport.", 611, 8400027)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
    UpdateQuestZone(Quest,"The Sprawl")	
end

function Accepted(Quest, QuestGiver, Player)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("That's what I like to hear!  Remember that dirty vagrant you delivered the message to?  Rumor has it he's hiding among rogues and scoundrels from the other districts -- a gang called the Giantslayers.  And his ... brethren ... have gotten their feathers all ruffled and are planning to come here to ... pay court ... if you understand me.  They want to send a message to their leader. Now, I enjoy a good tussle as much as anyone, of course, but, uh ... we don't want to rob you of an opportunity to prove your fighting skills. So, why don't you go to the Giantslayers and tan their mangy hides for us?")
	Dialog.AddVoiceover("voiceover/english/crispin_luvinius/fprt_hood04/quests/crispinluvinius/crispin_x2_accept.mp3", 4053471999, 555717236)
	PlayFlavor(NPC, "", "", "agree", 0, 0, Spawn, 0)
	Dialog.AddOption("Don't worry... I'll handle it.", "Dialog6")
	Dialog.Start()
end

function Declined(Quest, QuestGiver, Player)
	-- Add dialog here for when the quest is declined
end

function Deleted(Quest, QuestGiver, Player)
	-- Remove any quest specific items here when the quest is deleted
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I've beat down five Giantslayer thugs")
	UpdateQuestTaskGroupDescription(Quest, 1, "I've sent the Giantslayers a message that they shouldn't listen to vagrants who tell tall tales.")
    UpdateQuestZone(Quest,"Beggar's Court")	

	AddQuestStepChat(Quest, 2, "Talk with Crispin", 1, "I should let Crispin in the Beggar's Court know that he and his gang have nothing to worry about.  I can reach the Sprawl by using any of the bells in and around the City of Freeport.", 11, 1370126)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 2, "I've spoken with Crispin")
	UpdateQuestTaskGroupDescription(Quest, 2, "I've let Crispin know these guys won't be bothering them anymore.")

	UpdateQuestDescription(Quest, "I've taken care of Crispin's problem. It seems that the guy isn't as tough as he acts.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		Step1Complete(Quest, QuestGiver, Player)
	elseif Step == 2 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end

