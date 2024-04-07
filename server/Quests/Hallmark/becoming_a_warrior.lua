--[[
    Script Name    : Quests/Hallmark/becoming_a_warrior.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.29 03:09:51
    Script Purpose : 

        Zone       : Hallmark
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]


function Init(Quest)
	AddQuestStepLocation(Quest, 1, "I need to find the man that is helping the Cutthroats.", 1, "I need to find out who is providing a safehouse for the Dervish Cutthroats in the city.  The Commandant said to start my search in the City of Freeport.  I should check the taverns, he has to be providing food to them somehow.", 11, 1)
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
	UpdateQuestStepDescription(Quest, 1, "I found a suspicious man at the Jade Tiger.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I found a suspicious man at the Jade Tiger.")

	AddQuestStepLocation(Quest, 2, "I should follow the man with the food.", 1, "I should go inside the building and be ready for anything.", 11, 1)
	AddQuestStepCompleteAction(Quest, 2, "Step2Complete")
end

function Step2Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I killed the Dervish Cutthroats and Bargiss Ranlor.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I killed the Dervish Cutthroats and Bargiss Ranlor.")

	AddQuestStepChat(Quest, 3, "I need to return to Tychus.", 1, "I need to return to Tychus and report to him about Bargiss Ranlor.", 19, 1)
	AddQuestStepCompleteAction(Quest, 3, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 3, "I spoke with Commandant Tychus about Bargiss Ranlor.")
	UpdateQuestTaskGroupDescription(Quest, 3, "I spoke with Commandant Tychus about Bargiss Ranlor.")

	UpdateQuestDescription(Quest, "I found out that Bargiss Ranlor was helping out the Dervish Cutthroats survive in the city.  I didn't need the Commandant's help, I took care of the problem on my own. <br>")
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
