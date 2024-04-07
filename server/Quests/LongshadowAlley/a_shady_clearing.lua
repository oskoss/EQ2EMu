--[[
	Script Name		:	a_shady_clearing.lua
	Script Purpose	:	Handles the quest, "A Shady Clearing"
	Script Author	:	torsten
	Script Date		:	19.07.2022
	Script Notes	:	

	Zone			:	Longshadow Alley
	Quest Giver		:	Imnat D`Vren
	Preceded by		:	A Dramatic Performance
	Followed by		:	None
--]]
require "SpawnScripts/Generic/DialogModule"

function Init(Quest)
	AddQuestStepKill(Quest, 1, "I must kill ten diseased ratonga", 10, 100, " I need to venture to the sewers and kill ten diseased ratonga", 611, 1540002, 1540021, 1540022, 1540024, 1540028, 1540072, 1540073)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
	UpdateQuestZone(Quest,"Thieves Way")
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I have killed ten diseased ratonga.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I've killed ten of the diseased ratonga and made sure the way is clear for Imnat's treasure.")
	UpdateQuestZone(Quest,"Longshadow Alley")
    AddQuestStepChat(Quest, 2, "I should return to Imnat D`Vren.", 1, "I should return to Imnat D`Vren in Longshadow Alley.", 11, 1380031)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I've informed Imnat that sewers have less diseased ratonga.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I've informed Imnat that sewers have a few less diseased ratonga to get in the way.")
    UpdateQuestDescription(Quest, "I've cleared the way for Imnat's treasure to show up. I'm not sure what this is all about, but it feels rather important. Imnat said that in time I may be told more about how this treasure will 'liberate' the Teir'Dal from Lucan's grasp.")
	GiveQuestReward(Quest, Player)
end

function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("We're giving Pavo Nightfire another chance to make up for his past failure. You killed the raiders hired by Pavo to ensure an invaluable treasure made it safely into our hands.  His attempt met with dismal failure, but this will not dissuade us from trying to transport the treasure again. Before we attempt another delivery, we need to clear the sewers of the diseased refugees who live there. Go and kill some of these ailing peasants and return.")
    PlayFlavor(QuestGiver,"","","agree",0,0,Player)
	Dialog.AddOption("For treasure's sake, I will purge the sewers of this refuse!")
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


