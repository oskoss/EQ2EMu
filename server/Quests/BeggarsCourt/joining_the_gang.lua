--[[
	Script Name		:	joining_the_gang.lua
	Script Purpose	:	Handles the quest, "Joining the Gang"
	Script Author	:	torsten\\Dorbin
	Script Date		:	15.07.2022
	Script Notes	:	

	Zone			:	Sunken City
	Quest Giver		:	Manius Galla
	Preceded by		:	None
	Followed by		:	Donations from the Banker
--]]
require "SpawnScripts/Generic/DialogModule"


function Init(Quest)
	AddQuestStepKill(Quest, 1, "Kill Blackshield raiders", 10, 100, "I need to kill some of the Freeport raiders in the Sunken City.  I can reach the Sunken City by using any of outside of Freeport bells.", 611, 	8410035,8410036,8410038,8410041,8410042,8410070	)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
    UpdateQuestZone(Quest,"Sunken City")
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I have killed the Freeport raiders.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I've let Manius know that I've done what it takes to pass his test.")
     UpdateQuestZone(Quest,"Beggar's Court")
  
	AddQuestStepChat(Quest, 2, "I should return to Manius.", 1, "I should return to Manius and let him know that I've passed his test.", 11, 1370127)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I've spoken with Manius.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I've let Manius know that I've done what it takes to pass his test.")
	UpdateQuestDescription(Quest, "I've killed the raider lackeys as Manius asked, completing my test. He said he'll think about letting me join, as he hasn't decided yet. I should check back with him later.")
	GiveQuestReward(Quest, Player)
end

function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("A test, huh? Yeah ... hey, boys ... let's give this runt a bit of a test. Okay, here's your test: Go deep into the Sunken City and find some of the lackeys who hang around the raiders. Kill some of them and maybe you can work for us.")
	Dialog.AddOption("Okay, they're as good as dead.", "Dialog3")
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
