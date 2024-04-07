--[[
    Script Name    : Quests/Antonica/a_tour_of_antonica.lua
    Script Author  : Premierio015
    Script Date    : 2023.04.22 07:04:54
    Script Purpose : 

        Zone       : Antonica
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]

function Init(Quest,Player)
	AddQuestStepZoneLoc(Quest, 1, "I must go to Crater Pond", 20, "I will seek out Crater Pond in Antonica.", 11, 85, -24, 502, 12)
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
	UpdateQuestStepDescription(Quest, 1, "I saw Crater Pond.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I visited Crater Pond.")

	AddQuestStepZoneLoc(Quest, 2, "I must go to Coldwind Point", 16, "I must visit Coldwind Point in Antonica.", 11,  339, -16, 761, 12)
	AddQuestStepCompleteAction(Quest, 2, "Step2Complete")
end

function Step2Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I saw Coldwind Point.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I visited Coldwind Point.")

	AddQuestStepZoneLoc(Quest, 3, "I must go to Fippy's Hill", 20, "I must visit Fippy's Hill in Antonica. ", 11, -100, 7, -245, 12)
	AddQuestStepCompleteAction(Quest, 3, "Step3Complete")
end

function Step3Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 3, "I visited Fippy's Hill.")
	UpdateQuestTaskGroupDescription(Quest, 3, "I visited Fippy's Hill.")

	AddQuestStepZoneLoc(Quest, 4, "I must go to the Forbidden Isle", 20, "I must visit the Forbidden Isle in Antonica. ", 11, 281, -28, -655, 12)
	AddQuestStepCompleteAction(Quest, 4, "Step4Complete")
end

function Step4Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 4, "I saw the Forbidden Isle.")
	UpdateQuestTaskGroupDescription(Quest, 4, "I visited the Forbidden Isle.")

	AddQuestStepZoneLoc(Quest, 5, "I must go to the Keep of the Ardent Needle", 20, "I must visit the Keep of the Ardent Needle in Antonica.", 11, -554, -14, -346, 12)
	AddQuestStepCompleteAction(Quest, 5, "Step5Complete")
end

function Step5Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 5, "I saw the Keep of the Ardent Needle.")
	UpdateQuestTaskGroupDescription(Quest, 5, "I visited the Keep of the Ardent Needle.")

	AddQuestStepZoneLoc(Quest, 6, "I must visit the Tower of the Oracles", 20, "I must visit the Tower of the Oracles in Antonica.", 11, -1033, 14, -629, 12)
	AddQuestStepCompleteAction(Quest, 6, "Step6Complete")
end

function Step6Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 6, "I visited the Tower of the Oracles.")
	UpdateQuestTaskGroupDescription(Quest, 6, "I visited the Tower of the Oracles.")

	AddQuestStepZoneLoc(Quest, 7, "I must visit the Qeynos Hill Claymore", 20, "I must visit the Qeynos Hill Claymore in Antonica.", 11, -469, -1, 540, 12)
	AddQuestStepCompleteAction(Quest, 7, "Step7Complete")
end

function Step7Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 7, "I visited the Qeynos Hill Claymore.")
	UpdateQuestTaskGroupDescription(Quest, 7, "I visited the Qeynos Hill.")

	AddQuestStepZoneLoc(Quest, 8, "I must visit Archer's Wood", 15, "I must visit the glade in Archer Woods located in Antonica.", 11, -593.42, -11.00, 664.09, 12)
	AddQuestStepCompleteAction(Quest, 8, "Step8Complete")
end

function Step8Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 8, "I visited Archer's Wood.")
	UpdateQuestTaskGroupDescription(Quest, 8, "I visited the glade in Archer Wood.")

	AddQuestStepZoneLoc(Quest, 9, "I must visit the Bells of Vhalen", 16, "I must visit the Bells of Vhalen in Antonica.", 11, -1300, 38, 45, 12)
	AddQuestStepCompleteAction(Quest, 9, "Step9Complete")
