--[[
	Script Name		:	verins_new_thralls.lua
	Script Purpose	:	Handles the quest, "Verin's New Thralls"
	Script Author	:	torsten/Dorbin
	Script Date		:	24.07.2022
	Script Notes	:	Auto generated with QuestParser.

	Zone			:	Scale Yard
	Quest Giver		:	Verin Ithelz
	Preceded by		:	None
	Followed by		:	Preventative Maintenance
--]]
require "SpawnScripts/Generic/DialogModule"


function Init(Quest)
	AddQuestStepKill(Quest, 1, "I must kill ten Dervish crooks.", 10, 100, "I should travel to the Sprawl and start beating on these dervish crooks.", 611, 1260000)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
    UpdateQuestZone(Quest,"The Sprawl")
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I have killed the Dervish crooks.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I've beaten up ten of the dervishes.")
    UpdateQuestZone(Quest,"Scale Yard")
	AddQuestStepChat(Quest, 2, "I should return to Verin Ithelz.", 1, "They didn't take too long before they died, so I don't think Verin will be pleased with these potential replacements for his current thralls. I should let him know this.", 11, 1390020)
    AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I have spoken with Verin.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I have told Verin about the durability of the dervishes, or lack thereof.")
    UpdateQuestDescription(Quest, "Verin paid me for testing the dervish crooks' mettle and let me keep one of their manacles. He told me that he may have further use of me in the future, so I should check back with him later.")
	GiveQuestReward(Quest, Player)
end

function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("I've been considering the chattel that runs free in the Sprawl.  You know ... those roustabouts who call themselves Guttersnipes.  Ha!  I want to know how much of a beating they can take before they're no longer ... ah ... useful.  Yes.  Go to the Sprawl and very slowly kill some of them.  Return to me with your report, and I will pay you in coin.")
	--Dialog.AddVoiceover("voiceover/english/colin_stoutfist/fprt_hood06/quests/colinstoutfist/colin_x1_accept.mp3",1343954066,3596296789)
    PlayFlavor(QuestGiver, "","","tapfoot",0,0, Player)
	Dialog.AddOption("I'll see how long they last. You better have that coin ready!")
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

