--[[
	Script Name		:	bring_out_your_souls.lua
	Script Purpose	:	Handles the quest, "Bring Out Your Souls"
	Script Author	:	premierio015\\Dorbin
	Script Date		:	25.06.2021
	Script Notes	:	Auto generated with QuestParser.

	Zone			:	Graveyard
	Quest Giver		:	 Zekvila Dizelk
	Preceded by		:	None
	Followed by		:	None
--]]
require "SpawnScripts/Generic/DialogModule"


function Init(Quest)
	AddQuestStepKill(Quest, 1, "Kill undead knights", 10, 100, "Zekvila asked me to destroy some undead knights in the Graveyard. I'll hold out the crystal as each one is destroyed.", 611, 1250007, 1250006, 1250010, 1250008, 1250018, 1250012, 1250013, 1250019, 1250030, 1250033, 1250026, 1250023, 1250028, 1250024, 1250021,8390034,8390040)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
    UpdateQuestZone(Quest,"Graveyard")
end

function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("You choose wisely, friend. I shall use the lessons taught to the Iksar by our dead emperor, Venril Sathir. This is where you come in ... the magic of the dead will put a stop to Ithelz's pompous belief that he is our new ruler.  I will tell you only once: take the crystal, go to the graveyard, and kill the undead knights. As the beasts die, hold out the crystal and collect their souls. Return when you fill the crystal.")
	Dialog.AddVoiceover("voiceover/english/zekvila_dizelk/fprt_hood06/quests/zekviladizelk/zekvila_x1_accept.mp3", 159211273, 3086323061)
	Dialog.AddOption("I understand. I'll be back when it's done.")
	Dialog.Start()
end

function Declined(Quest, QuestGiver, Player)
	-- Add dialog here for when the quest is declined
end

function Deleted(Quest, QuestGiver, Player)
	-- Remove any quest specific items here when the quest is deleted
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I have killed the undead.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I've killed ten undead and collected their souls.")
    UpdateQuestZone(Quest,"Scale Yard")

	AddQuestStepChat(Quest, 2, "Speak with Zekvila", 1, "I should return the crystal to Zekvila in the Scale Yard.", 1178, 1250034,1390128)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 2, "I have spoken with Zekvila.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I have given Zekvila the crystal filled with souls.")

	UpdateQuestDescription(Quest, "Zekvila was pleased with the crystal. She claims that it will help her topple her rival's rule. I think I may ask her later if she needs any more help, in case she actually is successful.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		Step1Complete(Quest, QuestGiver, Player)
	elseif Step == 2 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end
