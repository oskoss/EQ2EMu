--[[
	Script Name		:	Quests/TheCommonlands/far_seas_requisition__fg_073.lua
	Script Purpose	:	Handles the quest, "Far Seas Requisition - FG 073"
	Script Author	:	premierio015
	Script Date		:	26.05.2021
	Script Notes	:	Auto generated with QuestParser.

	Zone			:	Commonlands
	Quest Giver		:	Far Seas Requisition - FG 073
	Preceded by		:	None
	Followed by		:	None
--]]


function Init(Quest)
	SetQuestFeatherColor(Quest, 3)
	SetQuestRepeatable(Quest)
	AddQuestStepKill(Quest, 1, "Collect fangs from gloom snakes", 6, 100, "This particular order calls for six fangs from gloom snakes and two patches of bat fur from cursed shrillers. The location listed on the order slip points to the ruins of Neriak, Fallen Gate.", 112, 1190019)
		AddQuestStepKill(Quest, 2, "Collect bat fur from cursed shrillers", 2, 100, "This particular order calls for six fangs from gloom snakes and two patches of bat fur from cursed shrillers. The location listed on the order slip points to the ruins of Neriak, Fallen Gate.", 2226, 1190021)
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
	UpdateQuestStepDescription(Quest, 1, "I've collected enough gloom snake fangs.")
     CheckProgress(Quest, QuestGiver, Player)
end


function  CheckProgress(Quest, QuestGiver, Player)
     if QuestStepIsComplete(Player, 5241, 1) and QuestStepIsComplete(Player, 5241, 2)  then
         	UpdateQuestTaskGroupDescription(Quest, 1, "I've gathered all of the items on the requisition.  I should turn them in.")
         	AddQuestStepChat(Quest, 3, "Find the Taskmaster at the Crossroads in the Commonlands", 1, "Deliver filled FSR order to the Taskmaster at the crossroads in the Commonlands.", 11, 330260)
         		AddQuestStepCompleteAction(Quest, 3, "QuestComplete")


end 
   end

function Step2Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I've collected enough cursed shriller bat fur.")
     CheckProgress(Quest, QuestGiver, Player)
end

function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 3, "")
	UpdateQuestTaskGroupDescription(Quest, 2, "I have delivered the items on the FSR to the Taskmaster at the crossroads in the Commonlands.")

	UpdateQuestDescription(Quest, "I filled the Far Seas Requisition and delivered the goods to the Taskmaster at the crossroads in The Commonlands.  I have been paid in full for this work.")
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

