--[[
    Script Name    : Quests/VerminsSnye/the_story_of_the_rat_queen.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.18 03:09:33
    Script Purpose : 

        Zone       : VerminsSnye
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]


function Init(Quest)
	AddQuestStepKill(Quest, 1, "I need to kill 7 crumbling tomb guards.", 7, 100, "I'll find more pages of this book in Vermin's Snye.", 91, 2000012,2000020)
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
	UpdateQuestStepDescription(Quest, 1, "I have killed 7 crumbling tomb guards.")

	AddQuestStep(Quest, 2, "I should read the old book.", 1, 100, "I'll find more pages of this book in Vermin's Snye.", 11)
	AddQuestStepCompleteAction(Quest, 2, "Step2Complete")
end

function Step2Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I have read the old book.")

	AddQuestStepKill(Quest, 3, "I need to kill 5 festering zombies.", 5, 100, "I'll find more pages of this book in Vermin's Snye.", 91, 2000011,2000018,2000027)
	AddQuestStepCompleteAction(Quest, 3, "Step3Complete")
end

function Step3Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 3, "I have killed 5 festering zombies.")

	AddQuestStep(Quest, 4, "I should read the old book.", 1, 100, "I'll find more pages of this book in Vermin's Snye.", 11)
	AddQuestStepCompleteAction(Quest, 4, "Step4Complete")
end

function Step4Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 4, "I have read the old book.")

	AddQuestStepKill(Quest, 5, "I need to kill 6 crumbling tomb guards.", 6, 100, "I'll find more pages of this book in Vermin's Snye.", 91,  2000012,2000020)
	AddQuestStepCompleteAction(Quest, 5, "Step5Complete")
end

function Step5Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 5, "I have killed 6 crumbling tomb guards.")

	AddQuestStep(Quest, 6, "I should read the old book.", 1, 100, "I'll find more pages of this book in Vermin's Snye.", 11)
	AddQuestStepCompleteAction(Quest, 6, "Step6Complete")
end

function Step6Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 6, "I have read the old book.")

	AddQuestStepKill(Quest, 7, "I need to kill 7 Bloodsaber proficients.", 7, 100, "I'll find more pages of this book in Vermin's Snye.", 91, 2000019)
	AddQuestStepCompleteAction(Quest, 7, "Step7Complete")
end

function Step7Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 7, "I have killed 7 Bloodsaber proficients.")

	AddQuestStep(Quest, 8, "I should read the old book.", 1, 100, "I'll find more pages of this book in Vermin's Snye.", 11)
	AddQuestStepCompleteAction(Quest, 8, "Step8Complete")
end

function Step8Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 8, "I have read the old book.")

	AddQuestStepKill(Quest, 9, "I need to kill 6 Bloodsaber adepts.", 6, 100, "I'll find more pages of this book in Vermin's Snye.", 91, 2000016)
	AddQuestStepCompleteAction(Quest, 9, "Step9Complete")
end

function Step9Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 9, "I have killed 6 Bloodsaber adepts.")

	AddQuestStep(Quest, 10, "I should read the old book.", 1, 100, "I'll find more pages of this book in Vermin's Snye.", 11)
	AddQuestStepCompleteAction(Quest, 10, "Step10Complete")
end

function Step10Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 10, "I have read the old book.")

	AddQuestStepKill(Quest, 11, "I need to kill 5 Bloodsaber proficients.", 5, 100, "I'll find more pages of this book in Vermin's Snye.", 91, 2000019)
	AddQuestStepCompleteAction(Quest, 11, "Step11Complete")
end

function Step11Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 11, "I have killed 5 Bloodsaber proficients.")

	AddQuestStep(Quest, 12, "I should read the old book.", 1, 100, "I'll find more pages of this book in Vermin's Snye.", 11)
	AddQuestStepCompleteAction(Quest, 12, "Step12Complete")
end

function Step12Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 12, "I have read the old book.")

	AddQuestStepKill(Quest, 13, "I need to kill 8 ravenous cubes.", 8, 100, "I'll find more pages of this book in Vermin's Snye.", 129, 2000005)
	AddQuestStepCompleteAction(Quest, 13, "Step13Complete")
end

function Step13Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 13, "I have killed 8 ravenous cubes.")

	AddQuestStep(Quest, 14, "I should read the old book.", 1, 100, "I'll find more pages of this book in Vermin's Snye.", 11)
	AddQuestStepCompleteAction(Quest, 14, "Step14Complete")
end

function Step14Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 14, "I have read the old book.")

	AddQuestStepKill(Quest, 15, "I need to kill 5 ravenous cubes.", 5, 100, "I'll find more pages of this book in Vermin's Snye.", 129, 2000005)
	AddQuestStepCompleteAction(Quest, 15, "Step15Complete")
end

function Step15Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 15, "I have killed 5 ravenous cubes.")

	AddQuestStep(Quest, 16, "I should read the old book.", 1, 100, "I'll find more pages of this book in Vermin's Snye.", 11)
	AddQuestStepCompleteAction(Quest, 16, "Step16Complete")
end

function Step16Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 16, "I have read the old book.")

	AddQuestStepKill(Quest, 17, "I need to kill 10 large tomb vermin.", 10, 100, "I'll find more pages of this book in Vermin's Snye.", 101, 2000014)
	AddQuestStepCompleteAction(Quest, 17, "Step17Complete")
end

function Step17Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 17, "I have killed 10 large tomb vermin.")

	AddQuestStep(Quest, 18, "I should read the old book.", 1, 100, "I'll find more pages of this book in Vermin's Snye.", 11)
	AddQuestStepCompleteAction(Quest, 18, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 18, "I have read the old book.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I found the book's missing pages.")

	UpdateQuestDescription(Quest, "An interesting tale, told from two different points of view.  It's not clear whether the woman called the Rat Queen is insane; she sounds perfectly reasonable.  I imagine the ratonga wouldn't find anything odd in her tale.  Or her &quot;tail.&quot;  Hahaha!")
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
