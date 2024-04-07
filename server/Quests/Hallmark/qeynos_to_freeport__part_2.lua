--[[
    Script Name    : Quests/Hallmark/qeynos_to_freeport__part_2.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.28 11:09:33
    Script Purpose : 

        Zone       : Hallmark
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]


function Init(Quest)
	AddQuestStep(Quest, 1, "I need to kill the Queen's bodyguard before it's too late.", 1, 100, "I need to find the bodyguard who holds the key to the Queen's vaults and kill her quickly.  She'll probably be found deep inside the mansion.  Hopefully she won't have guards of her own.", 11)
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
	UpdateQuestStepDescription(Quest, 1, "I fought my way to the room where the Queen awaited me.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I've reached the bodyguard only to find out I was sent to assassinate the Queen herself... with every bodyguard present.")

	UpdateQuestDescription(Quest, "I've been set up by Cordun and Remy.  They backstabbed me by setting me up for the fall, all the while getting a reward for their &quot;heroic&quot; actions.  I'll likely be given a life sentence for trying to assassinate the Queen.  My life of evil was short and swift. <br> <br>")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end

