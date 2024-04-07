--[[
	Script Name		:	a_dramatic_performance.lua
	Script Purpose	:	Handles the quest, "A Dramatic Performance"
	Script Author	:	torsten
	Script Date		:	19.07.2022
	Script Notes	:	

	Zone			:	Longshadow Alley
	Quest Giver		:	Maliz T`Raan
	Preceded by		:	Taking it Out on the Raiders
	Followed by		:	A Shady Clearing
--]]

require "SpawnScripts/Generic/DialogModule"

function Init(Quest)
	AddQuestStepChat(Quest, 1, "Talk to Pavo Nightfire in Beggar's Court.", 1, "Talk to Pavo Nightfire in Beggar's Court, in front of a building to the east of the inn.", 11, 1370048)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I have found and spoken to Pavo Nightfire.")
	UpdateQuestTaskGroupDescription(Quest, 1, "Pavo seemed upset by that message. I would have thought he would have been happy by it, considering how much the performance moved Maliz's friend.")
    
    AddQuestStepChat(Quest, 2, "I should return to Imnat and let him know that Pavo Nightfire can do his part now.", 1, "Pavo has asked me to return a message to Maliz. The message is that the understudies will be performing tomorrow night, except Maliz needs to set up the stage first.", 11, 1380030)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end


function QuestComplete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I delivered the message to Pavo Nightfire.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I delivered the message to Pavo Nightfire in Beggar's Court.")
 	UpdateQuestDescription(Quest, "Maliz seemed a lot different than I was expecting. He accepted the message, and suggested I talk to his friend, Inmat, for some more employment. I'm curious as to what this is all about.")
	GiveQuestReward(Quest, Player)
end

function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("I'm not certain of your motives, but nonetheless, I will entrust you with this message. Go to the human's district and look for a man named Pavo. Tell him the acting troupe's performance brought my friend to tears. I need to know his response. For your sake, I hope you return quickly...")
    PlayFlavor(QuestGiver,"","","agree",0,0,Player)
	Dialog.AddOption("Touching... I'll see he get's this.")
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


