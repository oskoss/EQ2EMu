--[[
	Script Name		:	a_worthy_teacher.lua
	Script Purpose	:	Handles the quest, "A Worthy Teacher"
	Script Author	:	torsten\\Dorbin
	Script Date		:	21.07.2022
	Script Notes	:	

	Zone			:	Scale Yard
	Quest Giver		:	Zekvila Dizelk
	Preceded by		:	Bring Out Your Souls
	Followed by		:	None
--]]
require "SpawnScripts/Generic/DialogModule"


function Init(Quest)
	AddQuestStepChat(Quest, 1, "I need to find and speak to Raban.", 1, "I should be able to find this Raban person in the Stonestair Byway district.", 11, 1350037)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
    UpdateQuestZone(Quest,"Stonestair Byway")
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I have spoken to Raban.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I've spoken with Raban and she's given me a message that I don't think Zekvila will like.")
    UpdateQuestZone(Quest,"Scale Yard")

	AddQuestStepChat(Quest, 2, "I need to return to Zekvila.", 1, "I need to return to Zekvila in Scale Yard.", 11, 1390128)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I have spoken with Zekvila.")
	UpdateQuestTaskGroupDescription(Quest, 2, "Zekvila has received the message, and surprisingly I'm still alive.")
	UpdateQuestDescription(Quest, "Zekvila was outraged over the response she got from Raban. She even forgot to pay me. I don't think I should press the issue, though.")
	GiveQuestReward(Quest, Player)
end

function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("I want you to travel to Stonestair Byway and find an Erudite named Raban. She's insufferable, but is well-versed in the necromantic arts. She may be able to discen what I am doing wro-- ... I mean, what immense power I must summon. Give her this missive and treat her with respect. Do not trifle with her ... or with me.")
	Dialog.AddVoiceover("voiceover/english/zekvila_dizelk/fprt_hood06/quests/zekviladizelk/zekvila_x2_accept.mp3", 280848054, 3784973788)
	Dialog.AddOption("I'll go give her the message.")
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

