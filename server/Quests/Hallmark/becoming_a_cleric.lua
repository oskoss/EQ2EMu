--[[
    Script Name    : Quests/Hallmark/becoming_a_cleric.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.29 02:09:48
    Script Purpose : 

        Zone       : Hallmark
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]
require "SpawnScripts/Generic/DialogModule"


function Init(Quest)
	AddQuestStepChat(Quest, 1, "I need to speak to Modinite Z'Vol.", 1, "I need to find Modinite Z'Vol and tell him I am ready for the Threshing.", 11, 1440466)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
end

function Accepted(Quest, QuestGiver, Player)
    FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)   
 	Dialog.AddDialog("Well, this remains to be seen, child. The Dismal Rage requires all aspiring clerics to undergo a test of fortitude to ensure they are strong enough to stand for their faith. The Threshing will test your body and soul. Only the truly devout will emerge from the refiner's fire to take their place as clerics. ")
	Dialog.AddVoiceover("voiceover/english/priest_kelian/fprt_north/priestkelian012.mp3", 1989505954, 504674124)
    PlayFlavor(QuestGiver, "", "", "agree", 0, 0, Player)
    Dialog.AddOption("If it is required of me, then it will be done.")	
	Dialog.Start()
end

function Declined(Quest, QuestGiver, Player)
	-- Add dialog here for when the quest is declined
end

function Deleted(Quest, QuestGiver, Player)
	-- Remove any quest specific items here when the quest is deleted
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I spoke to Modinite Z'Vol.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I found Modinite Z'Vol and spoke to him.")

	AddQuestStep(Quest, 2, "I need to survive the Threshing.", 1, 100, "I need to enter the room to undergo the Threshing and then speak to Modinite Z'Vol.  I must survive this test.", 11)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 2, "I survived the Threshing.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I survived the test and spoke to Z'Vol.")

	UpdateQuestDescription(Quest, "I survived the pain of the Threshing.  I have emerged purified and worthy of the title I now hold.  I am a Cleric.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		Step1Complete(Quest, QuestGiver, Player)
	elseif Step == 2 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end

