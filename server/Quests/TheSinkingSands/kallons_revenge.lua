--[[
    Script Name    : Quests/TheSinkingSands/kallons_revenge.lua
    Script Author  : premierio015
    Script Date    : 2023.12.16 04:12:18
    Script Purpose : qscript for Kallon's Vengeance quest
        Zone       : The Sinking Sands(DoF)
        Quest Giver: Kallon Ebbtide
        Preceded by: None
        Followed by: 
--]]

require "SpawnScripts/Generic/DialogModule"

function Init(Quest)
	AddQuestStepChat(Quest, 1, "I should locate a guide named Jaza in the crocodile hunter camp.", 1, "Kallon has asked me to find and slay the bandit that was responsible for his comrades' demise. I should check the crocodile hunter camp for a guide named Jaza.", 11, 730157)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
end

function Accepted(Quest, QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("Thank you! My comrades' spirits will be able to rest and this area might be safer. Fasul uses a guide at the hunter camp as bait for unwary travelers. Search around the crocodile hunters' camp for a man named Jaza. This man leads unwary travelers to Fasul's bandits. Play along, and find Fasul!")
	Dialog.AddOption("I will do so, but first, may I hear more of your tales?")
	Dialog.AddOption("I will find this Fasul and exact vengeance for you.")
	Dialog.Start()
end

function Declined(Quest, QuestGiver, Player)
	-- Add dialog here for when the quest is declined
end

function Deleted(Quest, QuestGiver, Player)
	-- Remove any quest specific items here when the quest is deleted
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I found Jaza and falsely agreed to let him guide me to Maj'Dul.")
    
	AddQuestStepChat(Quest, 2, "Jaza wants to meet in the Oasis of Marr near the beginning of the trade route to Maj'Dul.", 1, "Kallon has asked me to find and slay the bandit that was responsible for his comrades' demise. I should check the crocodile hunter camp for a guide named Jaza.", 11, 730157)
	AddQuestStepCompleteAction(Quest, 2, "Step2Complete")
end

function Step2Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I found Jaza by a large palm tree right at the northern edge of the Oasis of Marr.")

	AddQuestStepKill(Quest, 3, "I should speak with Jaza and continue playing along with the ruse to hopefully lure out Fasul.", 1, 100, "Kallon has asked me to find and slay the bandit that was responsible for his comrades' demise. I should check the crocodile hunter camp for a guide named Jaza.", 11, 730485)
	AddQuestStepCompleteAction(Quest, 3, "Step3Complete")
end

function Step3Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 3, "Fasul and his bandits have been slain! I bet Kallon will be happy.")

	AddQuestStepChat(Quest, 4, "I should have some final words with Jaza and end this legacy of betrayal.", 1, "Kallon has asked me to find and slay the bandit that was responsible for his comrades' demise. I should check the crocodile hunter camp for a guide named Jaza.", 11, 730157)
	AddQuestStepCompleteAction(Quest, 4, "Step4Complete")
end

function Step4Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 4, "I relented and let Jaza live. I am confident he will legitimately help travelers now.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I have found and slain Fasul. I am looking forward to letting Kallon know the news.")

	AddQuestStepChat(Quest, 5, "I need to return to Kallon at the docks and let him know that Fasul is dead.", 1, "Now that I have slain Fasul, I need to return to Kallon and tell him the good news.", 11, 730125)
	AddQuestStepCompleteAction(Quest, 5, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 5, "I let Kallon know that his comrades have been avenged.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I have informed Kallon of Fasul's death. He seemed relieved.")

	UpdateQuestDescription(Quest, "I've avenged Kallon's comrades by slaying Fasul and terrifying Jaza into submission. Kallon can now rest easy and work towards getting back to his homeland.")
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
		QuestComplete(Quest, QuestGiver, Player)
	end
end

