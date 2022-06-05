--[[
    Script Name    : Quests/CastleviewHamlet/food_for_kruuprum.lua
    Script Author  : Dorbin
    Script Date    : 2022.01.28 01:01:47
    Script Purpose : 

        Zone       : CastleviewHamlet
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]

function Init(Quest)
	AddQuestStepKill(Quest, 1, "I must kill some insects such as the centipedes in the Forest Ruins.", 6, 100, "I need to gather food for Merchant Kruuprum in Castleview. Apparently he eats insects such as the centipedes in the Forest Ruins.", 135, 1960026)
	AddQuestStepCompleteAction(Quest, 1, "KilledBugs")
	UpdateQuestZone(Quest, "The Forest Ruins")
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

function KilledBugs(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 1, "I have killed some insects")
	UpdateQuestTaskGroupDescription(Quest, 1, "I've gathered the food for Merchant Kruuprum in Castleview.")

    UpdateQuestZone(Quest, "Castleview Hamlet")
	AddQuestStepChat(Quest, 2, "I return to Kruuprum.", 1, "I need give these insects to Kruuprum.", 135, 2360040)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I return to Kruuprum")
	UpdateQuestTaskGroupDescription(Quest, 2, "I've gathered the food for Merchant Kruuprum in Castleview.")

	UpdateQuestDescription(Quest, "Kruuprum was very thankful for the food I provided for him.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		KilledBugs(Quest, QuestGiver, Player)
	end
		if Step == 2 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end