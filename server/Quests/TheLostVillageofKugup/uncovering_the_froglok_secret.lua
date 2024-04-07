--[[
	Script Name		:	uncovering_the_froglok_secret.lua
	Script Purpose	:	Handles the quest, "Uncovering the Froglok Secret"
	Script Author	:	Neatz09
	Script Date		:	12/11/2023
	Script Notes	:	Auto generated with QuestParser.

	Zone			:	Hallmark
	Quest Giver		:	
	Preceded by		:	None
	Followed by		:	None
--]]


function Init(Quest)
	AddQuestStep(Quest, 1, "Investigate the village.", 1, 100, "I must discover the secret of the village.", 11)
	AddQuestStepCompleteAction(Quest, 1, "QuestComplete")
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

function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 1, "I completed the investigation.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I have discovered the secret of the village.")

	UpdateQuestDescription(Quest, "I've completed all of the tasks for the Froglok villagers and spoken with Chief Kaorf. The Chief gave me a Talisman that I can use to find the village again someday.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end