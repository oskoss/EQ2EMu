--[[
	Script Name		:	icebrews_secret_recipe.lua
	Script Purpose	:	Handles the quest, "Icebrew's Secret Recipe"
	Script Author	:	torsten
	Script Date		:	23.07.2022
	Script Notes	:	

	Zone			:	Scale Yard
	Quest Giver		:	Bartender Icebrew
	Preceded by		:	None
	Followed by		:	Blind Taste Test
--]]
require "SpawnScripts/Generic/DialogModule"


function Init(Quest)
	AddQuestStepKill(Quest, 1, "Collect jars of rust monster blood", 10, 100, "Icebrew, the Bartender in Scale Yard, has asked me to gather together ten jars of rust monster blood.  He says that the blood is actually liquid rust. I'll take his word for it.", 180, 1240011, 1240013)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I have collected the jars.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I've collected up the blood from the Rust Monsters that Icebrew wanted. I guess he was right... this blood DOES look like rust.")
    
    AddQuestStepChat(Quest, 2, "I should return to Bartender Icebrew.", 1, "I should bring this rust monster blood to Bartender Icebrew for his brew.", 180, 1390051)
    AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I gave Icebrew the blood that I collected.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I gave Icebrew the blood that I collected.")
 	UpdateQuestDescription(Quest, "Icebrew has given me my money and my free beer. I think I'll hold onto the beer for now... it seems more like a weapon than a drink.")
	GiveQuestReward(Quest, Player)
end

function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("Go to the Sunken City and slay the rust monsters that lurk there. Kill the beasts and squeeze them with all your might. Out of their bodies should pour about a jar's worth of pure, liquid rust. Come back with as many jars as you can, and we have a deal.")
	Dialog.AddVoiceover("voiceover/english/bartender_icebrew/fprt_hood06/quests/bartendericebrew/icebrew_x1_accept.mp3", 2282916525, 4054783281)
	Dialog.AddOption("I can do this.", "Dialog9")
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

