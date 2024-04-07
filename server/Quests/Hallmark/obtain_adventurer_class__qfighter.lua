--[[
    Script Name    : Quests/Hallmark/obtain_adventurer_class__qfighter.lua
    Script Author  : Dorbin
    Script Date    : 2023.08.26 03:08:15
    Script Purpose : 

        Zone       : Hallmark
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]
function Init(Quest)
	AddQuestStepChat(Quest, 1, "I need to speak with Master at Arms Dagorel on the east side of South Qeynos.", 1, "I need to speak with Master at Arms Dagorel in South Qeynos.", 11, 2310377)
	AddQuestStepCompleteAction(Quest, 1, "QuestComplete")
	UpdateQuestZone(Quest,"South Qeynos")
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
	UpdateQuestStepDescription(Quest, 1, "I spoke with Master at Arms Dagorel.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I spoke with Master at Arms Dagorel.")

	UpdateQuestDescription(Quest, "I have contacted Master at Arms Dagorel about advancing.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end
