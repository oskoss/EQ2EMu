--[[
    Script Name    : Quests/Hallmark/qeynos_to_freeport__acceptance.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.30 03:09:17
    Script Purpose : 

        Zone       : Hallmark
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]
require "SpawnScripts/Generic/DialogModule"

function Init(Quest)
--	AddStepZoneLoc(Quest, 1, "Travel to the inn and sign the registry.", 10, "\"Your new home awaits within the walls of Freeport.  I have arranged for a room to be made yours to house you.  Sign the book on the dotted line and the room will be yours.\"", 11, 1)
	AddQuestStepCompleteAction(Quest, 1, "QuestComplete")
end

function Accepted(Quest, QuestGiver, Player)
    FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)   
 	--Dialog.AddDialog("Then I welcome you into our fold, friend.  We need someone like you. Talk with the resistance leader here in Freeport, Kenjedeau.  You can find him in the sewers below. Seek him out and tell him our motto, \"nobility comes from personal sacrifice.\"")
	--Dialog.AddVoiceover("voiceover/english/stilus_graphium/fprt_east/qst_stilusgraphium007.mp3", 1086694102, 636478984)
   -- Dialog.AddOption("Thank you. I'll make my way to him.")	
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
	UpdateQuestStepDescription(Quest, 1, "I have found the registry.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I have found my new residence within Freeport.")

	UpdateQuestDescription(Quest, "I have begun a new life in Freeport with the help of my mentor, Matthias.  No longer will this world keep from me what is rightfully mine.  Those that stand against me will show themselves to be my enemies.   ...May the gods grant them the mercy that I can not...")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end
