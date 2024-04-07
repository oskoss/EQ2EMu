--[[
    Script Name    : Quests/Hallmark/becoming_a_predator.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.29 03:09:02
    Script Purpose : 

        Zone       : Hallmark
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]


function Init(Quest)
	AddQuestStepKill(Quest, 1, "I need to kill Captain Driftskull.", 1, 100, "I need to find where Captain Driftskull is hiding out and silence him.  Word is he is in a Seafury Buccaneers' den.", 611, 1)
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
	UpdateQuestStepDescription(Quest, 1, "I killed Captain Driftskull.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I killed Captain Driftskull.")

	AddQuestStepChat(Quest, 2, "I need to report to Millia.", 1, "I need to return to Millia and let her know that Captain Driftskull is dead.", 11, 1440464)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 2, "I reported back to Millia.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I reported back to Millia.")

	UpdateQuestDescription(Quest, "I was able to take care of Captain Driftskull.  There won't be any more talk from him about going independent.  Millia was impressed with my work.  I think I am going to like being a Predator.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		Step1Complete(Quest, QuestGiver, Player)
	elseif Step == 2 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end

