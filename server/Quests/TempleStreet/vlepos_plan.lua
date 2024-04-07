--[[
    Script Name    : Quests/TempleStreet/vlepos_plan.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.30 11:10:47
    Script Purpose : 

        Zone       : TempleStreet
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]
require "SpawnScripts/Generic/DialogModule"

function Init(Quest)
	AddQuestStepChat(Quest, 1, "I need to speak with Shinska.", 1, "Shinska should be around here somewhere. I need to think of a way to steal the weapon.", 11, 1360221)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I have spoken with Shinska.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I stole the weapon right from under her rather large nose.")

	AddQuestStepChat(Quest, 2, "I need to speak with Vlepo.", 1, "Now that I have the weapon, I should bring it back to Vlepo like he asked.", 284, 1360018	)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end



function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("Good. I pay you only after you finish job. Find the Shinska and take one of her weapons. When you have it, bring it back here. Be sneaky ... don't let the Shinska know what you are doing.")
--	Dialog.AddVoiceover("voiceover/english/merchant_qwergo_togglesmeet/fprt_hood03/quests/qwergotogglesmeet/qwergo_x1_accept.mp3", 1719061225, 3310642577)
    PlayFlavor(QuestGiver,"","","agree",0,0,Player)
    Dialog.AddOption("She'll never know what happened.")
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
	UpdateQuestStepDescription(Quest, 2, "I have spoken to Vlepo.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I have given Vlepo the weapon.")

	UpdateQuestDescription(Quest, "Vlepo plans on taking the weapon I stole from Shinska and planting it in the Togglesmeets' stall. After that he'll call the guards, framing the gnomes for the theft. Whether it works or not, I've been paid for my time in coin and drink, which is all that matters.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		Step1Complete(Quest, QuestGiver, Player)
	elseif Step == 2 then
		QuestComplete(Quest, QuestGiver, Player)
		end
end
