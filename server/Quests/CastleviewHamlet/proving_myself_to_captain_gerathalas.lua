--[[
    Script Name    : Quests/CastleviewHamlet/proving_myself_to_captain_gerathalas.lua
    Script Author  : Dorbin
    Script Date    : 2022.01.27 09:01:04
    Script Purpose : 

        Zone       : CastleviewHamlet
        Quest Giver: Captain Gerathalas
        Preceded by: None
        Followed by: 
--]]
require "SpawnScripts/Generic/DialogModule"

function Init(Quest)
	AddQuestStepKill(Quest, 1, "I must kill some putrid vermin.", 6, 100, "I need to collect six putrid vermin tails for Captain Gerathalas from the Catacombs.", 99, 1990008, 1990010,8340033,8340041)
	AddQuestStepCompleteAction(Quest, 1, "RatHunted")
	UpdateQuestZone(Quest, "The Down Below")
end

function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("Good, good! The vermin live in the catacombs. Bring me back some of those putrid rat's tails and I'll reward you with a piece of armor.")
	Dialog.AddVoiceover("voiceover/english/knight-captain_gerathalas/qey_village04/captaingerathalas001.mp3",1809197225,35106101)
 	PlayFlavor(QuestGiver, "", "", "agree", 0,0 , Player)
   Dialog.AddOption("Great, I'll be right back to prove how well I can take care of myself.")
   Dialog.Start()
  end

function Declined(Quest, QuestGiver, Player)
	-- Add dialog here for when the quest is declined
end

function Deleted(Quest, QuestGiver, Player)
	-- Remove any quest specific items here when the quest is deleted
end

function RatHunted(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 1, "I have killed some putrid vermin.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I collected the six putrid vermin tails that Captain Gerathalas wanted.")
    
    UpdateQuestZone(Quest, "Castleview Hamlet")
    AddQuestStepChat(Quest, 2, "I must return to Knight-Captain Gerathalas.", 1, "I need to collect six putrid vermin tails for Captain Gerathalas from the Catacombs.", 99, 2360031)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I returned to Gerathalas.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I've given proof to Captain Gerathalas proving I've delt with the putrid vermin.")
    
	UpdateQuestDescription(Quest, "I completed the task of collecting 6 putrid vermin tails for Captain Gerathalas. He seemed quite pleased with how well I did. He rewarded me with a piece of armor.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		RatHunted(Quest, QuestGiver, Player)
	end
	if Step == 2 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end