--[[
    Script Name    : Quests/Hallmark/fighter_training.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.29 03:09:39
    Script Purpose : 

        Zone       : Hallmark
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]
require "SpawnScripts/Generic/DialogModule"

function Init(Quest)
    UpdateQuestZone(Quest,"The Sprawl")
	AddQuestStepKill(Quest, 1, "I must kill some Dervish Crooks.", 5, 100, "The Commandant wants me to kill five (5) Guttersnipe Crooks in the Sprawl. If I can handle that many, I'll have shown I can hold my own as a Warrior.", 611,8400010)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
end

function Accepted(Quest, QuestGiver, Player)
    FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)   
 	Dialog.AddDialog("Hmph ... Well, you got a soldier's attitude.  Maybe you're not as much of a milksop as I thought.  Okay, listen up: If you want to be a warrior, you have to prove your strength. Take your weapon and head to the Sprawl.")
    Dialog.AddOption("How do I prove myself there, sir?","Dialog1b")	
	Dialog.Start()
end

function Declined(Quest, QuestGiver, Player)
	-- Add dialog here for when the quest is declined
end

function Deleted(Quest, QuestGiver, Player)
	-- Remove any quest specific items here when the quest is deleted
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I have killed some Dervish Crooks.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I've killed the Guttersnipe Crooks in the manner any Warrior would do it. I may choose to become one in the future, but I'd like to see the styles of other Fighters first.")
    UpdateQuestZone(Quest,"North Freeport")

	AddQuestStepChat(Quest, 2, "I need to return to the Commandant.", 1, "While I still have their blood on my weapon, I should return to the Commandant to inform him that I carried out his orders.", 11, 1440465)
	AddQuestStepCompleteAction(Quest, 2, "Step2Complete")
end

function Step2Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I have been debriefed by the Commandant.")
	UpdateQuestTaskGroupDescription(Quest, 2, "The Commandant was surprised that I made it back alive. He was mildly impressed, enough to continue my training.")
    UpdateQuestZone(Quest,"Multiple Zones")

	AddQuestStepChat(Quest, 3, "I need to give the bartender Elma Lowe at the Jade Tiger's Den a message from Lucan.", 1, "I've now been ordered to speak with the tavern owners who have been serving the Guttersnipes.  I'll speak to them the way a Brawler would.", 11, 1440059)
	AddQuestStepChat(Quest, 4, "I need to let Ranik Calman of the Seafarer's Roost know what Lucan thinks about serving the Guttersnipes.", 1, "I've now been ordered to speak with the tavern owners who have been serving the Guttersnipes.  I'll speak to them the way a Brawler would.", 11, 1280029)
	AddQuestStepChat(Quest, 5, "I need to inform Grum Zoomly of the Back Alley Brewhouse of Lucan's displeasure.", 1, "I've now been ordered to speak with the tavern owners who have been serving the Guttersnipes.  I'll speak to them the way a Brawler would.", 11, 1680080)
	AddQuestStepCompleteAction(Quest, 3, "Step3Complete")
	AddQuestStepCompleteAction(Quest, 4, "Step4Complete")
	AddQuestStepCompleteAction(Quest, 5, "Step5Complete")
end

function Step3Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 3, "I've suckerpunched Elma Lowe, the bartender of the Jade Tiger's Den.")
    CheckProgress(Quest, QuestGiver, Player)
end

function Step4Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 4, "Ranik Calman, the owner of the Seafarer's Roost, has been kicked in the groin.")
    CheckProgress(Quest, QuestGiver, Player)
end

function Step5Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 5, "I've punched the owner of the Brewhouse, Grum Zoomly, in the gut a few times.")
    CheckProgress(Quest, QuestGiver, Player)
end

function CheckProgress(Quest, QuestGiver, Player)
    if QuestStepIsComplete(Player, 5898, 3) and QuestStepIsComplete(Player, 5898, 4)  and QuestStepIsComplete(Player, 5898, 5)then
    
    
	UpdateQuestTaskGroupDescription(Quest, 3, "I've given each of the tavern owners Lucan's message in the way a Brawler talks to other people.")
	AddQuestStepChat(Quest, 6, "I need to return to the Commandant", 1, "Before the blood dries on my knuckles, I should let the Commandant know that the tavern owners were listening.", 11, 1440465)
	AddQuestStepCompleteAction(Quest, 6, "Step6Complete")
end
end

function Step6Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 6, "I have been debriefed by the Commandant")
	UpdateQuestTaskGroupDescription(Quest, 4, "The Commandant has approved of the way I handled the situation.")
    UpdateQuestZone(Quest,"Multiple Zones")

	AddQuestStepChat(Quest, 7, "I need to speak with a human named Favonius Seneca in Beggar's Court. He should have some goons nearby.", 1, "The Commandant wants me to persuade some people in the districts that they should refrain from associating with the Guttersnipes. I should approach this in the way a Crusader would deal with these people.", 11, 1370028)
	AddQuestStepChat(Quest, 8, "I need to speak with an Iksar named Savas Dranak in Scale Yard who doesn't treat his servants well.", 1, "The Commandant wants me to persuade some people in the districts that they should refrain from associating with the Guttersnipes. I should approach this in the way a Crusader would deal with these people.", 11, 1390037)
	AddQuestStepChat(Quest, 9, "I need to speak with a dark elf named Lynsia T'Kanix in Longshadow Alley who runs a drinking establishment.", 1, "The Commandant wants me to persuade some people in the districts that they should refrain from associating with the Guttersnipes. I should approach this in the way a Crusader would deal with these people.", 11, 1380013	)
	AddQuestStepCompleteAction(Quest, 7, "Step7Complete")
	AddQuestStepCompleteAction(Quest, 8, "Step8Complete")
	AddQuestStepCompleteAction(Quest, 9, "Step9Complete")
end

function Step7Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 7, "I have persuaded Favonius Seneca in Beggar's Court.")
    CheckProgress2(Quest, QuestGiver, Player)
end

function Step8Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 8, "I have persuaded Savas Dranak Scale Yard.")
    CheckProgress2(Quest, QuestGiver, Player)
end

function Step9Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 9, "I have persuaded Lynsia T'Kanix in Longshadow Alley.")
    CheckProgress2(Quest, QuestGiver, Player)
end	
	
function CheckProgress2(Quest, QuestGiver, Player)
    if QuestStepIsComplete(Player, 5898, 7) and QuestStepIsComplete(Player, 5898, 8)  and QuestStepIsComplete(Player, 5898, 9)then
    UpdateQuestZone(Quest,"North Freeport")
    
	UpdateQuestTaskGroupDescription(Quest, 5, "I've convinced the people in the districts to no longer associate with the Guttersnipes.")
	AddQuestStepChat(Quest, 10, "I need to speak with the Commandant.", 1, "I need to let the Commandant know that the Guttersnipes won't be a problem any longer.", 11, 1440465)
	AddQuestStepCompleteAction(Quest, 10, "QuestComplete")
end
end

function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 10, "I've spoken to the Commandant.")
	UpdateQuestTaskGroupDescription(Quest, 6, "The Commandant has approved of the way I handled the situation.")

	UpdateQuestDescription(Quest, "I have graduated from Commandant Tychus' personal academy.  Through his training, I've learned the ways of different classes of Fighter. At the end of my training, the Commandant had let me choose which classification of fighter I wanted to become. ")
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
		QuestComplete(Quest, QuestGiver, Player)
	end
end
