--[[
    Script Name    : Quests/TempleStreet/krasa_isnt_taking_it_anymore.lua
    Script Author  : Dorbin
    Script Date    : 2023.11.07 05:11:51
    Script Purpose : 

        Zone       : TempleStreet
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]
require "SpawnScripts/Generic/DialogModule"

function Init(Quest)
	AddQuestStepChat(Quest, 1, "I need to talk to Spezi.", 1, "I need to give Spezi the message that Krasa will keep Krysa's door unlocked tonight. I think she's going to kill her in her sleep.", 11,1360015)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I have spoken to Spezi.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I gave Spezi the message. I'm pretty certain I don't want anything to do with this.")
	AddQuestStepChat(Quest, 2, "I need to talk to Krasa.", 1, "I should let Krasa know that Spezi was given the message.", 11, 1360040)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end


function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("Go finds ugly Spezi. Shes hates Krysa as much as I dos! Actuallys, she hates her even more than I dos! Tell Spezi I am leaving Krysa's doors open tonights. She'll know what to do! Yous tells me when you give the message, yes?")
	Dialog.AddVoiceover("voiceover/english/barmaid_krasa/fprt_hood03/quests/krasa/krasa_x1_accept.mp3", 1302270028, 602595312)
    PlayFlavor(QuestGiver,"","","point",0,0,Player)
    Dialog.AddOption("Spezi will get the message!")
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
	UpdateQuestStepDescription(Quest, 1, "I've spoken to Krasa.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I've informed Krasa that Spezi took the information to heart.")


	UpdateQuestDescription(Quest, "It seems Krasa has had a change of heart - at the last moment.  Perhaps Krysa might actually live through the night.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		Step1Complete(Quest, QuestGiver, Player)
	elseif Step == 2 then
		QuestComplete(Quest, QuestGiver, Player)
		end
end
