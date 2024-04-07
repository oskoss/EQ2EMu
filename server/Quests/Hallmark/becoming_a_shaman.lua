--[[
    Script Name    : Quests/Hallmark/becoming_a_shaman.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.29 02:09:47
    Script Purpose : 

        Zone       : Hallmark
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]

function Init(Quest)
	AddQuestStepLocation(Quest, 1, "I need to find the building where the spirits dwell.", 1, "I need to find the residence of the spirits.  I get the feeling it has already drawn the attention of curious felines.", 11, 1)
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
	UpdateQuestStepDescription(Quest, 1, "I found the dwelling place of the spirits.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I found the residence the spirits are haunting.")

	AddQuestStepKill(Quest, 2, "I need to subdue the spirits.", 1, 100, "I need to subdue the rebellious spirits.", 611, 1)
	AddQuestStepCompleteAction(Quest, 2, "Step2Complete")
end

function Step2Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I subdued the spirits.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I subdued the spirits.")

	AddQuestStepChat(Quest, 3, "I need to return to Priest Kelian.", 1, "I should return to Priest Kelian and let him know the spirits were subdued.", 11, 1440466)
	AddQuestStepCompleteAction(Quest, 3, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 3, "I spoke to Priest Kelian.")
	UpdateQuestTaskGroupDescription(Quest, 3, "I spoke to Priest Kelian.")

	UpdateQuestDescription(Quest, "I subdued the rebellious spirits.  They are now mine to control.  I have emerged as a master of the spirit world.  I am a Shaman.")
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
