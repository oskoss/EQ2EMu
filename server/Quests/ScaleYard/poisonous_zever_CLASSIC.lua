--[[
    Script Name    : Quests/ScaleYard/poisonous_zever_CLASSIC.lua
    Script Author  : Dorbin
    Script Date    : 2023.12.11 04:12:21
    Script Purpose : NEEDS NEW SPAWN IDS FOR CLASSIC

        Zone       : ScaleYard
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]
require "SpawnScripts/Generic/DialogModule"


function Init(Quest)
	AddQuestStepKill(Quest, 1, "I need to gather some putrid dragoon tongues for Zever's antidote.", 9, 100, "I need to kill nine putrid dragoon in Fallen Gate.", 89, 1190050)-- 1190050, 1190004, 1190008, 1190043, 1190045, 1190051, 1190052, 1190061, 1190062, 1190069)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
    UpdateQuestZone(Quest,"Fallen Gate")
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I've gathered putrid dragoon tongues for Zever's antidote.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I killed nine tormented souls in Fallen Gate.")
    UpdateQuestZone(Quest,"Scale Yard")

    AddQuestStepChat(Quest, 2, "I should return to Zever Tzizzink.", 1, "I should return to Zever Tzizzink to deliver the tongues.", 89, 1370024)
	AddQuestStepCompleteAction(Quest, 2, "Step2Complete")
end

function Step2Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I've taken the ingredients to Zever.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I returned to Zever Tzizzink.")
    UpdateQuestZone(Quest,"Fallen Gate")

	AddQuestStepKill(Quest, 3, "I need to gather some tainted wretch hearts for Zever's antidote.", 12, 100, "I need to get some tainted wretch hearts from zombies in Fallen Gate for Zever's antidote.", 1148,  1190004, 1190008, 1190043, 1190045, 1190051, 1190052, 1190061, 1190062, 1190069)
	AddQuestStepCompleteAction(Quest, 3, "Step3Complete")
end

function Step3Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 3, "I've gathered the tainted hearts for Zever's antidote.")
	UpdateQuestTaskGroupDescription(Quest, 3, "I've gathered the tainted hearts for Zever's antidote.")
    UpdateQuestZone(Quest,"Scale Yard")

    AddQuestStepChat(Quest, 4, "I should return to Zever Tzizzink.", 1, "I need to take these hearts back to Zever in the Scale Yard.", 1148, 1370024)
	AddQuestStepCompleteAction(Quest, 4, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
 	UpdateQuestStepDescription(Quest, 4, "I've taken the ingredients to Zever.")
	UpdateQuestTaskGroupDescription(Quest, 4, "I've taken Zever the ingredients I gathered for him.")
   UpdateQuestDescription(Quest, "That double-crossing sneak! Instead of getting ingredients for an antidote, Zever had me gathering ingredients for a deadly poison!  He thought he gave me a piece of junk for a reward, but he was mistaken!")
	GiveQuestReward(Quest, Player)
end

function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("Yes, but if I live, my revenge shall be so much sweeter! Now go, and hurry back!")
	Dialog.AddVoiceover("voiceover/english/zever_tzizzink/fprt_hood06/quests/zevertzizzink/zevertzizzink004.mp3",2397600191,3617877932)
	Dialog.AddOption("I'll do what I can.")
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
		Step2Complete(Quest, QuestGiver, Player)
	elseif Step == 3 then
		Step3Complete(Quest, QuestGiver, Player)
	elseif Step == 4 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end
