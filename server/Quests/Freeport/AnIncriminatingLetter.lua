--[[
	Script Name		:	AnIncriminatingLetter.lua
	Script Purpose	:	Handles the quest, "Eliminate Geraufl"
	Script Author	:	Cynnar
	Script Date		:	11/20/2023
	Script Notes	:	Auto generated with QuestParser.

	Zone			:	World Event
	Quest Giver		:	
	Preceded by		:	None
	Followed by		:	None
--]]

local Geraufl = 1300005


function Init(Quest)
	AddQuestStepLocation(Quest, 1, "Find the old froglok in the jail.", 1, "Geraufl must be killed before his existence invites anymore Qeynosian slime to attempt his rescue.", 11, 173, -23, 128)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
end

function Accepted(Quest, QuestGiver, Player)
	-- Add dialog here for when the quest is accepted
end

function Declined(Quest, QuestGiver, Player)
	-- Add dialog here for when the quest is declined
end

function Deleted(Quest, QuestGiver, Player)
	-- Remove any quest specific items here when the quest is deleted
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "It seems that the frog has been moved.")
	UpdateQuestTaskGroupDescription(Quest, 1, "It appears that the guards have moved Geraufl deeper into the prison. Just my luck.")

	AddQuestStepKill(Quest, 2, "Slink down into the jail and kill Geraufl.", 1, 100, "I'll need to slip down into the deeper reaches of the jail to kill Geraufl.", 11, Geraufl)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 2, "I've failed in my mission to kill the frog.")
	UpdateQuestTaskGroupDescription(Quest, 2, "Geraufl has escaped through my own incompetence. Fortunately no one is left to tell the tale of my... indiscretion.")

	UpdateQuestDescription(Quest, "My intentions were good, but I unfortunately failed in my mission to kill the froglok. He escaped the jail while I was stunned, likely fled into the sewers. Unfortunately, I suppose this may mean we'll start to see more of them in the future.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		Step1Complete(Quest, QuestGiver, Player)
	elseif Step == 2 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end


