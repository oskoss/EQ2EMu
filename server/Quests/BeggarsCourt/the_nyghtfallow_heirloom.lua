--[[
	Script Name		:	the_nyghtfallow_heirloom.lua
	Script Purpose	:	Handles the quest, "The Nyghtfallow Heirloom"
	Script Author	:	torsten\\Dorbin
	Script Date		:	17.07.2022
	Script Notes	:	

	Zone			:	Beggar's Court
	Quest Giver		:	Tsuul Nyghtfallow
	Preceded by		:	None
	Followed by		:	None
--]]
require "SpawnScripts/Generic/DialogModule"
--The following words appear to have been hastily scribbled on the back of the picture, "Vladin the Pale; the Sunken City. Father, I promise that your death will be avenged." It seems that Tsuul's brother was attempting to grow stronger so that he might avenge his father's death.

function Init(Quest)
	AddQuestStepKill(Quest, 1, "I must kill Guttersnipe hooligans until I find the pendant.", 1, 22, "I should kill Guttersnipe hooligans in The Sprawl until I find Nyghtfallow's Pendant.", 1244, 8400011)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I have killed the Guttersnipe hooligans and found the pendant.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I have killed some hooligans.")

    AddQuestStepChat(Quest, 2, "I must find Tsuul Nyghtfallow.", 1, "I must return the pendant to Tsuul Nyghtfallow in Beggar's Court.", 1244, 1370025)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I have found Tsuul Nyghtfallow.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I have returned to Tsuul Nyghtfallow.")
	UpdateQuestDescription(Quest, "I found and killed the dervish that held Tsuul Nyghtfallow's family pendant.  The item given in return is nice enough. ")
	GiveQuestReward(Quest, Player)
end

function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddLanguage(7)
	Dialog.AddDialog("Undoubtedly one of the Guttersnipes who killed my brother took the pendant. I'd suggest you start by rummaging through the Guttersnipes' corpses. When and if you recover the pendant, return to me and I'll give you your reward.")
	Dialog.AddOption("I'll see what I can do.")
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
