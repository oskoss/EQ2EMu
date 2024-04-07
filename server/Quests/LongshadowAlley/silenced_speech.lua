--[[
	Script Name		:	silenced_speech.lua
	Script Purpose	:	Handles the quest, "Silenced Speech"
	Script Author	:	torsten
	Script Date		:	20.07.2022
	Script Notes	:	

	Zone			:	Longshadow Alley
	Quest Giver		:	Captain L`Nek
	Preceded by		:	The Truth is out There
	Followed by		:	None
--]]
 require "SpawnScripts/Generic/DialogModule"


function Init(Quest)
	AddQuestStepKill(Quest, 1, "Slay Dervish crooks in the Sprawl until Kirs' signet ring is found.", 1, 30, " I need to find out which one of the Dervish crooks is Kirs. I'll need to slay all of the crooks until I find something indentifying him... or her.", 596, 1260000)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
    UpdateQuestZone(Quest,"Sprawl")
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "	I've found a signet ring on who I believe to be Kirs.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I found a ring with the name Kirs on it.  I'm pretty certain this Dervish crook was the one causing all of these problems.")
    UpdateQuestZone(Quest,"Longshadow Alley")
    AddQuestStepChat(Quest, 2, "Captain L'Nek should know the deed is done.", 1, "I should let Captain L'Nek know that Kirs won't be a problem any longer.", 11, 1380010)
    AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
    UpdateQuestStepDescription(Quest, 2, "I returned to Captain L`Nek with the news.")
	UpdateQuestTaskGroupDescription(Quest, 2, "The Captain didn't necessarily give me the reward I was expecting for helping him with Kirs.")
	UpdateQuestDescription(Quest, "The Captain didn't necessarily give me the reward I was expecting for helping him with Kirs.  I guess I shouldn't have expected much.")
	GiveQuestReward(Quest, Player)
end

function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("That's my worthy servant!  A gangrenous limb must be cut off before it infects the rest of the body.  If we do not want this traitorous sentiment to spread, we must ... cut ... Kirs G'Viz.  You will find him hiding among the Dervish crooks in the Sprawl, wearing some pathetic disguise.  Go to the Sprawl and kill until you find the one who is Kirs G'Viz.  I will pretend this conversation did not occur.")
    PlayFlavor(QuestGiver,"","","shakefist",0,0,Player)
	Dialog.AddVoiceover("voiceover/english/captain_l_nek/fprt_hood05/quests/captainlnek/lnek_x2_accept.mp3", 346613900, 1400494910) 
	Dialog.AddOption("What conversation?...")
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
