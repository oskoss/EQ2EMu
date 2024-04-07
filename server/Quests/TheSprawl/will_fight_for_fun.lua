--[[
    Script Name    : Quests/TheSprawl/will_fight_for_fun.lua
    Script Author  : Dorbin
    Script Date    : 2023.12.13 07:12:13
    Script Purpose : This quest was designed to give an inactive/useless quest reward purpose from Scale Yard and a reason to kill Woodelves/halflings in The Sprawl.

        Zone       : TheSprawl
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]

function Init(Quest)
	AddQuestStepKill(Quest, 1, "Kill any wood elves, halflings, and dwarves in The Sprawl", 12, 100, "I'm in the mood to clear out the Qeynosian riff-raff in The Sprawl. Let me see how beg for death as I end their miserable existance!", 91,8400031,8400029,8400030)
	AddQuestStepCompleteAction(Quest, 1, "QuestComplete")
end

function Accepted(Quest, QuestGiver, Player)
    if HasItem(Player, 1001111,1) then
    RemoveItem(Player, 1001111)
    SendMessage(Player,"You place the lock of smooth hair in your quest satchle.")
    end
end

function Declined(Quest, QuestGiver, Player)

end


function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 1, "I have killed the Qeynosian troublemakers.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I have killed the Qeynosian troublemakers. Their tears were reward enough.")
    if HasItem(Player, 1001111) then
    RemoveItem(Player, 1001111)
    end
	UpdateQuestDescription(Quest, "I've culled the Sprawl of a potential threat. Their tears were satisfying as I cut them down!")
	GiveQuestReward(Quest, Player)
   end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end


