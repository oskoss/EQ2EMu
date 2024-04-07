--[[
	Script Name		:	bronas_thralls.lua
	Script Purpose	:	Handles the quest, "Brona's Thralls"
	Script Author	:	torsten
	Script Date		:	11.07.2022
	Script Notes	:	

	Zone			:	Big Bend
	Quest Giver		:	Slaver Brona
	Preceded by		:	None
	Followed by		:	Brona's Guard Check
--]]

require "SpawnScripts/Generic/DialogModule"

function Init(Quest)
	AddQuestStepChat(Quest, 1, "I need to speak with Bartender Icebrew in the Scale Yard.", 1, "I've got to let Bartender Icebrew from the Scale Yard district know that Brona has new thralls for him to choose from.", 11, 1390051)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I've spoken with Bartender Icebrew.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I've informed Bartender Icebrew of Brona's new thralls.")

    AddQuestStepChat(Quest, 2, "I should return to Brona.", 1, "I should return to Brona to tell her that I have delivered the message.", 11, 1340030)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	UpdateQuestDescription(Quest, "Running errands for Slaver Brona wasn't as bad as I had imagined... Perhaps I'll offer my services again.")
	GiveQuestReward(Quest, Player)
end

function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("Oh?  Then drag your sorry carcass to Bartender Icebrew of Scale Yard.  Tell him I have new thralls for him to buy.  Tell him to hurry, 'cause they won't last.  Come back here, and I'll let ya' have a copper.")
	Dialog.AddVoiceover("voiceover/english/slaver_brona/fprt_hood1/quests\brona/brona_x1_accept.mp3",4231567409,3154108942)
    PlayFlavor(QuestGiver, "","","stare",0,0, Player)
	Dialog.AddOption("You better! I'm not doing this for free!")
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

