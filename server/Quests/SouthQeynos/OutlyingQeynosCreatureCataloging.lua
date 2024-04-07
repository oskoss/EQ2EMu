--[[
	Script Name		:	OutlyingQeynosCreatureCataloging.lua
	Script Purpose	:	Handles the quest, "Outlying Qeynos Creature Cataloging"
	Script Author	:	Shatou
	Script Date		:	1/9/2020
	Script Notes	:	Updated for skill use and updates - Dorbin 9/12/2023

	Zone			:	Catalog
	Quest Giver		:	Outlying Qeynos Creature Catalog from Sage Indis Surion
	Preceded by		:	None
	Followed by		:	None
--]]

local THIS_QUEST_ID = 519
local AN_OAKMYST_FAIRY_ID = 1950018
local AN_OAKMYST_FAIRY_ID_2 = 1950019
local AN_OAKMYST_FAIRY_ID_3 = 1950026
local AN_OAKMYST_FAIRY_ID_4 = 1950056
local A_SUNSHIMMER_SPIRTE_ID = 1950034
local A_SUNSHIMMER_SPIRTE_ID_2 = 1950036
local A_SUNSHIMMER_SPIRTE_ID_3 = 1950054
local A_BADGER_CUB_ID = 1950035
local A_SKITTERING_SCAVENGER_ID = 1960022
local A_SPECTRAL_STUDENT_ID = 1960077
local A_CORRUPTED_DRYAD_ID = 1950013
local A_CORRUPTED_DRYAD_ID_2 = 1950070
local AN_ALABASTER_GOLEM_ID = 1970022
local AN_ALABASTER_GOLEM_ID_2 = 1970030
local A_DUSTPAW_GUARD_ID = 1970017
local AN_ALBINO_PYTHON_ID = 1970009
local A_BOG_SLUDGE_ID = 1980002
local A_MARSH_HATCHLING_ID = 1980047
local A_BOG_FAERIE_ID = 1980007
local A_BOG_FAERIE_ID_2 = 1980008
local A_BOG_FAERIE_ID_3 = 1980010
local A_BOG_FAERIE_ID_4 = 1980052
local Catalogue = 42 --2550196
local Catalogue2 = 2550196 --

function Init(Quest)
    
    UpdateQuestZone(Quest,"Multiple Zones")
	AddQuestStep (Quest, 1, "I must find an Oakmyst fairy.", 1, 100, "I am tracking down several creatures and cataloging them.", 11)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
	
	AddQuestStep(Quest, 2, "I must find a sunshimmer sprite.", 1, 100, "I am tracking down several creatures and cataloging them.", 11)
	AddQuestStepCompleteAction(Quest, 2, "Step2Complete")
	
	AddQuestStep(Quest, 3, "I must find a badger cub.", 1, 100, "I am tracking down several creatures and cataloging them.", 11)
	AddQuestStepCompleteAction(Quest, 3, "Step3Complete")
	
	AddQuestStep(Quest, 4, "I must find a ruins skulker.", 1, 100, "I am tracking down several creatures and cataloging them.", 11)
	AddQuestStepCompleteAction(Quest, 4, "Step4Complete")
	
	AddQuestStep(Quest, 5, "I must find a Flamepaw loyalist.", 1, 100, "I am tracking down several creatures and cataloging them.", 11)
	AddQuestStepCompleteAction(Quest, 5, "Step5Complete")
	
	AddQuestStep(Quest, 6, "I must find a sleepless one.", 1, 100, "I am tracking down several creatures and cataloging them.", 11)
	AddQuestStepCompleteAction(Quest, 6, "Step6Complete")
	
	AddQuestStep(Quest, 7, "I must find an alabaster golem.", 1, 100, "I am tracking down several creatures and cataloging them.", 11)
	AddQuestStepCompleteAction(Quest, 7, "Step7Complete")
	
	AddQuestStep(Quest, 8, "I must find a Dustpaw guard.", 1, 100, "I am tracking down several creatures and cataloging them.", 11)
	AddQuestStepCompleteAction(Quest, 8, "Step8Complete")
	
	AddQuestStep(Quest, 9, "I must find an albino python.", 1, 100, "I am tracking down several creatures and cataloging them.", 11)
	AddQuestStepCompleteAction(Quest, 9, "Step9Complete")
	
	AddQuestStep(Quest, 10, "I must find a bog sludge.", 1, 100, "I am tracking down several creatures and cataloging them.", 11)
	AddQuestStepCompleteAction(Quest, 10, "Step10Complete")
	
	AddQuestStep(Quest, 11, "I must find a marsh hatchling.", 1, 100, "I am tracking down several creatures and cataloging them.", 11)
	AddQuestStepCompleteAction(Quest, 11, "Step11Complete")
	
	AddQuestStep(Quest, 12, "I must find a bog faerie.", 1, 100, "I am tracking down several creatures and cataloging them.", 11)
	AddQuestStepCompleteAction(Quest, 12, "Step12Complete")

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
	QuestStepIsComplete(Player, THIS_QUEST_ID, 12) then
		-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
		UpdateQuestTaskGroupDescription(Quest, 1, "I have located all of the creatures I was looking for.")

		UpdateQuestDescription(Quest, "I've successfully catalogued all the creatures in the Outlying Qeynos creature guide.")
		GiveQuestReward(Quest, Player)
		if HasItem(Player,1001109) then
		    RemoveItem(Player,1001109,1)
		end
	end
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I have found an Oakmyst fairy.")
	CheckProgress(Quest, QuestGiver, Player)
end

function Step2Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I have found a sunshimmer sprite.")
	CheckProgress(Quest, QuestGiver, Player)
end

function Step3Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 3, "I have found a badger cub.")
	CheckProgress(Quest, QuestGiver, Player)
end

function Step4Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 4, "I have found a skittering scavenger.")
	CheckProgress(Quest, QuestGiver, Player)
end

function Step5Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 5, "I have found a spectral student.")
	CheckProgress(Quest, QuestGiver, Player)
end

function Step6Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 6, "I have found a corrupted dryad.")
	CheckProgress(Quest, QuestGiver, Player)
end

function Step7Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 7, "I have found an alabaster golem.")
	CheckProgress(Quest, QuestGiver, Player)
end

function Step8Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 8, "I have found a Dustpaw guard.")
	CheckProgress(Quest, QuestGiver, Player)
end

function Step9Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 9, "I have found an albino python.")
	CheckProgress(Quest, QuestGiver, Player)
end

function Step10Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 10, "I have found a bog sludge.")
	CheckProgress(Quest, QuestGiver, Player)
end

function Step11Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 11, "I have found a marsh hatchling.")
	CheckProgress(Quest, QuestGiver, Player)
end

function Step12Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 12, "I have found a bog faerie.")
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
	end
end

function Accepted(Quest, QuestGiver, Player)
    AddSpellBookEntry(Player, 2550196, 1) --CREATURE CATALOGUE
end

function Declined(Quest, QuestGiver, Player)
	-- Add dialog here for when the quest is declined
end