end

function Step9Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 9, "I visited the Bells of Vhalen.")
	UpdateQuestTaskGroupDescription(Quest, 9, "I visited the Bells of Vhalen.")

	AddQuestStepZoneLoc(Quest, 10, "I must visit the Keep of the Gnollslayers", 20, "I must visit the Keep of the Gnollslayers in Antonica.", 11, -2121, -46, 415, 12)
	AddQuestStepCompleteAction(Quest, 10, "Step10Complete")
end

function Step10Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 10, "I visited the Keep of the Gnollslayers.")
	UpdateQuestTaskGroupDescription(Quest, 10, "I visited the Keep of the Gnollslayers.")

	AddQuestStepZoneLoc(Quest, 11, "I must visit Fangbreaker Keep", 20, "I must visit Fangbreaker Keep in Antonica.", 11, -2048.54, 15.74, -484, 12)
	AddQuestStepCompleteAction(Quest, 11, "Step11Complete")
end

function Step11Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 11, "I visited Fangbreaker Keep.")
	UpdateQuestTaskGroupDescription(Quest, 11, "I visited Fangbreaker Keep.")

	AddQuestStepZoneLoc(Quest, 12, "I must visit the Ruins of Caltorsis", 20, "I must visit the Ruins of Caltorsis in Antonica.", 11, -1410.40, -13.88, -741.78, 12)
	AddQuestStepCompleteAction(Quest, 12, "Step12Complete")
end

function Step12Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 12, "I visited the Ruins of Caltorsis.")
	UpdateQuestTaskGroupDescription(Quest, 12, "I visited the Ruins of Caltorsis.")

	AddQuestStepZoneLoc(Quest, 13, "I must visit the Grave of Windstalker", 16, "I must visit the Grave of Windstalker in Antonica.", 11, -1854, -3, -622, 12)
	AddQuestStepCompleteAction(Quest, 13, "Step13Complete")
end

function Step13Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 13, "I visited the Grave of Windstalker.")
	UpdateQuestTaskGroupDescription(Quest, 13, "I visited the Grave of Windstalker.")

	AddQuestStepZoneLoc(Quest, 14, "I must visit the Hidden Vale", 16, "I must visit the Hidden Vale in Antonica.", 11, -2054, 47, 959, 12)
	AddQuestStepCompleteAction(Quest, 14, "Step14Complete")
end

function Step14Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 14, "I visited the Hidden Vale.")
	UpdateQuestTaskGroupDescription(Quest, 14, "I visited the Hidden Vale.")

	AddQuestStepZoneLoc(Quest, 15, "I must visit the main entrance of Stormhold", 16, "I must visit the grand entrance of Stormhold in Antonica.", 11,  -2350, -20, 230, 12)
	AddQuestStepCompleteAction(Quest, 15, "Step15Complete")
end

function Step15Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 15, "I visited the main entrance of Stormhold.")
	UpdateQuestTaskGroupDescription(Quest, 15, "I visited the grand entrance of Stormhold.")

    AddQuestStepChat(Quest, 16, "Find the librarian of Three Towers.  ", 1, "I should take this field guide to a place in Qeynos known for housing volumes of knowledge, Three Towers.", 11, 2310086, 5890322)
	AddQuestStepCompleteAction(Quest, 16, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 16, "Gave the book to Librarian Dalmas.")
	UpdateQuestTaskGroupDescription(Quest, 16, "I gave the field guide to the Concordium in Qeynos.")

	UpdateQuestDescription(Quest, "I visited all the locations listed in 'Bootstrutter's Field Guide to Antonica.' Having done so, I decided to return the book to my cities' local mage guild, keepers of all knowledge. They were delighted and rewarded me with a valuable piece of Bootstrutter gear.")
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
		QuestComplete(Quest, QuestGiver, Player)
	end
end
