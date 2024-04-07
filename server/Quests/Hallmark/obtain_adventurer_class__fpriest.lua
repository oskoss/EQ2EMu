--[[
    Script Name    : Quests/Hallmark/obtain_adventurer_class__fpriest.lua
    Script Author  : Dorbin
    Script Date    : 2023.08.26 03:08:13
    Script Purpose : 

        Zone       : Hallmark
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]

function Init(Quest)
	AddQuestStepChat(Quest, 1, "I need to speak with Priest Kelian within the Temple of War.", 1, "I need to speak with Priest Kelian within the Temple of War.", 11, 0)
	AddQuestStepCompleteAction(Quest, 1, "QuestComplete")
	UpdateQuestZone(Quest,"North Freeport")
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
	UpdateQuestStepDescription(Quest, 1, "I spoke with Priest Kelian.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I spoke with Priest Kelian.")

	UpdateQuestDescription(Quest, "I have contacted Priest Kelian about advancing.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end
