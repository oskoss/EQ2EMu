--[[
    Script Name    : Quests/Hallmark/freeport_to_qeynos__acceptance.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.28 08:09:23
    Script Purpose : 

        Zone       : Hallmark
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]
require "SpawnScripts/Generic/DialogModule"

function Init(Quest)
--	AddStepZoneLoc(Quest, 1, "Travel to the inn and sign the registry.", 10, "\"Your new home awaits within the walls of Qeynos. I have arranged for a room to be made yours to house you. Sign the book and start your new life. Good luck, friend.\"", 11, 1)
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
	UpdateQuestTaskGroupDescription(Quest, 1, "I have found my new residence within Qeynos.")

	UpdateQuestDescription(Quest, "I have begun my new life in Qeynos with the help of my mentor, Vishra. No longer will I blindly turn away from the evils around me. Perhaps others will follow my example and do the same. If so, I will offer my help to them as others have helped me.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end
