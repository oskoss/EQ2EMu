--[[
	Script Name		:	the_puzzled_tactician.lua
	Script Purpose	:	Handles the quest, "The Puzzled Tactician"
	Script Author	:	Neatz09
	Script Date		:	11/22/2023
	Script Notes	:	Auto generated with QuestParser.

	Zone			:	World Event
	Quest Giver		:	
	Preceded by		:	None
	Followed by		:	None
--]]


function Init(Quest)
	AddQuestStep(Quest, 1, "I must solve the puzzle.", 1, 100, "I must place the totems in the correct order. When I'm finished, I need to speak with Timrek.", 11)
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
	UpdateQuestStepDescription(Quest, 1, "I solved the puzzle!")
	UpdateQuestTaskGroupDescription(Quest, 1, "I've placed the totems in the correct order.")

	UpdateQuestDescription(Quest, "I solved the logic puzzle for Timrek.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end