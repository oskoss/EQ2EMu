--[[
	Script Name	: Quests/SunkenCity/exotic_soups.lua
	Script Purpose	: Handles the quest, "Exotic Soups"
	Script Author	: Scatman
	Script Date	    : 2009.08.01 (15.7.2022 by torsten, this quests used to start in Longshadow Alley) Dorbin - added dialog to accepted and moved back to Longshadow for classic.
	
	Zone       : Sunken City
	Quest Giver: Tilzak N'Lim
	Preceded by: None
	Followed by: None
--]]
require "SpawnScripts/Generic/DialogModule"

function Init(Quest)
	AddQuestStepKill(Quest, 1, "I need to collect a meaty shark fin", 10, 85, "I should start looking for the dusk sharks. I'll need a big enough fin to bring back to Tilzak.", 122, 1240025, 8410007	)
	AddQuestStepCompleteAction(Quest, 1, "Step1_Complete_KilledSharks")
    UpdateQuestZone(Quest,"Sunken City")
end

function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("OH! You'll help me? Oh thank you so much, friend! I wish to make a nice souffle from the fins of the Dusk Sharks that roam the waters here in the Sunken City.  I need a large fin in order to make this souffle.  I will be eagerly anticipating your return!")
	Dialog.AddVoiceover("voiceover/english/optional5/standard_dark_elf_male/fprt_hood05/quests/tilzaknlim/tilzak_x1_accept.mp3", 16004203, 2050489897)
	PlayFlavor(QuestGiver, "", "", "happy", 0, 0, Player, 0)
	Dialog.AddOption("I'll be back when I have them.")
	Dialog.Start()
end

function Declined(Quest, QuestGiver, Player)
end

function Step1_Complete_KilledSharks(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I've collected the meaty shark fin.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I have the shark fin Tilzak was asking for.")
    UpdateQuestZone(Quest,"Longshadow Alley")

	AddQuestStepChat(Quest, 2, "I need to speak with Tilzak", 1, "I should return to Tilzak then get on with my business. I don't even know why I offered to help him with this stupid task.", 0, 1240026,1380131)
	AddQuestStepCompleteAction(Quest, 2, "Quest_Complete")
end

function Quest_Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I've spoken with Tilzak")
	UpdateQuestTaskGroupDescription(Quest, 2, "I've given the fin to Tilzak the Fishmonger.")
	GiveQuestReward(Quest, Player)
	UpdateQuestDescription(Quest, "Tilzak was pleased with the shark fin, and plans on trying his recipe right away.")
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		Step1_Complete_KilledSharks(Quest, QuestGiver, Player)
	end
end