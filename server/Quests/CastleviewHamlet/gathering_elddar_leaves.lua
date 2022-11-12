--[[
    Script Name    : Quests/CastleviewHamlet/gathering_elddar_leaves.lua
    Script Author  : Dorbin
    Script Date    : 2022.01.29 05:01:25
    Script Purpose : 

        Zone       : CastleviewHamlet
        Quest Giver: Scribe Bleemeb
        Preceded by: None
        Followed by: 
--]]
require "SpawnScripts/Generic/DialogModule"

function Init(Quest)
	AddQuestStepLocation(Quest, 1, "I need to gather Elddar leaves for Scribe Bleemeb.", 14, "I need to gather leaves from the base of the greatest Elddar tree in the grove.", 199, 663.74 -9.72 -373.53)
	AddQuestStepCompleteAction(Quest, 1, "LeavesGathered")
	UpdateQuestZone(Quest, "The Eldarr Grove")
end

function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("It is, it is! FrroOAK! She needs someone to fetch some leaves from the base of the tallest Eldarr tree. Say! I figured thou would'st do nicely for that. Why doth thou head over to the Eldarr grove and pick her up some leaves. Thou'st can't miss the tree! It has elves in it.")
	Dialog.AddVoiceover("voiceover/english/scribe_bleemeb/qey_village04/qst_scribebleemeb002.mp3",1766321211,1856541681)
 	PlayFlavor(QuestGiver, "", "", "agree", 0,0 , Player)
    Dialog.AddOption("I'll return with some of the Elddar leaves.")
    Dialog.Start()
end

function Declined(Quest, QuestGiver, Player)
	-- Add dialog here for when the quest is declined
end

function Deleted(Quest, QuestGiver, Player)
	-- Remove any quest specific items here when the quest is deleted
end

function LeavesGathered(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 1, "I've gathered the Elddar leaves for Scribe Bleemeb.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I've gathered a bundle of leaves from the base of the great Elddar tree for Bleemeb.")
	UpdateQuestZone(Quest, "Castleview Hamlet")

	AddQuestStepChat(Quest, 2, "I need to return to Scribe Bleemeb.", 1, "I've gathered leaves from the base of the greatest Elddar tree and need to return.", 199, 2360055, 2360045)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I've returned to Scribe Bleemeb.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I've returned with a bundle of leaves from the base of the great Elddar tree for Bleemeb.")

	UpdateQuestDescription(Quest, "I've gone ahead and returned all the leaves I found around the base of the great Elddar tree to Scribe Bleemeb. It seems that Yanari will have enough for her next research forray.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		LeavesGathered(Quest, QuestGiver, Player)
	end
		if Step == 2 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end

