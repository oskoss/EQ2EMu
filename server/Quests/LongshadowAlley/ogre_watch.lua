--[[
	Script Name		:	ogre_watch.lua
	Script Purpose	:	Handles the quest, "Ogre Watch"
	Script Author	:	torsten/Dorbin
	Script Date		:	18.07.2022
	Script Notes	:	

	Zone			:	Longshadow Alley
	Quest Giver		:	Orian D`Rak
	Preceded by		:	None
	Followed by		:	Information Gathering From a Fishmonger
--]]
require "SpawnScripts/Generic/DialogModule"

function Init(Quest)
	AddQuestStepChat(Quest, 1, "I need to speak with Azreana", 1, "I need to deliver this package to Azreana.", 11, 1350030)
	AddQuestStepCompleteAction(Quest, 1, "QuestComplete")
	UpdateQuestZone(Quest,"Stonestair Byway")
end


function QuestComplete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I've delivered the package in one piece.")
    UpdateQuestTaskGroupDescription(Quest,1,"I've delivered the package as requested to Azreana.")	
	UpdateQuestDescription(Quest, "Azreana was able to understand what the message said, and acted as if it was rather important. I might want to check back with Orian at a later time to see if he needs any more help.")
	GiveQuestReward(Quest, Player)
end


function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("I'm pleased that not everyone is stupid enough to look the other way while the ogres embed themselves in the Freeport Militia.  I need a message delivered to an associate.  It's time to take a stand, and I must inform her.  Take this note to an Erudite named Azreana living in Stonestair Byway.  Do not return here!  No one must see you!")
--	Dialog.AddVoiceover("voiceover/english/optional1/kylanith_d_lar/fprt_hood05/qst_kylanith_hail.mp3", 387692981, 2731095766)
	Dialog.AddOption("I'll make sure Azreana gets this.")
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
	    QuestComplete(Quest, QuestGiver, Player)
	end
end


