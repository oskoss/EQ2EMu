--[[
    Script Name    : Quests/Hallmark/becoming_a_crusader.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.29 03:09:23
    Script Purpose : 

        Zone       : Hallmark
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]

function Init(Quest)
	AddQuestStepChat(Quest, 1, "I need to find the defectors.", 1, "I need to find where the defectors are hiding before they leave the city.", 11, 1)
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
	UpdateQuestStepDescription(Quest, 1, "I found the place where the defectors are hiding.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I overheard a man talking about getting others ready to leave on a boat.")

	AddQuestStepChat(Quest, 2, "I should confront the defectors in the building.", 1, "I should go inside and confront the defectors.", 11, 1)
	AddQuestStepCompleteAction(Quest, 2, "Step2Complete")
end

function Step2Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I entered the building to investigate.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I entered the building to investigate.")

	AddQuestStepKill(Quest, 3, "I need to subdue the defectors!", 1, 100, "I need to subdue these defectors!", 11, 1)
	AddQuestStepCompleteAction(Quest, 3, "Step3Complete")
end

function Step3Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 3, "I subdued the defectors.")
	UpdateQuestTaskGroupDescription(Quest, 3, "I subdued the hostile defectors.")

	AddQuestStepChat(Quest, 4, "I need to speak with the surviving defectors.", 1, "I should speak to the surviving defectors.", 11, 1)
	AddQuestStepCompleteAction(Quest, 4, "Step4Complete")
end

function Step4Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 4, "I convinced the survivors to surrender.")
	UpdateQuestTaskGroupDescription(Quest, 4, "I convinced the surviving defectors to surrender.")

	AddQuestStepChat(Quest, 5, "I need to report back to Tychus.", 1, "I need to report back to Tychus.", 11, 1)
	AddQuestStepCompleteAction(Quest, 5, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 5, "I reported back to Tychus.")
	UpdateQuestTaskGroupDescription(Quest, 5, "I reported back to Tychus.")

	UpdateQuestDescription(Quest, "I stopped the defection and saved the lives of the misguided.  To be a Crusader I must stand unswerving for my beliefs and that is what I have done.  The Commandant was impressed with my conviction.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		Step1Complete(Quest, QuestGiver, Player)
	elseif Step == 2 then
		Step2Complete(Quest, QuestGiver, Player)
	elseif Step == 3 then
		Step3Complete(Quest, QuestGiver, Player)
	elseif Step == 4 then
		Step4Complete(Quest, QuestGiver, Player)
	elseif Step == 5 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end
