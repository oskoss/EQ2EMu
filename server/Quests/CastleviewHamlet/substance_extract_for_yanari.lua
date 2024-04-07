--[[
    Script Name    : Quests/CastleviewHamlet/substance_extract_for_yanari.lua
    Script Author  : Dorbin
    Script Date    : 2022.01.28 11:01:09
    Script Purpose : 

        Zone       : CastleviewHamlet
        Quest Giver: Yanari
        Preceded by: None
        Followed by: 
--]]
require "SpawnScripts/Generic/DialogModule"

function Init(Quest)
	AddQuestStepKill(Quest, 1, "I must kill some crypt substances.", 6, 80, "I need to slay six crypt substances in the Down Below.", 329, 8340022)
	AddQuestStepCompleteAction(Quest, 1, "Turnin")
	UpdateQuestZone(Quest,"The Down Below")
end

function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("Go to the Down Below in the catacombs. In the Down Below, you must slay several gunks and fill my vials with their extract. Leave immediately! I need these ingredients to complete my research.")
	Dialog.AddVoiceover("voiceover/english/yanari_cyellann/qey_village04/yanaricyellan005.mp3",3750763447,1479813412)
 	PlayFlavor(QuestGiver, "", "", "tapfoot", 0,0 , Player)
    Dialog.AddOption("I will be back with your substance extract.")
    Dialog.Start()
end

function Declined(Quest, QuestGiver, Player)
	-- Add dialog here for when the quest is declined
end

function Deleted(Quest, QuestGiver, Player)
	-- Remove any quest specific items here when the quest is deleted
end

function Turnin(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 1, "I have killed some crypt substances.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I have slain six crypt substances and filled the vials.")

	UpdateQuestZone(Quest,"Castleview Hamlet")
	AddQuestStepChat(Quest, 2, "I need to return to Yanari.", 1,"I need give Yanari these vials of crypt substance claws in Castleview.", 174, 2360047)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I have returned to Yanari.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I have delievered the filled vials to Yanari Cyellann.")

	UpdateQuestDescription(Quest, "I have collected six vials of crypt substance extract and returned them to Yanari. She has paid me for my service.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		Turnin(Quest, QuestGiver, Player)
    elseif Step == 2 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end
