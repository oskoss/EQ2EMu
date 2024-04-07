--[[
    Script Name    : Quests/Hallmark/obtain_adventurer_class__fscout.lua
    Script Author  : Dorbin
    Script Date    : 2023.08.26 03:08:35
    Script Purpose : 

        Zone       : Hallmark
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]


function Init(Quest)
	AddQuestStepChat(Quest, 1, "I need to speak with Emissary Millia inside the Jade Tiger Inn.", 1, "I need to speak with Emissary Millia within the Jade Tiger's Den.", 11, 0)
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
	UpdateQuestStepDescription(Quest, 1, "I spoke with Emissary Millia.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I spoke with Emissary Millia.")

	UpdateQuestDescription(Quest, "I have contacted Emissary Millia about advancing.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end

