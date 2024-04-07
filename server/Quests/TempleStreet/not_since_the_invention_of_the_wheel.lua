--[[
    Script Name    : Quests/TempleStreet/not_since_the_invention_of_the_wheel.lua
    Script Author  : Dorbin
    Script Date    : 2023.11.01 04:11:43
    Script Purpose : 

        Zone       : TempleStreet
        Quest Giver: Zninki Flatzazzle
        Preceded by: None
        Followed by: 
--]]
require "SpawnScripts/Generic/DialogModule"

function Init(Quest)
	AddQuestStepKill(Quest, 1, "I need to check each one of these a vagrant squatters to find who stole the Bread Bisector.", 1, 22, "According to his other device, Zninki claims the squatters are in the city outskirts.  I bet they've run to the Ruins.", 23, 8420023,8420066)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
    UpdateQuestZone(Quest,"The Ruins")
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I've found the Bread Bisector on one of the a vagrant squatters.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I've managed to find the Bread Bisector, which looks awfully similar to a knife.")
    UpdateQuestZone(Quest,"Temple Street")
	AddQuestStepChat(Quest, 2, "I need to speak with Zninki.I", 1, " need to return this device to Zninki Flatzazzle.", 23, 1360032)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end


function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("Would you?  That would be most satisfactory!  Why yes, I like that idea very much.  I shall eagerly await the return of my ingenious device – the Bread Bisector!")
    PlayFlavor(QuestGiver,"","","happy",0,0,Player)
    Dialog.AddOption("I'll see what I can do.")
	Dialog.Start()
end

function Declined(Quest, QuestGiver, Player)
	-- Add dialog here for when the quest is declined
end

function Deleted(Quest, QuestGiver, Player)
	-- Remove any quest specific items here when the quest is deleted
end

function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 2, "I've spoken with Zninki.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I've given Zninki the Bread Bisector, which he was rather pleased by.")

	UpdateQuestDescription(Quest, "I've returned Zninki's Bread Bisector to him. He demonstrated the device to me, and I have to say I don't think I've ever seen any invention greater than that.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		Step1Complete(Quest, QuestGiver, Player)
	elseif Step == 2 then
		QuestComplete(Quest, QuestGiver, Player)
		end
end