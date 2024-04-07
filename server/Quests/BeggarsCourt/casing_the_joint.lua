--[[
	Script Name		:	casing_the_joint.lua
	Script Purpose	:	Handles the quest, "Casing the Joint"
	Script Author	:	torsten\\Dorbin
	Script Date		:	15.07.2022
	Script Notes	:	

	Zone			:	Beggar's Court
	Quest Giver		:	Lucius Vulso
	Preceded by		:	None
	Followed by		:	Into The Sewers For Lucius
--]]
require "SpawnScripts/Generic/DialogModule"


function Init(Quest)
	AddQuestStepChat(Quest, 1, "I need to talk with the Banker in Stonestair Byway.", 1, "I need to speak with the banker in Stonestair Byway. I need to get him to like me before he'll talk.", 11, 1350044)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
    UpdateQuestZone(Quest,"Stonestair Byway")	
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I have spoken with Banker Kamen.")
	UpdateQuestTaskGroupDescription(Quest, 1, "Banker Kaman has told me of a rumor about being able to tunnel into the vaults from the sewer.")
    UpdateQuestZone(Quest,"Beggar's Court")	
	AddQuestStepChat(Quest, 2, "I should return to Lucius Vulso.", 1, "I should let Lucius know about this supposed rumor.", 11, 1370036)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end



function QuestComplete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I've spoken with Lucius.")
	UpdateQuestTaskGroupDescription(Quest, 2, "Lucius has been given the information about the rumored lack of security in the Stonestair bank vault.")
	UpdateQuestDescription(Quest, "I've told Lucius about the rumored security leak in the vaults. It seems Lucius was having me ask around so that he wouldn't be the one identified for being suspicious.")
	GiveQuestReward(Quest, Player)
end

function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("I have a brilliant idea to make a lot of money out of no money at all. But, before I try this scheme, I need you to get some information. Go to the bank in Stonestair Byway and talk with the banker. Gain his trust, then find out how secure the vault is.  Got it?")
	Dialog.AddVoiceover("voiceover/english/lucius_vulso/fprt_hood04/quests/luciusvulso/lucius_x1_accept.mp3", 200782149, 3355305222)
	Dialog.AddOption("Got it.")
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

