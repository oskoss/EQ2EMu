--[[
    Script Name    : Quests/TheDownBelow/far_seas_requisition_db0436.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.21 03:09:17
    Script Purpose : 

        Zone       : TheDownBelow
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]

function Init(Quest)
	SetQuestFeatherColor(Quest, 3)
	SetQuestRepeatable(Quest)
	AddQuestStepKill(Quest, 1, "I must kill some dust crawler hatchlings.", 5, 100, "I must hunt down the creatures in The Down Below to fill the requisition.", 97, 8340023)
	AddQuestStepKill(Quest, 2, "I must kill some putrid vermin.", 5, 100, "I must hunt down the creatures in The Down Below to fill the requisition.", 172, 8340033)
	AddQuestStepKill(Quest, 3, "I must kill one shriller.", 1, 100, "I must hunt down the creatures in The Down Below to fill the requisition.", 140, 8340042)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
	AddQuestStepCompleteAction(Quest, 2, "Step2Complete")
	AddQuestStepCompleteAction(Quest, 3, "Step3Complete")

end

function CheckProgress(Quest, QuestGiver, Player)
	if QuestStepIsComplete(Player, 5888, 1) and QuestStepIsComplete(Player, 5888, 2) and QuestStepIsComplete(Player, 5888, 3) then
		UpdateQuestTaskGroupDescription(Quest, 1, "I have hunted down all the resources to fill the requisition.")
        UpdateQuestZone(Quest,"Castleview")
		AddQuestStepChat(Quest, 4, "I must go to Bartender Bulurg.", 1, "I must go to Castleview Hamlet to seek out the client of this order.", 11, 2360021)
		AddQuestStepCompleteAction(Quest, 4, "QuestComplete")
	end
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I have killed some dust crawler hatchlings.")
	CheckProgress(Quest, QuestGiver, Player)
end

function Step2Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I have killed some putrid vermin.")
	CheckProgress(Quest, QuestGiver, Player)
end

function Step3Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 3, "I have killed one shriller.")
	CheckProgress(Quest, QuestGiver, Player)
end

function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 4, "I visited Bartender Bulurg.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I have delivered the goods to Bartender Bulurg.")

	UpdateQuestDescription(Quest, "I filled the Far Seas Requisition and delivered the goods to the client in Castleview Hamlet. I have been paid in full for this work, but the order was late.")
	GiveQuestReward(Quest, Player)
	if HasItem(Player,7081) then
	    RemoveItem(Player,7081,1)
	end
end


function Accepted(Quest, QuestGiver, Player)

end

function Declined(Quest, QuestGiver, Player)

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

