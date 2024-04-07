--[[
    Script Name    : Quests/TempleStreet/netherot_name_calling.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.31 07:10:40
    Script Purpose : 

        Zone       : TempleStreet
        Quest Giver: Armsdealer Shinska
        Preceded by: None
        Followed by: 
--]]
require "SpawnScripts/Generic/DialogModule"

function Init(Quest)
	AddQuestStepKill(Quest, 1, "I must kill two netherot chanters.", 1, 100, "I need to venture into the sewers and kill two netherot chanters.", 611, 8430025)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
    UpdateQuestZone(Quest,"Thieves Way")
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I have killed the netherot chanters.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I've killed two netherot chanters.")
    UpdateQuestZone(Quest,"Temple Street")
	AddQuestStepChat(Quest, 2, "I need to speak with Shinska.", 1, "I should return to Shinska and let her know the netherot chanters are now dead.", 11, 1360012)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end


function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("Ahh ... that is very good. The Shinska will remembers that you offered her helps. You go into the sewers and finds the Netherot Chanters. Kills the beasts. That will teach them not to say bad things about the Shinska. Comes back and I give you reward, yes?")
    PlayFlavor(QuestGiver,"","","happy",0,0,Player)
    Dialog.AddOption("The sewers? This better be worth it!")
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
	UpdateQuestStepDescription(Quest, 2, "I have spoken with Shinska.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I've informed Shinska that the netherot chanters are dead.")

	UpdateQuestDescription(Quest, "I've killed the netherot chanters for Shinska the arms dealer. She hopes that with a number of them dead, she'll be able to convince some other enchanters to make her weapons magical.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		Step1Complete(Quest, QuestGiver, Player)
	elseif Step == 2 then
		QuestComplete(Quest, QuestGiver, Player)
		end
end