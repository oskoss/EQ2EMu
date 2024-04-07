--[[
	Script Name		:	staffing_up.lua
	Script Purpose	:	Handles the quest, "Staffing Up"
	Script Author	:	Neatz09
	Script Date		:	11/23/2023
	Script Notes	:	Auto generated with QuestParser.

	Zone			:	World Event
	Quest Giver		:	
	Preceded by		:	None
	Followed by		:	None
--]]
local Fruppen = 1230017

function Init(Quest)
	AddQuestStep(Quest, 1, "Find a strong tree branch.", 1, 100, "I am looking for a branch that will make a decent staff.", 618)
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
	UpdateQuestStepDescription(Quest, 1, "I found a strong tree branch.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I found a good branch.")
	AddQuestStepChat(Quest, 2, "Give the branch to Fruppen.", 1, "I need to take this tree branch back to Fruppen.", 11, "Fruppen")
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 2, "I gave the branch to Fruppen.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I've given the tree branch to Fruppen.")

	UpdateQuestDescription(Quest, "I've found a strong tree branch and given it to Fruppen so he can practice to be like his brother.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		Step1Complete(Quest, QuestGiver, Player)
	elseif Step == 2 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end
