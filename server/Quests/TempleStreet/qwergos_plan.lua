--[[
    Script Name    : Quests/TempleStreet/qwergos_plan.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.30 03:10:53
    Script Purpose : 

        Zone       : TempleStreet
        Quest Giver: Merchant Qwergo
        Preceded by: None
        Followed by: 
--]]
require "SpawnScripts/Generic/DialogModule"

function Init(Quest)
	AddQuestStepChat(Quest, 1, "I need to speak with Plordo somewhere in Temple Street.", 1, "Plordo is the gnome who has an Ignitty Rumble-ator... or something like that.", 11, 1360008)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I have spoken with Plordo.")
	UpdateQuestTaskGroupDescription(Quest, 1, "Plordo claims he gave his last one to a person named Chrna.")
	AddQuestStepChat(Quest, 2, "I need to speak with Chrna near the gates to South Freeport.", 1, "Chrna has Plordo's last Rumbleystick and is around here somewhere... I just need to find her.", 11, 1360007	)
	AddQuestStepCompleteAction(Quest, 2, "Step2Complete")
end

function Step2Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I have spoken to Chrna.")
	UpdateQuestTaskGroupDescription(Quest, 2, "Chrna gave me the Rumblebumbler... I should have asked her why it was ticking.")
	AddQuestStepChat(Quest, 3, "I need to speak with Qwergo.", 1, "Now that I have the Ignitor Rumblestick, I should bring it back to Qwergo. I should also ask him why it's ticking.", 11, 1360026	)
	AddQuestStepCompleteAction(Quest, 3, "QuestComplete")
end

function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("Wonderful, wonderful! Go at once to my supplier, Plordo Blotterdook, who plies his trade on the other side of Temple Street.  He will happily procure for you one operational igniter rumblerod ... that is, if he has not detonated them all blowing open yet another wall within his home.")
	Dialog.AddVoiceover("voiceover/english/merchant_qwergo_togglesmeet/fprt_hood03/quests/qwergotogglesmeet/qwergo_x1_accept.mp3", 1719061225, 3310642577)
    PlayFlavor(QuestGiver,"","","happy",0,0,Player)
    Dialog.AddOption("Assuming he didn't blow up, I'll find him.")
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
	UpdateQuestStepDescription(Quest, 3, "I gave Qwergo his thingie that he wanted.")
	UpdateQuestTaskGroupDescription(Quest, 3, "I gave Qwergo his thingie that he wanted.")

	UpdateQuestDescription(Quest, "Qwergo has paid me for picking up a Rumblestick for him. He was busy playing with the buttons and strings on it, so I'm not too sure what it is used for.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		Step1Complete(Quest, QuestGiver, Player)
	elseif Step == 2 then
		Step2Complete(Quest, QuestGiver, Player)
	elseif Step == 3 then
		QuestComplete(Quest, QuestGiver, Player)
		end
end
