--[[
	Script Name		:	an_axes_revenge.lua
	Script Purpose	:	Handles the quest, "An Axe's Revenge"
	Script Author	:	premierio015
	Script Date		:	25.06.2021
	Script Notes	:	Auto generated with QuestParser.

	Zone			:	The Ruins
	Quest Giver		:	a carved orc axe
	Preceded by		:	None
	Followed by		:	None
--]]


function Init(Quest)
	AddQuestStepKill(Quest, 1, "Kill orcs", 6, 100, "I feel the irresistible need to slay orcs in the Ruins!  I can reach the Ruins by using any of the bells in and around the City of Freeport.", 91, 8420001, 8420002,8420003, 8420004, 8420005,8420006, 8420007,8420009,8420010, 8420011, 8420012, 8420013, 8420014, 8420027, 8420028, 8420029, 8420030, 8420031, 8420038, 8420039, 8420042, 8420043, 8420068, 8420069)
	AddQuestStepCompleteAction(Quest, 1, "QuestComplete")
	UpdateQuestZone(Quest,"Ruins")
end

function Accepted(Quest, QuestGiver, Player)
    if HasItem(Player,1335,1) then
        RemoveItem(Player,1335)
        SendMessage(Player,"You place the carved orc axe in your quest satchle.") 
    end
end

function Declined(Quest, QuestGiver, Player)
	-- Add dialog here for when the quest is declined
end

function Deleted(Quest, QuestGiver, Player)
	-- Remove any quest specific items here when the quest is deleted
end

function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 1, "I have killed some orcs")
	UpdateQuestTaskGroupDescription(Quest, 1, "I killed six orcs before the urge went away.")
    if HasItem(Player, 1335) then
    RemoveItem(Player, 1335)
    end
	UpdateQuestDescription(Quest, "I had to kill six orcs before the urge left me.  The axe now rests quietly with me.")
	GiveQuestReward(Quest, Player)
   end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end
