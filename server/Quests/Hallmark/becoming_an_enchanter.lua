--[[
    Script Name    : Quests/Hallmark/becoming_an_enchanter.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.29 03:09:11
    Script Purpose : 

        Zone       : Hallmark
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]
require "SpawnScripts/Generic/DialogModule"

function Init(Quest)
	AddQuestStep(Quest, 1, "I need to make an example of the Seafuries.", 1,100, "I need to find these Seafuries and make an example of them.  I should look for a way to do this without directly involving myself.", 11)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
end

function Accepted(Quest, QuestGiver, Player)
    FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)   
 	Dialog.AddDialog("The Seafuries are Lucan's  private navy.  At least that's how they present themselves. But everyone knows they're ar nothing more than a bunch of pirates.  In between smuggling operations, those swashbucklers manage to keep the seas safe from orcs and the Qeynosians, and perhaps even more.  When they're not out at sea, they're based out of the Back Alley Brewhouse.  Talk to Thuddfoot. He'll tell you more.")
    Dialog.AddOption("It will be done, Arcanist.")	
	Dialog.Start()
end

function Declined(Quest, QuestGiver, Player)
	-- Add dialog here for when the quest is declined
end

function Deleted(Quest, QuestGiver, Player)
	-- Remove any quest specific items here when the quest is deleted
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "The Seafuries have been roughed up.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I convinced Bulz the troll to defeat a couple of Seafuries for me.  I handled the first mate myself.")

	AddQuestStepChat(Quest, 2, "I need to speak with Sonius.", 1, "I need to tell Arcanist Sonius that the job is taken care of.", 11, 1)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 2, "I spoke to Arcanist Sonius.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I spoke to Arcanist Sonius.")

	UpdateQuestDescription(Quest, "I convinced a troll named Bulz near the Seafuries to attack the men saving me the trouble of doing it myself.  Unfortunately a member of their crew was wise to my scheme and attacked me directly.  I had to be a little more... direct with him.  I reported back to Arcanist Sonius soon afterwards.  She was pleased with my work and bestowed upon me the title of Enchanter.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		Step1Complete(Quest, QuestGiver, Player)
	elseif Step == 2 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end