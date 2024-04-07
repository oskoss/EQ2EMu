--[[
    Script Name    : Quests/TempleStreet/makeup_for_krysa.lua
    Script Author  : Dorbin
    Script Date    : 2023.11.07 09:11:10
    Script Purpose : 

        Zone       : TempleStreet
        Quest Giver: Krysa 
        Preceded by: None
        Followed by: 
--]]
require "SpawnScripts/Generic/DialogModule"

function Init(Quest)
	AddQuestStepChat(Quest, 1, "I need to speak with Brashk near the docks.", 1, "I need to find Brashk here in Temple Street and get the makeup from him.", 11, 1360043)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I've spoken with Brashk.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I've spoken to Brashk, but he says he doesn't have any more makeup. Supposedly he got it from some mage in Stonestair Byway.")

	AddQuestStepChat(Quest, 2, "I need to tell Krysa the bad news.", 1, "I should let Krysa that Brashk did not have any more makeup for her.", 11, 1360042)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end


function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("I lost the makeup that makes my lips so pretty. I think my ugly sister tooks it from me, but she says she didn't.  It could be that hag, Spezi ... hmmm ... Doesn't matter! I need more makeups but if I leave this bar, I make no money! Go to Brashk, he's a rubbish picker, and tell him I needs more makeup, okay? ")
	Dialog.AddVoiceover("voiceover/english/krysa/fprt_hood03/quests/krysa/krysa_x1_accept.mp3", 2773775534, 2917895269)
    PlayFlavor(QuestGiver,"","","pout",0,0,Player)
    Dialog.AddOption("I'll see if he has any.")
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
	UpdateQuestStepDescription(Quest, 1, "I've spoken to Krysa.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I have told Krysa about the fact that Brashk has no more makeup.")


	UpdateQuestDescription(Quest, "I told Krysa that Brashk didn't have any of the makeup and she had a conniption fit. I never even got my free drink!")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		Step1Complete(Quest, QuestGiver, Player)
	elseif Step == 2 then
		QuestComplete(Quest, QuestGiver, Player)
		end
end
