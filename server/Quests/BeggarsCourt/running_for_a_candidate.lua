--[[
	Script Name		:	running_for_a_candidate.lua
	Script Purpose	:	Handles the quest, "Running For A Candidate"
	Script Author	:	torsten\\Dorbin
	Script Date		:	17.07.2022
	Script Notes	:	

	Zone			:	Beggar's Court
	Quest Giver		:	Mariana Darkleaf
	Preceded by		:	To Spite a Darkleaf
	Followed by		:	None
--]]
require "SpawnScripts/Generic/DialogModule"


function Init(Quest)
	AddQuestStepChat(Quest, 1, "I need to speak with Lurina in Beggar's Court.", 1, "I need to tell Lurina Galla that 'Elowyn is a perfect candidate'.", 11, 1370026)
	AddQuestStepCompleteAction(Quest, 1, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I've spoken with Lurina.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I've given Lurina the message that Mariana had me send.")

	UpdateQuestDescription(Quest, "I think I may have stumbled into some intrigue in the district. It seems that Lurina Galla and Mariana Darkleaf have something going on that involves Elowyn the Half-Elf. I wonder if one day I'll find out more about what's going on. No sense bothering Mariana again. For now.")
	GiveQuestReward(Quest, Player)
end

function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("Ugh. If you'll stop bothering me, then fine! Go find Lurina Galla and tell her I found the perfect candidate, Elowyn. He's ideal! Now, off with you! Go tell Lurina and don't bother me again!")
	Dialog.AddOption("Fine.")
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


