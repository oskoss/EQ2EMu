--[[
	Script Name		:	no_rivals_for_yarana_part_i.lua
	Script Purpose	:	Handles the quest, "No Rivals For Yarana"
	Script Author	:	torsten
	Script Date		:	18.07.2022
	Script Notes	:	

	Zone			:	Longshadow Alley
	Quest Giver		:	Yarana D'Ven
	Preceded by		:	None
	Followed by		:	None
--]]

require "SpawnScripts/Generic/DialogModule"

function Init(Quest)
	AddQuestStepKill(Quest, 1, "I have to kill eight filthy moccasins.", 8, 100, "I need to go to the Serpent Sewers and destroy 8 filthy moccasins.", 611, 1550002, 1550039)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
    UpdateQuestZone(Quest,"Serpent Sewer")
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I've killed the filthy moccasins.")
    UpdateQuestTaskGroupDescription(Quest,1,"I've killed the filthy moccasins Yarana wanted me to destroy.")	
    UpdateQuestZone(Quest,"Longshadow Alley")

	AddQuestStepChat(Quest, 2, "I should return to Yarana.", 1,  "I should return to Yarana in Longshadow Alley and inform her of my progress.", 11, 1380028)
	AddQuestStepCompleteAction(Quest, 2, "Step2Complete")
end

function Step2Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I spoke with Yarana D'Ven.")
    UpdateQuestZone(Quest,"Fallen Gate")
	
	AddQuestStepKill(Quest, 3, "Destroy 7 slime sacs.", 7, 100,  "Now Yarana wants me to destroy seven slime sacs in Fallen Gate.", 611, 1190001)
	AddQuestStepCompleteAction(Quest, 3, "Step3Complete")
end

function Step3Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 3, "I killed the slime sacs.")
    UpdateQuestTaskGroupDescription(Quest,2,"I've killed the slime sacs Yarana wanted me to destroy.")	
    UpdateQuestZone(Quest,"Longshadow Alley")

	AddQuestStepChat(Quest, 4, "I should return to Yarana.", 1, "I should return to Yarana in Longshadow Alley and inform her of my progress.", 11, 1380028)
	AddQuestStepCompleteAction(Quest, 4, "Step4Complete")
end

function Step4Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 4, "I've returned to Yarana and informed her of my deeds.")
    UpdateQuestZone(Quest,"Fallen Gate")
	
	AddQuestStepKill(Quest, 5, "Destroy two suspended watchers.", 2, 100, "Yarana wants me to get rid of two suspended watchers.", 611, 1190029, 1190030)
	AddQuestStepCompleteAction(Quest, 5, "Step5Complete")
end

function Step5Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 5, "I killed two suspended watchers in Fallen Gate.")
    UpdateQuestTaskGroupDescription(Quest,3,"I've killed the suspended watchers Yarana wanted me to destroy.")	
    UpdateQuestZone(Quest,"Longshadow Alley")
	AddQuestStepChat(Quest, 6, "I should return to Yarana.", 1, "I should return to Yarana in Longshadow Alley and inform her of my progress.", 11, 1380028)
	AddQuestStepCompleteAction(Quest, 6, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 6, "I've returned to Yarana and informed her of my deeds.")
    UpdateQuestTaskGroupDescription(Quest,3,"Yarana will deal directly with her rival, but I've done what she asked.")	
	UpdateQuestDescription(Quest, "Yarana will deal directly with her rival, but I've done what she asked. She even gave me a reward, which seemed unusual, but I'm not complaining.")
	GiveQuestReward(Quest, Player)
end

function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("I cannot risk being overheard.  Come closer and I will whisper to you what I need. You must write these instructions down in your journal.  Do what I say, and I will reward you.")
	Dialog.AddVoiceover("voiceover/english/yarana_d_ven/fprt_hood05/quests/yaranadven/yarana_dven001.mp3",4193738982,2153468807)
    PlayFlavor(QuestGiver, "","","snicker",0,0, Player)
	Dialog.AddOption("Fine. Here is my journal. I'll see what I can do.")
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
	    Step2Complete(Quest, QuestGiver, Player)
	elseif Step == 3 then
	    Step3Complete(Quest, QuestGiver, Player)
	elseif Step == 4 then
	    Step4Complete(Quest, QuestGiver, Player)
	elseif Step == 5 then
	    Step5Complete(Quest, QuestGiver, Player)
	elseif Step == 6 then
	    QuestComplete(Quest, QuestGiver, Player)
	end
end

