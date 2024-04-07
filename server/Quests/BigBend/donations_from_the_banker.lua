--[[
	Script Name		:	donations_from_the_banker.lua
	Script Purpose	:	Handles the quest, "Donations from the Banker"
	Script Author	:	torsten\\Dorbin
	Script Date		:	15.07.2022
	Script Notes	:

	Zone			:	Beggar's Court
	Quest Giver		:	Manius Galla
	Preceded by		:	Joining the Gang
	Followed by		:	None
--]]

require "SpawnScripts/Generic/DialogModule"

function Init(Quest)
	AddQuestStepChat(Quest, 1, "I need to speak with the banker Voranius in Beggar's Court.", 1, "I need to speak with the banker in Beggar's Court and make sure he hands over his \"donation.\"", 11, 1370012)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I've spoken with the banker Voranius in Beggar's Court.")
	UpdateQuestTaskGroupDescription(Quest, 1, "The banker was scared of my threat and gave his 'donation'. He also said some bad things about Manius.")
    
    AddQuestStepChat(Quest, 2, "I should return to Manius.", 1, "I should give Manius the banker's \"donation\" and also let him know what the banker said about him.", 11, 1370127)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I've spoken with the banker Voranius in Beggar's Court.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I've given Manius the \"donation\" and also let him know what the banker said. Hopefully I got it right.")
	UpdateQuestDescription(Quest, "I've collected the 'donation' from the banker and given it to Manius. I've also told Manius what the banker said about him. Needless to say, he wasn't too happy. I just realized that I forgot to ask him about joining his gang. Maybe I'll ask him some other time.")
	GiveQuestReward(Quest, Player)
end


function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("Go to that banker up in the Court.  Tell him it's time for us to make a \"withdrawal.\"  If he balks, ask him if his kin can afford any more ... accidents.  And if you try to keep the money, you'll have an accident.  A big one.  Got it?")
	Dialog.AddOption("Sure thing.")
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
