--[[
    Script Name    : Quests/Hallmark/becoming_a_brawler.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.29 03:09:21
    Script Purpose : 

        Zone       : Hallmark
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]


function Init(Quest)
	AddQuestStepChat(Quest, 1, "I need to find Korong Shatterjaw near the arena.", 1, "I need to find Korong Shatterjaw near the arena.", 11, 1)
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
	UpdateQuestStepDescription(Quest, 1, "I found Korong Shatterjaw.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I found Korong Shatterjaw and spoke with him.")

	AddQuestStepChat(Quest, 2, "I need to speak to Korong inside the building.", 1, "I should meet Korong Shatterjaw in a room inside the Blood Haze Inn just west of where he was standing.", 11, 1)
	AddQuestStepCompleteAction(Quest, 2, "Step2Complete")
end

function Step2Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I need to fight Korong's thugs!")
	UpdateQuestTaskGroupDescription(Quest, 2, "I spoke to Korong inside the building.")

	AddQuestStepKill(Quest, 3, "I need to defeat all these thugs Korong is throwing at me!", 1, 100, "I need to fight off Korong's brawlers!", 11, 1)
	AddQuestStepCompleteAction(Quest, 3, "Step3Complete")
end

function Step3Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 3, "I defeated Korong's thugs.")
	UpdateQuestTaskGroupDescription(Quest, 3, "I defeated Korong's thugs.")

	AddQuestStepChat(Quest, 4, "I need to speak to Korong inside the building.", 1, "I need to speak to Korong.", 11, 1)
	AddQuestStepCompleteAction(Quest, 4, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 4, "I spoke with Korong.")
	UpdateQuestTaskGroupDescription(Quest, 4, "I spoke with Korong.")

	UpdateQuestDescription(Quest, "I took on all of the Brawler's that Korong Shatterjaw threw at me and survived.  He seemed somewhat impressed with my ability and said some day I should be ready to challenge him.")
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
		QuestComplete(Quest, QuestGiver, Player)
	end
end
