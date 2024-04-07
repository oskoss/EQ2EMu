--[[
    Script Name    : Quests/ThievesWay/chuggles_toolbox.lua
    Script Author  : premierio015
    Script Date    : 29.06.2021
    Script Purpose : 

        Zone       : ThievesWay
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]

function Init(Quest)
	AddQuestStepKill(Quest, 1, "I need to find a cogspindler on one of the union menders.", 1, 66, "I need to find Chuggle's five tools and replace them in the toolbox. There's a good chance that they're down here in the Thieves' Way.", 1228,  8430033)
	AddQuestStepKill(Quest, 2, "I need to find a zaptwister on one of the Darkblade nobles.", 1, 70, "I need to find Chuggle's five tools and replace them in the toolbox. There's a good chance that they're down here in the Thieves' Way.", 1031,  8430006)
	AddQuestStepKill(Quest, 3, "I need to find a sprocket wobbler on one of the diseased ratonga.", 1, 70, "I need to find Chuggle's five tools and replace them in the toolbox. There's a good chance that they're down here in the Thieves' Way.", 32,  8430010,8430009,8430011)
	AddQuestStepKill(Quest, 4, "I need to find an octagonal bludgeoner from the corruptors.", 1, 70, "I need to find Chuggle's five tools and replace them in the toolbox. There's a good chance that they're down here in the Thieves' Way.", 634,  8430001)
	AddQuestStepKill(Quest, 5, "I need to find a can of elbow grease from a fallen crusader.", 1, 70, "I need to find Chuggle's five tools and replace them in the toolbox. There's a good chance that they're down here in the Thieves' Way.", 943,  8430034)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
	AddQuestStepCompleteAction(Quest, 2, "Step2Complete")
	AddQuestStepCompleteAction(Quest, 3, "Step3Complete")
	AddQuestStepCompleteAction(Quest, 4, "Step4Complete")
	AddQuestStepCompleteAction(Quest, 5, "Step5Complete")
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I found a cogspindler.")
    QuestCheck(Quest, QuestGiver, Player)
end

function Step2Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I found a zaptwister.")
    QuestCheck(Quest, QuestGiver, Player)
end

function Step3Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 3, "I found a sprocket wobbler.")
    QuestCheck(Quest, QuestGiver, Player)
end

function Step4Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 4, "I found an octagonal bludgeoner.")
    QuestCheck(Quest, QuestGiver, Player)
end

function Step5Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 5, "I found a can of elbow grease.")
    QuestCheck(Quest, QuestGiver, Player)
end

function  QuestCheck(Quest, QuestGiver, Player)
    if QuestStepIsComplete(Player,483,1) and QuestStepIsComplete(Player,483,2) and QuestStepIsComplete(Player,483,3) and QuestStepIsComplete(Player,483,4) and QuestStepIsComplete(Player,483,5)then
	UpdateQuestStepDescription(Quest, 1, "I found all the tools that were missing from Chuggle's toolbox.")
 	UpdateQuestZone(Quest, "Temple Street")
	AddQuestStepChat(Quest, 6, "I need to speak with  Chuggle Valvesplitter.", 1, "I have to return toolbox to Chuggle Valvesplitter." , 11, 1360021)
    AddQuestStepCompleteAction(Quest,6,  "quest_complete")	
end
end	

function Accepted(Quest, QuestGiver, Player)
	if HasItem(Player, 5014,1) then
	 RemoveItem(Player, 5014)
	 SendMessage(Player,"You place the toolbox in your quest satchle for later.")
	 end
end

function Declined(Quest, QuestGiver, Player)

end

function quest_complete(Quest, QuestGiver, Player)
	UpdateQuestDescription(Quest, 3, "I have spoken with Chuggle Valvesplitter and returned the toolbox.")
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
		Step5Complete(Quest, QuestGiver, Player)
	elseif Step == 6 then
		QuestComplete(Quest, QuestGiver, Player)		
		end
end

