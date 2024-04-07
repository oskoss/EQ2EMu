--[[
	Script Name		:	a_special_perfume.lua
	Script Purpose	:	Handles the quest, "A Special Perfume"
	Script Author	:	torsten
	Script Date		:	18.07.2022
	Script Notes	:	

	Zone			:	Longshadow Alley
	Quest Giver		:	Zelina T`Von
	Preceded by		:	None
	Followed by		:	For That Special Someone
--]]
require "SpawnScripts/Generic/DialogModule"

function Init(Quest)
	AddQuestStepKill(Quest, 1, "I must kill puny squalid vermin until I find a large scent gland.", 1, 15, "I need to travel to the Ruins and gather a large scent gland from a small rodent.", 94, 8420017)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
	UpdateQuestZone(Quest,"Ruins")
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I have found a large scent gland.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I've gathered a large scent gland from the squalid vermin.")
    
    AddQuestStepChat(Quest, 2, "I should return to Zelina.", 1, "I should return to Zelina to deliver the gland.", 11, 1380033)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I've given the gland to Zelina.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I've given the gland to Zelina.")
    UpdateQuestDescription(Quest, "Zelina has given me some coin for gathering the scent gland. She should have enough to be able to make that perfume she was planning on making. If she wants to make a perfume that smell like wine, I don't see why she doesn't just use wine. Go figure.")
	GiveQuestReward(Quest, Player)
end

function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("Good. Make yourself useful and find the gland. I'll gather the rest of the ingredients from the alchemist and await your return. Do NOT return to me unless you found a complete gland. I will settle for nothing less!")
	PlayFlavor(QuestGiver, "", "", "nod", 0, 0, Player, 0)
	Dialog.AddOption("Understood.")
	Dialog.Start()
end

function Declined(Quest, QuestGiver, Player)
	-- Add dialog here for when the quest is declined
end

function Deleted(Quest, QuestGiver, Player)
	-- Remove any quest specific items here when the quest is deleted
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
	    Step1Complete(Quest, QuestGiver, Player)
	elseif Step == 2 then
	    QuestComplete(Quest, QuestGiver, Player)
	end 
end
