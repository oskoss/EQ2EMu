--[[
    Script Name    : Quests/Hallmark/priest_training.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.29 04:09:33
    Script Purpose : 

        Zone       : Hallmark
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]
require "SpawnScripts/Generic/DialogModule"

function Init(Quest)
	AddQuestStepKill(Quest, 1, "Kill Diseased Ratonga", 5, 100, "Priest Kelian has suggested that I free the Diseased Ratonga in the Thieves' Way from their pain.    I can reach the Thieves' Way by using the sewer entrances in and around the City of Freeport.", 611, 8430010, 8430009, 8430011, 1540002, 1540073, 1540072, 1540028, 1540024, 1540022, 1540021)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
    UpdateQuestZone(Quest,"Thieves' Way")
end

function Accepted(Quest, QuestGiver, Player)
    FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)   
 	Dialog.AddDialog("Three paths lead down the road to enlightenment, child. Let me explain: The first path is that of the cleric, a healer and comforter. As we speak, ratonga inflicted with a vile disease fill the sewers beneath our feet. You must ease their pain. Venture below and put some of these creatures out of their misery.")
	Dialog.AddVoiceover("voiceover/english/priest_kelian/fprt_north/priestkelian002.mp3", 4221398277, 318277158)
    PlayFlavor(QuestGiver, "", "", "agree", 0, 0, Player)
    Dialog.AddOption("As you say. I will return soon.")	
	Dialog.Start()
end

function Declined(Quest, QuestGiver, Player)
	-- Add dialog here for when the quest is declined
end

function Deleted(Quest, QuestGiver, Player)
	-- Remove any quest specific items here when the quest is deleted
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I laid to rest five Diseased Ratonga.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I have stopped the suffering of five Diseased Ratonga by sending them to the sweet embrace of death.")
    UpdateQuestZone(Quest,"Multiple Zones")

	AddQuestStepChat(Quest, 2, "Speak with Priest Kelian", 1, "I should return to Kelian in the City of Freeport for continued guidance.", 11, 1440466)
	AddQuestStepCompleteAction(Quest, 2, "Step2Complete")
end

function Step2Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I have spoken with Priest Kelian.")
	UpdateQuestTaskGroupDescription(Quest, 2, "Priest Kelian was pleased with my compassion towards those Ratonga. He has explained that Clerics heal people in many different ways.")
    UpdateQuestZone(Quest,"South Freeport")

	AddQuestStepLocation(Quest, 3, "Find out if foreign plants are being sold in Freeport", 1, "The Priest wishes me to track down any foreign plants. I should speak with the following people in the City of Freeport to see if they have any foreign plants: Torlig the Alchemist, Alypia Damian at the Trader's Holiday, and Annia Kaeso down by the docks.", 340,1660026,1280043,1440007)
	AddQuestStepCompleteAction(Quest, 3, "Step3Complete")
end

function Step3Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 3, "I have found a purple flower that has traveled from across the ocean.")
	UpdateQuestTaskGroupDescription(Quest, 3, "The only foreign plant I was able to find was a purple flower given to me by Annia Kaeso.")
    UpdateQuestZone(Quest,"North Freeport")

	AddQuestStepChat(Quest, 4, "Speak with Priest Kelian", 1, "I should bring this flower back to Priest Kelian in the City of Freeport so that he can see what I have found.", 11, 1440466)
	AddQuestStepCompleteAction(Quest, 4, "Step4Complete")
end

function Step4Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 4, "I have spoken with Priest Kelian")
	UpdateQuestTaskGroupDescription(Quest, 4, "I have given Priest Kelian the flower, but he claims this wasn't the source of the disease.")
    UpdateQuestZone(Quest,"The Sprawl")

	AddQuestStepKill(Quest, 5, "Collect gravel viper poison sacs", 5, 70, "The Priest has told me to trust in my guiding spirits to direct me to the gravel vipers that contains the most lethal poison in the Sprawl.  I can reach the Sprawl by using any of the bells in and around the City of Freeport.", 113, 8400009, 1260006)
	AddQuestStepCompleteAction(Quest, 5, "Step5Complete")
end

function Step5Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 5, "I found and five gravel viper poison sacs.")
	UpdateQuestTaskGroupDescription(Quest, 5, "The spirits have guided me to the deadliest of the gravel viper. I've collected their poison sacs for the Priest.")
    UpdateQuestZone(Quest,"North Freeport")

	AddQuestStepChat(Quest, 6, "I should talk to Priest Kelian.", 1, "I should bring these poison sacs back to Priest Kelian in the City of Freeport.", 11, 1440466)
	AddQuestStepCompleteAction(Quest, 6, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 6, "I have spoken with Priest Kelian.")
	UpdateQuestTaskGroupDescription(Quest, 6, "Kelian has taken the poison sacs and plans on using them to cure the city of this disease.")

	UpdateQuestDescription(Quest, "I have told Proctor Fergus the choice I have made towards my spiritual enlightenment. He has given me his blessing and told me to go forth and spread the word. Soon enough, I shall introduce my new-found faith to the heathens of this world.")
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
		QuestComplete(Quest, QuestGiver, Player)
	end
end
