--[[
	Script Name		:	Quests/Commonlands/ReturningtoCaptainFeralis.lua
	Script Purpose	:	Handles the quest, "Returning to Captain Feralis"
	Script Author	:	premierio015
	Script Date		:	11.05.2021
	Script Notes	:	Auto generated with QuestParser.

	Zone			:	Commonlands
	Quest Giver		:	Ventar T'Kal
	Preceded by		:	None
	Followed by		:	None
--]]


function Init(Quest)
	AddQuestStepChat(Quest, 1, "I need to speak with Captain Feralis at the Crossroads", 1, "I need to speak with Captain Feralis.", 11, 330184)
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
	UpdateQuestStepDescription(Quest, 1, "I have spoken with Captain Feralis.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I have spoken with Captain Feralis.")

	UpdateQuestDescription(Quest, "Captain Feralis thanked me for the help I provided and gave me a reward.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end
