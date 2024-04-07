--[[
    Script Name    : Quests/Hallmark/qeynos_to_freeport__conversion.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.29 03:09:05
    Script Purpose : 

        Zone       : Hallmark
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]

function Init(Quest)
	AddQuestStepKill(Quest, 1, "Slay the orc Commander Du'Nar", 1, 100, "\"There is no salvation other than death for the Orcs.  The blood of their officers will be added to the mortar used to cement the walls of our fair city.\" - Matthias", 611, 1)
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
	UpdateQuestStepDescription(Quest, 1, "I have slain Commander Du'Nar")

	AddQuestStepKill(Quest, 2, "Slay the orc Commander Grik'Sna", 1, 100, "\"There is no salvation other than death for the Orcs.  The blood of their officers will be added to the mortar used to cement the walls of our fair city.\" - Matthias", 611,1)
	AddQuestStepCompleteAction(Quest, 2, "Step2Complete")
end

function Step2Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I have slain Commander Grik'Sna")

	AddQuestStepKill(Quest, 3, "Slay the orc Lieutenant Vrah'Kna", 1, 100,"\"There is no salvation other than death for the Orcs.  The blood of their officers will be added to the mortar used to cement the walls of our fair city.\" - Matthias", 611, 1)
	AddQuestStepCompleteAction(Quest, 3, "Step3Complete")
end

function Step3Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 3, "I have slain Lieutenant Vrah'Kna")

	AddQuestStepKill(Quest, 4, "Slay the orc General Vhar'Taug", 1, 100,"\"There is no salvation other than death for the Orcs.  The blood of their officers will be added to the mortar used to cement the walls of our fair city.\" - Matthias", 611,1)
	AddQuestStepCompleteAction(Quest, 4, "Step4Complete")
end

function Step4Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 4, "I have slain General Vhar'Taug")
	UpdateQuestTaskGroupDescription(Quest, 1, "I have killed the orc enemies of Freeport")

	AddQuestStepChat(Quest, 5, "I need to return to Matthias", 1, "The enemies of Freeport lay scattered at my feet.  It is time I returned to Matthias and informed him of my slaughter.", 11, 331144)
	AddQuestStepCompleteAction(Quest, 5, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 5, "I have returned to Matthias")
	UpdateQuestTaskGroupDescription(Quest, 2, "I have let Matthias know that the enemies of Freeport have been reduced in number.")

	UpdateQuestDescription(Quest, "I have decimated the enemies of Freeport using the true power of vengeance to guide my way.  I have shown Freeport that I am a kindred soul to their beliefs.  If they do not accept me within their walls, then they too will suffer my wrath.")
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
		QuestComplete(Quest, QuestGiver, Player)
	end
end
