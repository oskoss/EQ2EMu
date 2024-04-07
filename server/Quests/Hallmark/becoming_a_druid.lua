--[[
    Script Name    : Quests/Hallmark/becoming_a_druid.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.29 02:09:15
    Script Purpose : 

        Zone       : Hallmark
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]

function Init(Quest)
	AddQuestStepKill(Quest, 1, "I need to destroy the plant beast.", 1, 100, "I need to find this monstrosity of nature and destroy it with my command of nature.", 11, 1)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
end

--It's just a plant, right?  I think I can handle that.
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
	UpdateQuestStepDescription(Quest, 1, "I defeated the plant beast.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I defeated the plant beast.")

	AddQuestStepChat(Quest, 2, "I need to report back to Kelian.", 1, "I need to report back to Priest Kelian.", 11, 1440466)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 2, "I spoke with Priest Kelian.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I spoke with Priest Kelian.")

	UpdateQuestDescription(Quest, "I defeated the plant beast that the mage failed to destroy after creating it.  I have demonstrated that the power of nature is greater than any mages creation.  I am now a Druid.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		Step1Complete(Quest, QuestGiver, Player)
	elseif Step == 2 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end
