--[[
	Script Name		:	will_fight_for_fun.lua
	Script Purpose	:	Handles the quest, "Will Fight for Fun"
	Script Author	:	torsten\\Dorbin
	Script Date		:	25.07.2022
	Script Notes	:	Was called 'Will Fight for Fun' in pre-launch. Renamed 'Slaying the Giants' at launch.-Dorbin

	Zone			:	Scale Yard
	Quest Giver		:	Colin Stoutfist
	Preceded by		:	Will Work for War
	Followed by		:	None
--]]
require "SpawnScripts/Generic/DialogModule"


function Init(Quest)
	AddQuestStepKill(Quest, 1, "I need to kill ten giantslayer thugs in the Sprawl.", 10, 100, "Colin told me to kill ten giantslayer thugs in the Sprawl.", 611, 1260013)
    UpdateQuestZone(Quest,"The Sprawl")
	AddQuestStepCompleteAction(Quest, 1, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I have killed the giantslayers.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I've confronted the Giantslayers and taught them that it's not nice to steal coin or life, by slaying ten of their kind.")
	UpdateQuestDescription(Quest, "I've killed a bunch of those thugs. To think they were once glorious Barbarians, and now all they are is just food for the maggots. It's a shame they chose to side with the wrong guys.")
	GiveQuestReward(Quest, Player)
end

function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("Be my guest!  But I'll warn ya' ... if yer gonna stick your nose in this business, you'd better kill at least ten of 'em.  Otherwise, Warchief Coldbrow will wonder why you even bothered.  Be glorious in battle, friend!")
	Dialog.AddVoiceover("voiceover/english/colin_stoutfist/fprt_hood06/quests/colinstoutfist/colin_x2_accept.mp3",138791727,2652552680)
    PlayFlavor(QuestGiver, "","","agree",0,0, Player)
	Dialog.AddOption("I'll show them their mistake!")
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

