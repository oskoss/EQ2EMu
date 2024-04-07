--[[
	Script Name		:	deposit_for_grekin.lua
	Script Purpose	:	Handles the quest, "Deposit for Grekin"
	Script Author	:	Dorbin
	Script Date		:	2/24/2022
	Script Notes	:	Auto generated with QuestParser.

	Zone			:	Starcrest Commune
	Quest Giver		:	Grekin
	Preceded by		:	None
	Followed by		:	None
--]]
require "SpawnScripts/Generic/DialogModule"


function Init(Quest)
	AddQuestStepChat(Quest, 1, "I need to deliver the deposit to banker Orudormo.", 1, "I have to deliver merchant Grekin's deposit to banker Orudormo in Starcrest.", 401, 2340031)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
end

function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
    PlayFlavor(QuestGiver, "", "", "agree", 0, 0, Player)
	Dialog.AddDialog("For starters, it is only a day's proceeds. Also, there are three guards between the banks and us. I'm pretty sure you would be caught if you tried to run. Aside from all that, you have a friendly face and I think I can trust you. Take this box to the bank and return with the receipt.")
	Dialog.AddVoiceover("voiceover/english/merchant_grekin/qey_village02/merchantgrekin001.mp3", 2487079650,1001036096)
	Dialog.AddOption("Okay. I will be back shortly with the receipt.")
	Dialog.Start()
end

function Declined(Quest, QuestGiver, Player)
	-- Add dialog here for when the quest is declined
end

function Deleted(Quest, QuestGiver, Player)
	-- Remove any quest specific items here when the quest is deleted
end

function Step1Complete(Quest)
  	UpdateQuestStepDescription(Quest, 1, "I've delivered Grekin's deposit to banker Orudormo.")
  
    
    AddQuestStepChat(Quest, 2, "I should return to Grekin.", 1, "I should let Grekin know I deposited his money in the bank.", 75, 2340037)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end


function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 2, "I let Grekin know I delievered his deposit to banker Orudormo.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I let Grekin know I delievered his deposit to to the bank")

	UpdateQuestDescription(Quest, "I deposited Grekin's money in the local bank.  His merchant tent was really very close to the bank after all; I hardly had any trouble finding it.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
	    Step1Complete(Quest, QuestGiver, Player)
	elseif Step == 2 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end

