--[[
    Script Name    : Quests/Graveyard/natashas_note.lua
    Script Author  : Dorbin
    Script Date    : 2023.11.14 04:11:37
    Script Purpose : 

        Zone       : Graveyard
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]

function Init(Quest)
	AddQuestStepChat(Quest, 1, "I need to find Tarakh.", 1, "I should take this note to Tarakh.  Based on the note's contents, he is probably a Ratonga.", 185, 1360000)
	AddQuestStepCompleteAction(Quest, 1, "QuestComplete")
    UpdateQuestZone(Quest,"Temple Street")
end

function Accepted(Quest, QuestGiver, Player)
    if HasItem(Player,1568,1) then
        RemoveItem(Player,1568)
        SendMessage(Player,"You place the dirty note in your quest satchle.")
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
	UpdateQuestStepDescription(Quest, 1, "I sold the note to Tarakh.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I sold the note to Tarakh and turned a small profit.")

	UpdateQuestDescription(Quest, "Looks like I turned that worthless paper into a little coin.  Tarakh wasn't happy the note contained so little information.  Too bad for him.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end
