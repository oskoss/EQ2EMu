--[[
    Script Name    : Quests/Antonica/antonica_creature_cataloging.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.14 11:09:09
    Script Purpose : 

        Zone       : Antonica
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]
function Init(Quest)
    
	AddQuestStep (Quest, 1, "I must find a young kodiak.", 1, 100, "I am tracking down several creatures and cataloging them.", 11)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
	
	AddQuestStep(Quest, 2, "I must find a grizzled badger.", 1, 100, "I am tracking down several creatures and cataloging them.", 11)
	AddQuestStepCompleteAction(Quest, 2, "Step2Complete")
	
	AddQuestStep(Quest, 3, "I must find a lowland viper.", 1, 100, "I am tracking down several creatures and cataloging them.", 11)
	AddQuestStepCompleteAction(Quest, 3, "Step3Complete")
	
	AddQuestStep(Quest, 4, "I must find a Coldwind octopus.", 1, 100, "I am tracking down several creatures and cataloging them.", 11)
	AddQuestStepCompleteAction(Quest, 4, "Step4Complete")
	
	AddQuestStep(Quest, 5, "I must find a sonic shrieker.", 1, 100, "I am tracking down several creatures and cataloging them.", 11)
	AddQuestStepCompleteAction(Quest, 5, "Step5Complete")
	
	AddQuestStep(Quest, 6, "I must find a klicnik warrior.", 1, 100, "I am tracking down several creatures and cataloging them.", 11)
	AddQuestStepCompleteAction(Quest, 6, "Step6Complete")
	
	AddQuestStep(Quest, 7, "I must find a timberclaw gnoll.", 1, 100, "I am tracking down several creatures and cataloging them.", 11)
	AddQuestStepCompleteAction(Quest, 7, "Step7Complete")
	
	AddQuestStep(Quest, 8, "I must find a dankfur gnoll.", 1, 100, "I am tracking down several creatures and cataloging them.", 11)
	AddQuestStepCompleteAction(Quest, 8, "Step8Complete")
	
	AddQuestStep(Quest, 9, "I must find a pond beaver.", 1, 100, "I am tracking down several creatures and cataloging them.", 11)
	AddQuestStepCompleteAction(Quest, 9, "Step9Complete")
	
	AddQuestStep(Quest, 10, "I must find a sogbone skeleton.", 1, 100, "I am tracking down several creatures and cataloging them.", 11)
	AddQuestStepCompleteAction(Quest, 10, "Step10Complete")
	
	AddQuestStep(Quest, 11, "I must find a kodiak.", 1, 100, "I am tracking down several creatures and cataloging them.", 11)
	AddQuestStepCompleteAction(Quest, 11, "Step11Complete")
	
	AddQuestStep(Quest, 12, "I must find a tidewalker behemoth.", 1, 100, "I am tracking down several creatures and cataloging them.", 11)
	AddQuestStepCompleteAction(Quest, 12, "Step12Complete")

	AddQuestStep(Quest, 13, "I must find a root strangler.", 1, 100, "I am tracking down several creatures and cataloging them.", 11)
	AddQuestStepCompleteAction(Quest, 13, "Step13Complete")
	
	AddQuestStep(Quest, 14, "I must find an earth burrower.", 1, 100, "I am tracking down several creatures and cataloging them.", 11)
	AddQuestStepCompleteAction(Quest, 14, "Step14Complete")
	
	AddQuestStep(Quest, 15, "I must find a wandering bat.", 1, 100, "I am tracking down several creatures and cataloging them.", 11)
	AddQuestStepCompleteAction(Quest, 15, "Step15Complete")

end

function CheckProgress(Quest, QuestGiver, Player)
	if QuestStepIsComplete(Player, THIS_QUEST_ID, 1) and
	QuestStepIsComplete(Player, THIS_QUEST_ID, 2) and
	QuestStepIsComplete(Player, THIS_QUEST_ID, 3) and
	QuestStepIsComplete(Player, THIS_QUEST_ID, 4) and
	QuestStepIsComplete(Player, THIS_QUEST_ID, 5) and
	QuestStepIsComplete(Player, THIS_QUEST_ID, 6) and
	QuestStepIsComplete(Player, THIS_QUEST_ID, 7) and
	QuestStepIsComplete(Player, THIS_QUEST_ID, 8) and
	QuestStepIsComplete(Player, THIS_QUEST_ID, 9) and
	QuestStepIsComplete(Player, THIS_QUEST_ID, 10) and
	QuestStepIsComplete(Player, THIS_QUEST_ID, 11) and
	QuestStepIsComplete(Player, THIS_QUEST_ID, 12) and
	QuestStepIsComplete(Player, THIS_QUEST_ID, 13) and
	QuestStepIsComplete(Player, THIS_QUEST_ID, 14) and
	QuestStepIsComplete(Player, THIS_QUEST_ID, 15)then
		-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
		UpdateQuestTaskGroupDescription(Quest, 1, "I have located all of the creatures I was looking for.")

		UpdateQuestDescription(Quest, "I've successfully catalogued all the creatures in the Antonica creature guide.")
		GiveQuestReward(Quest, Player)
		if HasItem(Player,1001110) then
		    RemoveItem(Player,1001110,1)
		end
	end
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I have found a young kodiak.")
	CheckProgress(Quest, QuestGiver, Player)
end

function Step2Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I have found a grizzled badger.")
	CheckProgress(Quest, QuestGiver, Player)
end

function Step3Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 3, "	I have found a lowland viper.")
	CheckProgress(Quest, QuestGiver, Player)
end

function Step4Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 4, "	I have found a Coldwind octopus.")
	CheckProgress(Quest, QuestGiver, Player)
end

function Step5Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 5, "	I have found a sonic shrieker.")
	CheckProgress(Quest, QuestGiver, Player)
end

function Step6Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 6, "	I have found a klicnik warrior.")
	CheckProgress(Quest, QuestGiver, Player)
end

function Step7Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 7, "	I have found a timberclaw gnoll.")
	CheckProgress(Quest, QuestGiver, Player)
end

function Step8Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 8, "I have found a dankfur gnoll.")
	CheckProgress(Quest, QuestGiver, Player)
end

function Step9Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 9, "I have found a pond beaver.")
	CheckProgress(Quest, QuestGiver, Player)
end

function Step10Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 10, "	I have found a sogbone skeleton.")
	CheckProgress(Quest, QuestGiver, Player)
end

function Step11Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 11, "I have found a kodiak.")
	CheckProgress(Quest, QuestGiver, Player)
end

function Step12Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 12, "	I have found a tidewalker behemoth.")
	CheckProgress(Quest, QuestGiver, Player)
end

function Step13Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 13, "	I have found a root strangler.")
	CheckProgress(Quest, QuestGiver, Player)
end

function Step14Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 14, "I have found an earth burrower.")
	CheckProgress(Quest, QuestGiver, Player)
end

function Step15Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 15, "	I have found a wandering bat.")
	CheckProgress(Quest, QuestGiver, Player)
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
		Step10Complete(Quest, QuestGiver, Player)
	elseif Step == 14 then
		Step11Complete(Quest, QuestGiver, Player)
	elseif Step == 15 then
		Step12Complete(Quest, QuestGiver, Player)
	end
end

function Accepted(Quest, QuestGiver, Player)
    AddSpellBookEntry(Player, 2550196, 1) --CREATURE CATALOGUE
end

function Declined(Quest, QuestGiver, Player)
	-- Add dialog here for when the quest is declined
end

