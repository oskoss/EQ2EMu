--[[
    Script Name    : Quests/TheCryptofBetrayal/inquisitor.lua
    Script Author  : Premierio015
    Script Date    : 2021.10.29 08:10:31
    Script Purpose : 

        Zone       : TheCryptofBetrayal
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]

function Init(Quest)
	SetQuestFeatherColor(Quest, 3)
	SetQuestRepeatable(Quest)
	AddQuestStepKill(Quest, 1, "Kill ten Bloodsaber inquisitors.", 10, 100, "This note was apparently meant for someone else here in these catacombs.", 611, 2010036)
	AddQuestStepCompleteAction(Quest, 1, "QuestComplete")
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

function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 1, "I've slain ten Bloodsaber inquisitors.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I've carried out the tasks stated in the note.")
	UpdateQuestDescription(Quest, "Interesting... I guess it was worth it for the experience.  I suppose it couldn't hurt to take on adventures such as these.")
	GiveQuestReward(Quest, Player)
	if HasItem(Player, 8345) then -- inquisitor(item)
	RemoveItem(Player, 8345)
	end
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end

