--[[
	Script Name		:	sword-chucks_of_doom.lua
	Script Purpose	:	Handles the quest, "Sword-Chucks of Doom"
	Script Author	:	torsten
	Script Date		:	23.07.2022
	Script Notes	:	

	Zone			:	Scale Yard
	Quest Giver		:	Arms Dealer Shilza
	Preceded by		:	None
	Followed by		:	None
--]]
require "SpawnScripts/Generic/DialogModule"

function Init(Quest)
	AddQuestStepChat(Quest, 1, "I need to speak with a Barbarian named Briac Tundrafire.", 1, "Once I find Briac Tundrafire, I need to tell him his 'sword-chucks' are in.", 11, 1390053)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I have spoken with Briac Tundrafire.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I let Briac Tundrafire know his sword-chucks were in . He seemed quite happy about it.")

    AddQuestStepChat(Quest, 2, "I should return to Shilza.", 1, "Tundrafire said he'll be by later, so I should let Shilza know about it.", 11, 1390046)
    AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 2, "I have spoken with Shilza.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I have told Shilza about Briac Tundrafire stopping by later.")

	UpdateQuestDescription(Quest, "Shilza has paid me for giving Briac the message his 'sword-chucks' are in. I'm not too sure which person Shilza was referring to when she said that weapon would sever someone's head from their shoulders.")
	GiveQuestReward(Quest, Player)
end

function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("He has one of those impossible barbarian names ... BurningIcelands or WastelandAflame or ... I remember!  Briac Tundrafire!  Yes ... Briac Tundrafire.  Big, tall, built like he should be pulling a supply wagon.  Ah, they all look alike to me.  Just find him and tell him I have his sword-chucks in stock.")
	Dialog.AddVoiceover("voiceover/english/arms_dealer_shilza/fprt_hood06/quests/armsdealershilza/shilza_x1_accept.mp3",4001987290,675557143)
    PlayFlavor(QuestGiver, "","","confused",0,0, Player)
	Dialog.AddOption("I'll let him know.")
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
