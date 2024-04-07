--[[
	Script Name		:	marcus_cantariuss_monumental_hatred.lua
	Script Purpose	:	Handles the quest, "Marcus Cantarius's Monumental Hatred"
	Script Author	:	torsten\\Dorbin
	Script Date		:	16.07.2022
	Script Notes	:	

	Zone			:	Beggar's Court
	Quest Giver		:	Marcus Cantarius
	Preceded by		:	None
	Followed by		:	Deliver Help to Janus Fieri
--]]
require "SpawnScripts/Generic/DialogModule"


function Init(Quest)
	AddQuestStepKill(Quest, 1, "I need to collect twenty dervish thug scalps.", 20, 100, "I need to collect scalps from the dervish thugs in the Commonlands for Marcus Cantarius.", 138, 330096, 330105)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
    UpdateQuestZone(Quest,"The Commonlands")
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I have enough dervish thug scalps.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I need to take these scalps to Marcus Cantarius in the Beggar's Court.")
    UpdateQuestZone(Quest,"Beggar's Court")

    AddQuestStepChat(Quest, 2, "I need to take these scalps to Marcus Cantarius.", 1, "I need to take these scalps back to Marcus Cantarius in Beggar's Court.", 138, 1370042)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I gave the scalps to Marcus Cantarius.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I gave the dervish thug scalps to Marcus Cantarius.")
	UpdateQuestDescription(Quest, "It was a long and arduous task killing so many dervish thugs, but the reward was well worth the effort!")
	GiveQuestReward(Quest, Player)
end

function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("My hatred for the dervish thugs is unequaled. Bring me a large amount of these fiends' scalps. I wish to decorate my home with them. I promise to reward you handsomely.")
	Dialog.AddVoiceover("voiceover/english/marcus_cantarius/fprt_hood04/quests/marcuscantarius/marcuscantarius003.mp3", 3150858972, 2644148691)
	Dialog.AddOption("Gladly.")
    if CanReceiveQuest(Player, 5660) then
  	Dialog.AddOption("Of course. Other than scalping dervish, do you need anything else?","Dialog4")
    end
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
