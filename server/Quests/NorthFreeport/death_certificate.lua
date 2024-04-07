--[[
    Script Name    : Quests/NorthFreeport/death_certificate.lua
    Script Author  : Dorbin
    Script Date    : 2023.07.04 03:07:09
    Script Purpose : 

        Zone       : NorthFreeport
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]
require "SpawnScripts/Generic/DialogModule"

function Init(Quest)
	AddQuestStepChat(Quest, 1, "I must give the death certificate to merchant Talia.", 1, "I should give merchant Talia the death certificate of her late husband.  Talia is known to sell her wares in the Ruins.", 75, 8420035)
	AddQuestStepCompleteAction(Quest, 1, "QuestComplete")
end

function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("I wouldn't take these warnings lightly ...  Watch yourself, not everyone in Freeport is as forgiving as I.  Take this death certificate to merchant Talia. You'll find her peddling her wares in the ruins.")
    PlayFlavor(QuestGiver, "", "", "nod", 0, 0, Player)
	Dialog.AddVoiceover("voiceover/english/missionary_g_zule/fprt_north/qst_gzule006.mp3", 3179072985, 1240800573)
	Dialog.AddOption("Understood. I'll see she gets this certificate.")
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
	UpdateQuestStepDescription(Quest, 1, "I have given the death certificate to merchant Talia.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I have given merchant Talia the death certificate of her deceased husband, guard Barel.")

	UpdateQuestDescription(Quest, "I have given the death certificate of guard Barel to merchant Talia at the request of missionary G'Zule.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end
