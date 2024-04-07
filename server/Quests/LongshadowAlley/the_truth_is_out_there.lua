--[[
	Script Name		:	the_truth_is_out_there.lua
	Script Purpose	:	Handles the quest, "The Truth is out There"
	Script Author	:	torsten
	Script Date		:	19.07.2022
	Script Notes	:	

	Zone			:	Longshadow Alley
	Quest Giver		:	Captain L`Nek
	Preceded by		:	None
	Followed by		:	Silenced Speech
--]]

 require "SpawnScripts/Generic/DialogModule"

function Init(Quest)
	AddQuestStepChat(Quest, 1, "I need to speak with Imnat D'Vren, a secret informant to the Militia. He supposedly lives near the courtyard of Longshadow Alley.", 1, "Talk to Imnat D'Vren, a secret informant to the Militia. He is in a building to the Southwest of the Destroyed Knowledge Portal.", 11, 1380031)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I've spoken with Imnat.")
	UpdateQuestTaskGroupDescription(Quest, 1, "Imnat D'Vren, the informant, has given me the identity of the propagandist.")
    
    AddQuestStepChat(Quest, 2, "I should return to Captain L`Nek.", 1, "I need to let Captain L'Nek know that the Thexian is a person by the name of Kirs G'Viz.", 11, 1380010)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
    UpdateQuestStepDescription(Quest, 2, "I returned to Captain L`Nek with the news.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I've let the Captain know that Kirs G'Viz is the one who's been spreading the propaganda.")
	UpdateQuestDescription(Quest, "I returned to Captain L'Nek and let him know what Imnat told me.")
	GiveQuestReward(Quest, Player)
end

function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("Excellent.  You may not be completely worthless after all, sirrah.  The Overlord tires of hearing about the Thexians, and wants this canker rooted out. So, listen carefully and do not force me to repeat myself: there is an informant named Imnat D'Vren, who discreetly plies his trade near the Central Courtyard.  Tell him you seek the font of Thexian propaganda.  Discover what he knows.")
    PlayFlavor(QuestGiver,"","","nod",0,0,Player)
	Dialog.AddVoiceover("voiceover/english/captain_l_nek/fprt_hood05/quests/captainlnek/lnek_x1_accept.mp3", 3738122891, 1112622069) 
	Dialog.AddOption("At once.")
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



