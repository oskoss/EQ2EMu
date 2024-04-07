--[[
    Script Name    : Quests/Hallmark/becoming_a_summoner.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.01 01:10:01
    Script Purpose : 

        Zone       : Hallmark
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]
require "SpawnScripts/Generic/DialogModule"


function Init(Quest)
	AddQuestStep(Quest, 1, "I need to destroy an Earth Elemental of my own creation.", 1, 100, "I need to create and destroy an Earth Elemental while inside the Academy chamber.", 10)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
end

function Accepted(Quest, QuestGiver, Player)
    FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)   
 	Dialog.AddDialog("Make your way to the prepared chamber in the academy and find an apprentice's manual. In the manual, find a method for summoning minions from the earth. Create an elemental and then destroy it.  Do this and you will prove you are worthy of the title summoner.")
	Dialog.AddVoiceover("voiceover/english/arcanist_sonius/fprt_north/arcanistsonius026.mp3",  2862344835, 755954330)
    Dialog.AddOption("Thank you, Arcanist. I will return.")	
	Dialog.Start()
end

function Declined(Quest, QuestGiver, Player)
	-- Add dialog here for when the quest is declined
end

function Deleted(Quest, QuestGiver, Player)
	-- Remove any quest specific items here when the quest is deleted
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I defeated my Earth Elemental.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I defeated my Earth Elemental creation.")

	AddQuestStepChat(Quest, 2, "I need to speak with the Arcanist.", 1, "I need to report back to Arcanist Sonius.", 11,1440463)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 2, "I spoke with the Arcanist.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I have spoken to Arcanist Sonius.")

	UpdateQuestDescription(Quest, "I defeated Dasicar T'Lys in a duel of mages.  Arcanist Sonius was surprised that I won and Dasicar was the vanquished.  It doesn't matter.  I am the one that is now the Sorcerer.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		Step1Complete(Quest, QuestGiver, Player)
	elseif Step == 2 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end
