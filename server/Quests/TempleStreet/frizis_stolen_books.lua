--[[
    Script Name    : Quests/TempleStreet/frizis_stolen_books.lua
    Script Author  : Dorbin
    Script Date    : 2023.11.06 08:11:49
    Script Purpose : 

        Zone       : TempleStreet
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]
require "SpawnScripts/Generic/DialogModule"

function Init(Quest)
	AddQuestStepKill(Quest, 1, "I've offered to kill Dervish crooks.", 10, 100, "I've offered to kill ten Dervish crooks so that she can have her revenge. I've heard on the streets they can be found hanging out in the Sprawl.", 611, 8400010)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
    UpdateQuestZone(Quest,"Sprawl")
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I've killed Dervish crooks.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I've taken care of the Dervish crooks like I told Frizi I would.")
    UpdateQuestZone(Quest,"Temple Street")
	AddQuestStepChat(Quest, 2, "I need to speak with Frizi.", 1, "I should return to Frizi and let her know the Guttersnipes are dealt with.", 11, 1360053)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end


function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("I appreciate the offer, but you're too late. The crooks who took them said they were going to use the pages to clean their ... backsides! Ooooh, it makes me so mad!! ... Kill them! YES! KILL them for me and I'll be more than happy. They ran off to the Sprawl. You'll find them wallowing in their own filth...")
    PlayFlavor(QuestGiver,"","","grumble",0,0,Player)
    Dialog.AddOption("Err... Sure. Good as dead.")
	Dialog.Start()
end

function Declined(Quest, QuestGiver, Player)
	-- Add dialog here for when the quest is declined
end

function Deleted(Quest, QuestGiver, Player)
	-- Remove any quest specific items here when the quest is deleted
end

function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 2, "I have spoken with Frizi.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I've informed Frizi that the Guttersnipe crooks are dead.")

	UpdateQuestDescription(Quest, "I've killed the Dervish for Frizi. That should be enough to pay them back for stealing her books.  Maybe I'll kill some more to sweeten the deal.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		Step1Complete(Quest, QuestGiver, Player)
	elseif Step == 2 then
		QuestComplete(Quest, QuestGiver, Player)
		end
end