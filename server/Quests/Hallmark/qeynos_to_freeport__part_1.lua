--[[
    Script Name    : Quests/Hallmark/qeynos_to_freeport__part_1.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.28 11:09:40
    Script Purpose : 

        Zone       : Hallmark
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]



function Init(Quest)
	AddQuestStepChat(Quest, 1, "I need to give Remy the secret code", 1, "I need to seek out Remy in the catacombs below Qeynos.  It seems he's masquerading as a cryptcleaner in the Vermin Snye, so I need to be on the lookout for him.  I need to tell him the secret code \"only the darkness will save you\".", 11, 1)
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
	UpdateQuestStepDescription(Quest, 1, "I've given Remy the secret code")
	UpdateQuestTaskGroupDescription(Quest, 1, "I've found Remy down in the Vermin Snye.")

	UpdateQuestDescription(Quest, "I have found and spoken with Cordun's partner, Remy. <br> <br>")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end
