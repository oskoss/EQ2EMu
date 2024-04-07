--[[
	Script Name		:	information_gathering_from_a_fishmonger.lua
	Script Purpose	:	Handles the quest, "Information Gathering From a Fishmonger"
	Script Author	:	torsten
	Script Date		:	18.07.2022
	Script Notes	:	

	Zone			:	Longshadow Alley
	Quest Giver		:	Orian D`Rak
	Preceded by		:	Ogre Watch
	Followed by		:	None
--]]
require "SpawnScripts/Generic/DialogModule"


function Init(Quest)
	AddQuestStepChat(Quest, 1, "I need to speak with Tilzak in the Longshadow Alley.", 1, "Tilzak apparently is the local fishmonger. I need to see if I can get him to tell me the information I need.", 11, 1240026,1380131)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
    UpdateQuestZone(Quest,"Longshadow Alley")
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I have spoken with Tilzak")
	UpdateQuestTaskGroupDescription(Quest, 1, "Tilzak didn't tell me the information, but he apparently is far more than he appears to be.")
    
    AddQuestStepChat(Quest, 2, "I should return to Orian D`Rak.", 1, "I should return to Orian D`Rak in Longshadow Alley.", 11, 1380039)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
 	UpdateQuestStepDescription(Quest, 2, "I have told Orian what little I was able to find out.")
	UpdateQuestTaskGroupDescription(Quest, 2, "Tilzak didn't tell me the information, but he apparently is far more than he appears to be.")
    
	UpdateQuestDescription(Quest, "Orian D'Rak has decided to slow down his information gathering efforts. He will continue with his information gathering personally for now. He did reward me with some coin for my efforts, though.")
	GiveQuestReward(Quest, Player)
end

function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("I need you to find Tilzak N'Lim.  He lives close to here and is nothing more than a simple fishmonger!  What a disgrace!  A Teir'Dal performing the common chores of a slave!  From the new information, I am wondering if Tilzak is as simple as he appears.  Ask him for directions to \"the meeting place\" then return.")
--	Dialog.AddVoiceover("voiceover/english/optional1/kylanith_d_lar/fprt_hood05/qst_kylanith_hail.mp3", 387692981, 2731095766)
	Dialog.AddOption("I'll make him squirm to get the information.")
	Dialog.Start()
end

function Declined(Quest, QuestGiver, Player)
	-- Add dialog here for when the quest is declined
end

function Deleted(Quest, QuestGiver, Player)
	-- Remove any quest specific items here when the quest is deleted
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
	    Step1Complete(Quest, QuestGiver, Player)
	elseif Step == 2 then
	    QuestComplete(Quest, QuestGiver, Player)
	end
end

