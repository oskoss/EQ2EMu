--[[
    Script Name    : Quests/Antonica/far_seas_requisition_ant0229.lua
    Script Author  : Dorbin
    Script Date    : 2023.05.15 04:05:01
    Script Purpose : 

        Zone       : Antonica
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]

function Init(Quest)
	SetQuestFeatherColor(Quest, 3)
	SetQuestRepeatable(Quest)
	AddQuestStepKill(Quest, 1, "I must kill some rotstuffed scarecrows", 4, 100, "I must hunt down the creatures in Antonica to fill the requisition.", 182, 121300)
	AddQuestStepKill(Quest, 2, "I must kill some earth burrowers", 2, 100, "I must hunt down the creatures in Antonica to fill the requisition.", 382, 120157)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
	AddQuestStepCompleteAction(Quest, 2, "Step2Complete")
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
	UpdateQuestStepDescription(Quest, 1, "I have killed some rotstuffed scarecrows")
    QuestCheck(Quest, QuestGiver, Player)
end

function Step2Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I have killed some earth burrowers")
 QuestCheck(Quest, QuestGiver, Player)
end

 function  QuestCheck(Quest, QuestGiver, Player)
   if QuestStepIsComplete(Player,5819,1) and QuestStepIsComplete(Player,5819,2)  then
	UpdateQuestTaskGroupDescription(Quest, 1, "I have hunted down all the resources to fill the requisition.")
	AddQuestStepChat(Quest, 3, "I must speak with Taskmaster Lynette", 1, "I must find Taskmaster Lynette at Coldwind Point in Antonica and deliver this fulfilled contract.", 75, 121256)
	AddQuestStepCompleteAction(Quest, 3, "QuestComplete")
end
end

function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 3, "I visited Taskmaster Lynette.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I have delivered the requisition goods to the Taskmaster.")

	UpdateQuestDescription(Quest, "I filled the Far Seas Requisition and delivered the goods to the Taskmaster out in Antonica. I have been paid in full for this work.")
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
