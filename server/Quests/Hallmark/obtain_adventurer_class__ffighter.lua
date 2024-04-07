--[[
    Script Name    : Quests/Hallmark/obtain_adventurer_class__ffighter.lua
    Script Author  : Dorbin
    Script Date    : 2023.08.26 03:08:50
    Script Purpose : 

        Zone       : Hallmark
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]
function Init(Quest)
	AddQuestStepChat(Quest, 1, "I need to speak with Commandant Tychus within the Temple of War.", 1, "I need to speak with Commandant Tychus within the Temple of War.", 11, 0)
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
	UpdateQuestStepDescription(Quest, 1, "I spoke with Commandant Tychus.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I spoke with Commandant Tychus.")

	UpdateQuestDescription(Quest, "I have contacted Commandant Tychus about advancing.")
	GiveQuestReward(Quest, Player)
end
