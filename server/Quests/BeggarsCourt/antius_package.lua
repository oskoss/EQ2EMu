--[[
	Script Name		:	antius_package.lua
	Script Purpose	:	Handles the quest, "Antius' Package"
	Script Author	:	torsten
	Script Date		:	15.07.2022
	Script Notes	:	

	Zone			:	Beggar's Court
	Quest Giver		:	Antius Vedrix
	Preceded by		:	None
	Followed by		:	None
--]]
require "SpawnScripts/Generic/DialogModule"


function Init(Quest)
	AddQuestStepChat(Quest, 1, "I need to speak with Mirin.", 1, "I need to bring this package to an Iksar in Scale Yard, I think Antius said the Iksar was named Mirini, or Mirin, or something.", 11, 1390006)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
    UpdateQuestZone(Quest,"Scale Yard")	
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I have spoken with Mirin.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I gave the package to Mirin, but now I have a message I need to give back to Antius.")
    UpdateQuestZone(Quest,"Beggar's Court")	
	AddQuestStepChat(Quest, 2, "I need to tell Antius that \"it's getting bigger\" and the Iksar needs \"more hooks.\"", 1, "I gave the package to Mirin, but now I have a message I need to give back to Antius.", 11, 1370008)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end


function QuestComplete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I have spoken with Antius.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I told Antius that more hooks were needed for something that has become bigger.")
	
	UpdateQuestDescription(Quest, "Antius Vedrix has been given his message. I have absolutely no idea what's going on, or what I might have gotten myself into. I think I'll just avoid these people for the time being.")
	GiveQuestReward(Quest, Player)
end

function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("Ahh ... got it! Don't worry. Your secret is safe with me. I'll make sure no one suspects anything. I heard you guys were modest, the true mark of a professional. Make sure Mirin knows I did my part, understand?  I don't want to go down to the Scale Yard and apologize. Now I'll stop chatting and let you be on your way...")
	Dialog.AddVoiceover("voiceover/english/antius_vedrix/fprt_hood04/quests/antiusvedrix/antius_x1_accept.mp3", 101860654, 1539510243)
	PlayFlavor(QuestGiver, "", "", "agree", 0, 0, Player, 0)
	Dialog.AddOption("Fine. Perhaps I'll find some answers there...")
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

