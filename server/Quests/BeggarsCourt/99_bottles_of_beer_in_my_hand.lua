--[[
	Script Name		:	99_bottles_of_beer_in_my_hand.lua
	Script Purpose	:	Handles the quest, "99 Bottles Of Beer In My Hand"
	Script Author	:	torsten\\Dorbin
	Script Date		:	15.07.2022
	Script Notes	:	

	Zone			:	Beggar's Court
	Quest Giver		:	Festus Septimius
	Preceded by		:	None
	Followed by		:	None
--]]

require "SpawnScripts/Generic/DialogModule"

function Init(Quest)
	AddQuestStepKill(Quest, 1, "I must kill some brine sifters.", 5, 100, "I need to travel to the Sunken City and kill brine sifters until I have a big handful of sand from their gizzards. When they're dead, I'll collect the sand that's in their gizzards.", 77, 8410001, 8410001)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
    UpdateQuestZone(Quest,"Sunken City")	

end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I have killed the brine sifters.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I've killed the crabs and collected all the sand I could find in their gizzards.")
    UpdateQuestZone(Quest,"Beggar's Court")	

    AddQuestStepChat(Quest, 2, "I should return to Festus Septimius.", 1, "I should bring this sand back to Festus Septimus if I want to get paid.", 11, 1370024)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I've given the sand to Festus Septimus.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I've given the sand to Festus Septimus and have been paid.")
	UpdateQuestDescription(Quest, "I've been paid by Festus Septimus for the sand I've collected. It seems that he intended on using the sand to make weaker glass bottles. His market for glassware requires that his bottles break in a jagged fashion so that they can be used as weapons in a bar fight.")
	GiveQuestReward(Quest, Player)
end

function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("I need gritty sand to craft glass. Glass made from beach sand is too sturdy, so I must use my old standby - crab gizzard sand. Go to the Sunken City and find some bulky crabs. Kill them, open up their gizzards, and sift out the sand. Return with the gritty sand from several crabs and I'll pay you for your work.")
	Dialog.AddVoiceover("voiceover/english/festus_septimus/fprt_hood04/quests/festusseptimus/festus_x1_accept.mp3", 395004029, 46881327)
	Dialog.AddOption("I'll go get some for you.")
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

