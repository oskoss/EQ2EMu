--[[
	Script Name	: Quests/Oakmyst/destroy_the_corruption.lua
	Script Purpose	: Handles the quest, "Destroy the Corruption"
	Script Author	: Scatman
	Script Date	: 2009.05.09
	
	Zone       : Oakmyst Forest
	Quest Giver: Scholar Neola
	Preceded by: Judgement of the Dryads (judgement_of_the_dryads.lua)
	Followed by: None
--]]
require "SpawnScripts/Generic/DialogModule"


function Init(Quest)
	AddQuestStepKill(Quest, 1, "Find and defeat Rotweed.", 1, 100, "I must slay Rotweed. This being can be found in the Teardrop Cave in Oakmyst Forest.", 611, 1950029,8300027)
	AddQuestStepCompleteAction(Quest, 1, "Step1_Complete_KilledRotweed")
end

function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("The evil calls itself Rotweed and lurks in the darkness of Teardrop Cave. It buries itself in the cave walls and exudes corruption upon this woodland. ")
	Dialog.AddVoiceover("voiceover/english/empress_anassa/qey_adv01_oakmyst/empressanassa002.mp3", 3988531876, 1061259431)
	Dialog.AddOption("What is Rotweed?", "WhatIsRotweed")
	Dialog.AddOption("I will battle this Rotweed and return victorious. ")
	Dialog.Start()
end

function Declined(Quest, QuestGiver, Player)
end

function Step1_Complete_KilledRotweed(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I have found and defeated Rotweed.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I have slain the many creatures that made up Rotweed the plant fiend.")

	AddQuestStepChat(Quest, 2, "Speak to Empress Anassa.", 1, "I must return to speak to Empress Anassa in Oakmyst Forest.", 0, 1950050,8300021) 
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I have spoken to Empress Anassa.")
	UpdateQuestStepDescription(Quest, 2, "I have returned and spoken to Empress Anassa.")
	UpdateQuestDescription(Quest, "I encountered and defeated the twisted plant fiend Rotweed. Empress Anassa of the Oakmyst dryads was very appreciative.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		Step1_Complete_KilledRotweed(Quest, QuestGiver, Player)
	elseif Step == 2 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end
