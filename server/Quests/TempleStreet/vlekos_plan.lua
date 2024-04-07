--[[
    Script Name    : Quests/TempleStreet/vlekos_plan.lua
    Script Author  : Dorbin
    Script Date    : 2023.07.17 11:07:29
    Script Purpose : 

        Zone       : TempleStreet
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]
require "SpawnScripts/Generic/DialogModule"

function Init(Quest)
	AddQuestStepKill(Quest, 1, "I must kill some orcs and look for one of their swords.", 1, 22, "I should check the Ruins for exiled orcs.  After I kill them, I'll search through their belongings for a sword.", 5, 8420025)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
    UpdateQuestZone(Quest,"The Ruins")
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I found one of the orc's sword.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I've managed to find one of the orc's sword.")
    UpdateQuestZone(Quest,"Temple Street")
	AddQuestStepChat(Quest, 2, "I need to deliver this sword to Merchant Velko.", 1, "I need to get this sword to Vleko, so he can cause some \"accidents\", as he puts it.", 5, 1360019)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end


function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("You and me make a deal, got it? You get me a sword from one of the Orcs who hide out in the Ruin. You give me sword. Togglesmeets go to sleep. Togglesmeets no wake up and big guards find Orc sword. Oh no. Now Orcs take the blame. See?")
	Dialog.AddVoiceover("voiceover/english/merchant_vleko/fprt_hood03/quests/vleko/vleko_x1_accept.mp3", 1617335271, 2473217432)
    PlayFlavor(QuestGiver,"","","agree",0,0,Player)
    Dialog.AddOption("Sounds perfect! It is a deal.")
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
	UpdateQuestStepDescription(Quest, 2, "I've given Vleko the sword I found on the orc.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I've given Vleko the sword I found on the orc.")

	UpdateQuestDescription(Quest, "Sparzit was rather happy with the fangs I brought him. He gave me some coin for gathering the teeth for him.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		Step1Complete(Quest, QuestGiver, Player)
	elseif Step == 2 then
		QuestComplete(Quest, QuestGiver, Player)
		end
end