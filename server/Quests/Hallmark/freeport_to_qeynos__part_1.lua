--[[
    Script Name    : Quests/Hallmark/freeport_to_qeynos__part_1.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.25 07:09:12
    Script Purpose : 

        Zone       : Hallmark
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]
require "SpawnScripts/Generic/DialogModule"


function Init(Quest)
	AddQuestStepChat(Quest, 1, "I need to give Kenjedeau the secret code", 1, "I need to seek out Kenjedeau and tell him 'nobility comes from personal sacrifice'.  I've been told he's hiding somewhere within the Serpent Sewers below Freeport.", 11, 1550077)
	AddQuestStepCompleteAction(Quest, 1, "QuestComplete")
    UpdateQuestZone(Quest,"Serpent Sewer")
end

function Accepted(Quest, QuestGiver, Player)
    FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)   
 	Dialog.AddDialog("Then I welcome you into our fold, friend.  We need someone like you. Talk with the resistance leader here in Freeport, Kenjedeau.  You can find him in the sewers below. Seek him out and tell him our motto, \"nobility comes from personal sacrifice.\"")
	Dialog.AddVoiceover("voiceover/english/stilus_graphium/fprt_east/qst_stilusgraphium007.mp3", 1086694102, 636478984)
    Dialog.AddOption("Thank you. I'll make my way to him.")	
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
	UpdateQuestStepDescription(Quest, 1, "I've given Kenjedeau the secret code")
	UpdateQuestTaskGroupDescription(Quest, 1, "I've found Kenjedeau masquerading as a watchman of some sorts down in the sewers.")

	UpdateQuestDescription(Quest, "I have found and spoken to the head of the Qeynos resistance here in Freeport")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end
