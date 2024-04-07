--[[
    Script Name    : Quests/TheSprawl/shivos_arcane_rod.lua
    Script Author  : Dorbin
    Script Date    : 2023.11.15 04:11:25
    Script Purpose : 

        Zone       : TheSprawl
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]

function Init(Quest)
	AddQuestStepChat(Quest, 1, "I should show this rod to someone in Freeport.", 1, "I should show this rod to someone and see if they know what it does.  I hear there's an extensive library in the City of Freeport.  Maybe someone there would know.", 169, 1440034	)
	AddQuestStepCompleteAction(Quest, 1, "QuestComplete")
	UpdateQuestZone(Quest,"North Freeport")
end

function Accepted(Quest, QuestGiver, Player)
    if HasItem(Player, 2292) then
    RemoveItem(Player, 2292)
    SendMessage(Player,"You place the magic rod in your quest satchle.")
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
	UpdateQuestStepDescription(Quest, 1, "I returned the rod to Claudia Quart.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I returned the rod to Claudia Quart and received a reward.")

	UpdateQuestDescription(Quest, "It turns out the rod was originally the possession of Claudia Quart.  The Great Shivo stole it from her some time ago.  I returned the rod to Claudia for a reward.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end
