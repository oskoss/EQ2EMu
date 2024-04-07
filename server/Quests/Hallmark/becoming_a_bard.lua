--[[
    Script Name    : Quests/Hallmark/becoming_a_bard.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.03 04:10:45
    Script Purpose : 

        Zone       : Hallmark
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]


function Init(Quest)
	AddQuestStep(Quest, 1, "I need to steal the Coalition's ledger.  I should direct the music to distract the leaders.", 1, 100, "I need to get to the merchant party at the Coalition's Headquarters and steal one of their ledger copies.  If I direct the band to player in a proper sequence then I will surely grab their attention.", 195)
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
	UpdateQuestStepDescription(Quest, 1, "I stole the ledger.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I stole one of the ledger copies.")

	AddQuestStepChat(Quest, 2, "I need to give the ledger to Millia.", 1, "I need to get this ledger to Millia.", 11, 1440464)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 2, "I gave the ledger to Millia.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I gave the ledger back to Millia.")

	UpdateQuestDescription(Quest, "I was able to entertain the merchants and distract them with my talents before I swiped the ledger out from under them.  Millia was quite impressed when I turned the ledger over to her.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		Step1Complete(Quest, QuestGiver, Player)
	elseif Step == 2 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end
