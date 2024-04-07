--[[
    Script Name    : Quests/Hallmark/becoming_a_rogue.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.29 03:09:56
    Script Purpose : 

        Zone       : Hallmark
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]

function Init(Quest)
	AddQuestStepObtainItem(Quest, 1, "I need to get the public log.", 1, 100, "I need to enter the Port Authority and steal both sets of logs from the harbor master's office.", 195, 1)
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
	UpdateQuestStepDescription(Quest, 1, "I have the public log.")

	AddQuestStepObtainItem(Quest, 2, "I need to get the private log.", 1, 100, "I need to enter the Port Authority and steal both sets of logs from the harbor master's office.", 195, 1)
	AddQuestStepCompleteAction(Quest, 2, "Step2Complete")
end

function Step2Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I have the private log.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I have both sets of logs.")

	AddQuestStepChat(Quest, 3, "I need to give the logs to Millia.", 1, "I need to return to Emissary Millia with the logs.", 11, 1)
	AddQuestStepCompleteAction(Quest, 3, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 3, "I gave the logs to Millia.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I gave the logs to Emissary Millia.")

	UpdateQuestDescription(Quest, "I stole the logs from the Port Authority office and handed them over to Emissary Millia.  Millia taught me that being a Rogue is not just about my skills but also how to look for opportunity in any situation.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		Step1Complete(Quest, QuestGiver, Player)
	elseif Step == 2 then
		Step2Complete(Quest, QuestGiver, Player)
	elseif Step == 3 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end