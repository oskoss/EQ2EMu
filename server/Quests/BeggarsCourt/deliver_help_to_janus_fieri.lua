--[[
	Script Name		:	deliver_help_to_janus_fieri.lua
	Script Purpose	:	Handles the quest, "Deliver Help to Janus Fieri"
	Script Author	:	torsten\\Dorbin
	Script Date		:	16.07.2022
	Script Notes	:	

	Zone			:	Beggar's Court
	Quest Giver		:	Marcus Cantarius
	Preceded by		:	Marcus Cantarius's Monumental Hatred -- Not required
	Followed by		:	None
--]]

require "SpawnScripts/Generic/DialogModule"

function Init(Quest)
	AddQuestStepChat(Quest, 1, "Deliver note to Janus Fieri.", 1, "I need to deliver this note to Janus Fieri at the Crossroads in the Commonlands.", 75, 330171)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
    UpdateQuestZone(Quest,"The Commonlands")
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "Located Janus Fieri.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I found Janus Fieri and delivered Marcus' note.")
	
	AddQuestStep(Quest, 2, "Investigate the nomad's camp and look for evidence.", 1, "Janus Fieri asked me to investigate the nomad's camp to find any documents left behind by the victim.", 11)
	AddQuestStepCompleteAction(Quest, 2, "Step2Complete")
end

function Step2Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I found a tattered journal.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I've found a tattered journal in the nomad's camp.")

	AddQuestStepChat(Quest, 3, "I need to take this journal to Janus Fieri.", 1, "I should return to Janus in the Crossroads to deliver the journal.", 75, 330171)
	AddQuestStepCompleteAction(Quest, 3, "Step3Complete")
end

function Step3Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 3, "I gave Janus Fieri the tattered journal.")
	UpdateQuestTaskGroupDescription(Quest, 3, "I gave Janus Fieri the tattered journal.")

	AddQuestStepKill(Quest, 4, "I need to kill ten Bloodskull lumberjacks.", 10, 100, "I must avenge Janus Fieri's brother by slaying his killers.", 611, 330125, 331138)
	AddQuestStepCompleteAction(Quest, 4, "Step4Complete")
end

function Step4Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 4, "I have avenged Janus Fieri's brother.")
	UpdateQuestTaskGroupDescription(Quest, 4, "I have avenged Janus Fieri's brother.")

	AddQuestStepChat(Quest, 5, "I should return to Janus.", 1, "I must tell Janus Fieri that his brother has been avenged.", 11, 330171)
	AddQuestStepCompleteAction(Quest, 5, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 5, "I've spoken with Janus Fieri.")
	UpdateQuestTaskGroupDescription(Quest, 5, "I told Janus Fieri that his brother was avenged.")

	UpdateQuestDescription(Quest, "I've delivered Marcus' note to Janus and helped Janus with his murder investigation.  Turns out he was investigating his own brother's death.  It was a pleasure to help him take vengeance.")
	GiveQuestReward(Quest, Player)
end

function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("Thanks, friend.  I was waiting for someone like you to show up.  No need to report back to me.  Janus'll take care of you.")
	Dialog.AddVoiceover("voiceover/english/marcus_cantarius/fprt_hood04/quests/marcuscantarius/marcus_cantarius2_003.mp3", 2562832727, 2431599798)
	Dialog.AddOption("Alright.")
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
		QuestComplete(Quest, QuestGiver, Player)
	end
end

