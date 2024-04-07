--[[
	Script Name		:	a_history_lesson.lua
	Script Purpose	:	Handles the quest, "A History Lesson"
	Script Author	:	Neatz09
	Script Date		:	11/22/2023
	Script Notes	:	Auto generated with QuestParser.

	Zone			:	World Event
	Quest Giver		:	
	Preceded by		:	None
	Followed by		:	None
--]]


function Init(Quest)
	AddQuestStep(Quest, 1, "Read the tome.", 1, 100, "I must read the tome and carefully study its words.", 195)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
end

function Accepted(Quest, QuestGiver, Player)
	-- Add dialog here for when the quest is accepted
end

function Declined(Quest, QuestGiver, Player)
	-- Add dialog here for when the quest is declined
end

function Deleted(Quest, QuestGiver, Player)
	-- Remove any quest specific items here when the quest is deleted
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I've read the tome.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I've read the tome. I should go speak with Euurp.")

	AddQuestStep(Quest, 2, "Pass the test.", 1, 100, "I should speak with Euurp to prove what I've learned about the Froglok people.", 11)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 2, "I have passed the test.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I have proven my knowledge.")

	UpdateQuestDescription(Quest, "I've passed the test! My knowledge of the Frogloks is immense.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		Step1Complete(Quest, QuestGiver, Player)
	elseif Step == 2 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end