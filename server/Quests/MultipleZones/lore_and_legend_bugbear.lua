--[[
    Script Name    : Quests/MultipleZones/lore_and_legend_bugbear.lua
    Script Author  : AussieGlen
    Script Date    : 2022.01.02 08:01:56
    Script Purpose : 

        Zone       : MultipleZones
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]

function Init(Quest)
	AddQuestStepKillByRace(Quest, 1, "I need to find a bugbear spirit.", 1, 100, "I must locate several bugbear body parts.", 2516, 281)
	AddQuestStepKillByRace(Quest, 2, "I need to find a bugbear ear.", 1, 100, "I must locate several bugbear body parts.", 2516, 281)
	AddQuestStepKillByRace(Quest, 3, "I need to find a bugbear brain.", 1, 100, "I must locate several bugbear body parts.", 2516, 281)
	AddQuestStep(Quest, 4, "I need to find and study a bugbear claw.", 1, 100, "I must locate several bugbear body parts.", 11)
	AddQuestStep(Quest, 5, "I need to find and study a bugbear eye.", 1, 100, "I must locate several bugbear body parts.", 11)
	AddQuestStep(Quest, 6, "I need to find and study a bugbear hand.", 1, 100, "I must locate several bugbear body parts.", 11)
	AddQuestStep(Quest, 7, "I need to find and study a bugbear ribcage.", 1, 100, "I must locate several bugbear body parts.", 11)
	AddQuestStep(Quest, 8, "I need to find and study a bugbear tusk.", 1, 100, "I must locate several bugbear body parts.", 11)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
	AddQuestStepCompleteAction(Quest, 2, "Step2Complete")
 	AddQuestStepCompleteAction(Quest, 3, "Step3Complete")
 	AddQuestStepCompleteAction(Quest, 4, "Step4Complete")
	AddQuestStepCompleteAction(Quest, 5, "Step5Complete")
	AddQuestStepCompleteAction(Quest, 6, "Step6Complete")
	AddQuestStepCompleteAction(Quest, 7, "Step7Complete")
	AddQuestStepCompleteAction(Quest, 8, "Step8Complete")
end

function Accepted(Quest, QuestGiver, Player)

end

function Declined(Quest, QuestGiver, Player)

end

function quest_complete(Quest, QuestGiver, Player)

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
	end
end

function CheckProgress(Quest, QuestGiver, Player)
    if QuestStepIsComplete(Player, 5426, 1) and QuestStepIsComplete(Player, 5426, 2) and QuestStepIsComplete(Player, 5426, 3) and QuestStepIsComplete(Player, 5426, 4) and QuestStepIsComplete(Player, 5426, 5) and QuestStepIsComplete(Player, 5426, 6) and QuestStepIsComplete(Player, 5426, 7) and QuestStepIsComplete(Player, 5426, 8) then
        QuestIsComplete(Quest, QuestGiver, Player)
    end
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I have found a bugbear spirit.")
	CheckProgress(Quest, QuestGiver, Player)

end

function Step2Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I have found a bugbear ear.")
	CheckProgress(Quest, QuestGiver, Player)

end

function Step3Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 3, "I have found a bugbear brain.")
	CheckProgress(Quest, QuestGiver, Player)

end

function Step4Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 4, "I have found and studied a bugbear claw.")
	CheckProgress(Quest, QuestGiver, Player)

end

function Step5Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 5, "I have found and studied a bugbear eye.")
	CheckProgress(Quest, QuestGiver, Player)

end

function Step6Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 6, "I have found and studied a bugbear hand.")
	CheckProgress(Quest, QuestGiver, Player)

end

function Step7Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 7, "I have found and studied a bugbear ribcage.")
	CheckProgress(Quest, QuestGiver, Player)
end

function Step8Complete(Quest, QuestGiver, Player)
   UpdateQuestStepDescription(Quest, 8, "I have found and studied a bugbear tusk.")
   CheckProgress(Quest, QuestGiver, Player)
end

function QuestIsComplete(Quest, QuestGiver, Player)
	UpdateQuestTaskGroupDescription(Quest, 1, "I have located all of the necessary bugbear body parts.")
	UpdateQuestDescription(Quest, "I have learned the secrets of the bugbear.")
	GiveQuestReward(Quest, Player)
end

