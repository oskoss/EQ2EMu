--[[
    Script Name    : Quests/Blackburrow/the_great_flood.lua
    Script Author  : Premierio015
    Script Date    : 2022.07.22 05:07:32
    Script Purpose : 

        Zone       : Blackburrow
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]


function Init(Quest)
	AddQuestStepKill(Quest, 1, "I need to kill 5 cave shimmers.", 5, 100, "I will find additional pages of the book in Blackburrow.", 611, 170045)
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
	UpdateQuestStepDescription(Quest, 1, "I have killed 5 cave shimmers")

	AddQuestStep(Quest, 2, "I should read the old book.", 1, 100, "I will find additional pages of the book in Blackburrow.", 185)
	AddQuestStepCompleteAction(Quest, 2, "Step2Complete")
end

function Step2Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I have read the old book.")

	AddQuestStepKill(Quest, 3, "I need to kill 8 Sabertooth guards.", 8, 100, "I will find additional pages of the book in Blackburrow.", 611, 170022)
	AddQuestStepCompleteAction(Quest, 3, "Step3Complete")
end

function Step3Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 3, "I have killed 8 Sabertooth guards.")

	AddQuestStep(Quest, 4, "I should read the old book.", 1, 100, "I will find additional pages of the book in Blackburrow.", 185)
	AddQuestStepCompleteAction(Quest, 4, "Step4Complete")
end

function Step4Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 4, "I have read the old book.")

	AddQuestStepKill(Quest, 5, "I need to kill 6 Sabertooth tacticians.", 6, 100, "I will find additional pages of the book in Blackburrow.", 611, 170043)
	AddQuestStepCompleteAction(Quest, 5, "Step5Complete")
end

function Step5Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 5, "I have killed 6 Sabertooth tacticians.")

	AddQuestStep(Quest, 6, "I should read the old book.", 1, 100, "I will find additional pages of the book in Blackburrow.", 185)
	AddQuestStepCompleteAction(Quest, 6, "Step6Complete")
end

function Step6Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 6, "I have read the old book.")

	AddQuestStepKill(Quest, 7, "I need to kill 5 Sabertooth oracles.", 5, 100, "I will find additional pages of the book in Blackburrow.", 611, 170042)
	AddQuestStepCompleteAction(Quest, 7, "Step7Complete")
end

function Step7Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 7, "I have killed 5 Sabertooth oracles.")

	AddQuestStep(Quest, 8, "I should read the old book.", 1, 100, "I will find additional pages of the book in Blackburrow.", 11)
	AddQuestStepCompleteAction(Quest, 8, "Step8Complete")
end

function Step8Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 8, "I have read the old book.")

	AddQuestStepKill(Quest, 9, "I need to kill 6 stalwart Sabertooths.", 6, 100, "I will find additional pages of the book in Blackburrow.", 611, 170033)
	AddQuestStepCompleteAction(Quest, 9, "Step9Complete")
end

function Step9Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 9, "I have killed 6 stalwart Sabertooths.")

	AddQuestStep(Quest, 10, "I should read the old book.", 1, 100, "I will find additional pages of the book in Blackburrow.", 185)
	AddQuestStepCompleteAction(Quest, 10, "Step10Complete")
end

function Step10Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 10, "I have read the old book.")

	AddQuestStepKill(Quest, 11, "I need to kill 10 blightfang spiders.", 10, 100, "I will find additional pages of the book in Blackburrow.", 611, 170006, 170005, 170020, 170037)
	AddQuestStepCompleteAction(Quest, 11, "Step11Complete")
end

function Step11Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 11, "I have killed 10 blightfang spiders.")

	AddQuestStep(Quest, 12, "I should read the old book.", 1, 100, "I will find additional pages of the book in Blackburrow.", 185)
	AddQuestStepCompleteAction(Quest, 12, "Step12Complete")
end

function Step12Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 12, "I have read the old book.")

	AddQuestStepKill(Quest, 13, "I need to kill 7 blightfang spiders.", 7, 100, "I will find additional pages of the book in Blackburrow.", 611, 170006, 170005, 170020, 170037)
	AddQuestStepCompleteAction(Quest, 13, "Step13Complete")
end

function Step13Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 13, "I have killed 7 blightfang spiders.")

	AddQuestStep(Quest, 14, "I should read the old book.", 1, 100, "I will find additional pages of the book in Blackburrow.", 185)
	AddQuestStepCompleteAction(Quest, 14, "Step14Complete")
end

function Step14Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 14, "I have read the old book.")

	AddQuestStepKill(Quest, 15, "I need to kill 10 blightfang spiders.", 10, 100, "I will find additional pages of the book in Blackburrow.", 611, 170006, 170005, 170020, 170037)
	AddQuestStepCompleteAction(Quest, 15, "Step15Complete")
end

function Step15Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 15, "I have killed 10 blightfang spiders.")

	AddQuestStep(Quest, 16, "I should read the old book.", 1, 100, "I will find additional pages of the book in Blackburrow.", 185)
	AddQuestStepCompleteAction(Quest, 16, "Step16Complete")
end

function Step16Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 16, "I have read the old book.")

	AddQuestStepKill(Quest, 17, "I need to kill 6 blightfang spiders.", 6, 100, "I will find additional pages of the book in Blackburrow.", 611, 170006, 170005, 170020, 170037)
	AddQuestStepCompleteAction(Quest, 17, "Step17Complete")
end

function Step17Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 17, "I have killed 6 blightfang spiders.")

	AddQuestStep(Quest, 18, "I should read the old book.", 1, 100, "I will find additional pages of the book in Blackburrow.", 185)
	AddQuestStepCompleteAction(Quest, 18, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 18, "I have read the old book.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I've found the remaining pages of the book.")

	UpdateQuestDescription(Quest, "Turns out that this is the story of someone who was trapped in a lower tunnel of Blackburrow during the Age of Cataclysms, when many of the lower tunnels were flooded.  Although it doesn't come out and say so, I believe the person perished.")
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
		Step6Complete(Quest, QuestGiver, Player)
	elseif Step == 7 then
		Step7Complete(Quest, QuestGiver, Player)
	elseif Step == 8 then
		Step8Complete(Quest, QuestGiver, Player)
	elseif Step == 9 then
		Step9Complete(Quest, QuestGiver, Player)
	elseif Step == 10 then
		Step10Complete(Quest, QuestGiver, Player)
	elseif Step == 11 then
		Step11Complete(Quest, QuestGiver, Player)
	elseif Step == 12 then
		Step12Complete(Quest, QuestGiver, Player)
	elseif Step == 13 then
		Step13Complete(Quest, QuestGiver, Player)
	elseif Step == 14 then
		Step14Complete(Quest, QuestGiver, Player)
	elseif Step == 15 then
		Step15Complete(Quest, QuestGiver, Player)
	elseif Step == 16 then
		Step16Complete(Quest, QuestGiver, Player)
	elseif Step == 17 then
		Step17Complete(Quest, QuestGiver, Player)
	elseif Step == 18 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end
