--[[
	Script Name		:	an_errand_for_the_queen.lua
	Script Purpose	:	Handles the quest, "An Errand for the Queen"
	Script Author	:	torsten\\Dorbin
	Script Date		:	15.07.2022
	Script Notes	:	

	Zone			:	Beggar's Court
	Quest Giver		:	Tullia Domna
	Preceded by		:	None
	Followed by		:	None
--]]
require "SpawnScripts/Generic/DialogModule"

function Init(Quest)
	AddQuestStepKill(Quest, 1, "I must kill five Giantslayer bashers", 5, 100, "I need to venture to the Sprawl and kill five Giantslayer bashers.", 611, 8400027)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I have killed the Giantslayer bashers")
	UpdateQuestTaskGroupDescription(Quest, 1, "I've killed the Giantslayer bashers as part of the trick I'm playing on the mad woman.")

	AddQuestStepChat(Quest, 2, "I should return to Tullia Domna.", 1, "I should return to Tullia Domna and let her know that... her guards are dead.", 11, 1370000)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I've let... the 'Queen' know that the Giantslayer Bashers are dead.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I've let... the 'Queen' know that the Giantslayer Bashers are dead.")

	UpdateQuestDescription(Quest, "Tullia Domna, the mad woman in Beggar's Court, was going to knight me for killing the Giantslayer bashers. Even though I was playing along with her insanity, I don't think I should go as far as giving her a sharp instrument to knight me with. This woman really needs help.")
	GiveQuestReward(Quest, Player)
end


function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("Well, you're late, good man.  I've been puffing up my cheeks and snorting loudly, hoping you'd find me.  My entourage deserted me, and now you must execute them.  Go find these ogres and kill them; they hide in the Sprawl and call themselves Giantslayer Bashers.  Now, go child.  Queenly blessings to you!")
	Dialog.AddVoiceover("voiceover/english/tullia_domna/fprt_hood04/quests/tulladomna/tulla_x1_accept.mp3", 2208976682, 3386849948)
	PlayFlavor(QuestGiver, "", "", "scold", 0, 0, Player, 0)
	Dialog.AddOption("At once, my 'Queen'.")
	if GetGender(Player)== 2 then
	Dialog.AddOption("I'm not a man, but ...err, Yes, my 'Queen'.")
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
