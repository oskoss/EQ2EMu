--[[
	Script Name		:	to_spite_a_darkleaf.lua
	Script Purpose	:	Handles the quest, "To Spite a Darkleaf"
	Script Author	:	torsten\\Dorbin
	Script Date		:	17.07.2022
	Script Notes	:	

	Zone			:	Beggar's Court
	Quest Giver		:	Mariana Darkleaf
	Preceded by		:	None
	Followed by		:	Running For A Candidate
--]]
require "SpawnScripts/Generic/DialogModule"


function Init(Quest)
	AddQuestStepKill(Quest, 1, "I must kill 10 Shoreside Asps in the Ruins.", 10, 100, "I should head over to the Ruins and kill ten (10) Snakes just to tick her off.", 98, 	8420020,8400012)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
    UpdateQuestZone(Quest,"The Ruins")	
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I have killed the snakes.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I've killed the Snakes.")
    UpdateQuestZone(Quest,"Beggar's Court")	

    AddQuestStepChat(Quest, 2, "I should return to Mariana.", 1, "I should now return to Mariana Darkleaf and let her know I did what she asked... and bother her some more.", 11, 1370014)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I let Mariana know that I was still alive.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I let Mariana know that I was still alive.")
	UpdateQuestDescription(Quest, "Mariana Darkleaf wasn't too pleased to see me return - alive, that is. Even though it took some time out of my day to kill those snakes, it was still worth it just to see her face when I returned.")
	GiveQuestReward(Quest, Player)
end

function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("Really? Well then, why don't you run along to the Ruins and play with some Shoreside Asps, hmmm? Maybe you'll get bitten by your serpent pals and never bother me again!")
	Dialog.AddOption("We'll see about that.")
	Dialog.AddOption("You are insufferable!")
	Dialog.Start()
end

function Declined(Quest, QuestGiver, Player)
	-- Add dialog here for when the quest is declined
end

function Deleted(Quest, QuestGiver, Player)
	-- Remove any quest specific items here when the quest is deleted
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
	    Step1Complete(Quest, QuestGiver, Player)
	elseif Step == 2 then
	    QuestComplete(Quest, QuestGiver, Player)
	end
end

