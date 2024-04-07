--[[
	Script Name		:	door_to_door_anger.lua
	Script Purpose	:	Handles the quest, "Door to Door Anger"
	Script Author	:	torsten\\Dorbin
	Script Date		:	21.07.2022
	Script Notes	:	

	Zone			:	Scale Yard
	Quest Giver		:	Evelyn Stoutfist
	Preceded by		:	None
	Followed by		:	None
--]]
require "SpawnScripts/Generic/DialogModule"


function Init(Quest)
	AddQuestStepChat(Quest, 1, "I need to speak with Plordo.", 1, "I need to get Plordo the gnome to give Evelyn's money back.", 11, 1360008)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
	UpdateQuestZone(Quest,"Temple Street")
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I have spoken with Plordo.")
	UpdateQuestTaskGroupDescription(Quest, 1, "Plordo is quite adamant over the fact that he won't offer a refund.")

	AddQuestStepChat(Quest, 2, "I need to talk with Evelyn.", 1, "I need to let Evelyn know that the gnome will not be giving her a refund.", 11, 1390023)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
	UpdateQuestZone(Quest,"Scale Yard")
end

function QuestComplete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I have spoken to Evelyn.")
	UpdateQuestTaskGroupDescription(Quest, 2, "Evelyn seemed to take the news rather well. That's the part that scares me.")
	UpdateQuestDescription(Quest, "Evelyn Stoutfist was pretty upset when she heard the news about not getting a refund. I think she's planning to do something to the gnome.")
	GiveQuestReward(Quest, Player)
end


function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("Unless you can fix the contraption, but it's completely broken, thanks to that no-good gnome.  If you want to help, go find that scoundrel and get my money back.  I think his name is Plordo Blotty or something.  His shop is in the Districts.")
	Dialog.AddVoiceover("voiceover/english/evelyn_stoutfist/fprt_hood06/quests/evelynstoutfist/evelyn_x1_accept.mp3",0,0)
    PlayFlavor(QuestGiver, "","","confused",0,0, Player)
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

