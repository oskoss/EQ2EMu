--[[
    Script Name    : Quests/TheSprawl/sprawl_guttersnipe_sweep.lua
    Script Author  : Dorbin
    Script Date    : 2023.12.04 04:12:27
    Script Purpose : 

        Zone       : TheSprawl
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]
function Init(Quest)
 local RandomChoice = MakeRandomInt(1, 2)
	SetQuestFeatherColor(Quest, 3)
	SetQuestRepeatable(Quest)
	if RandomChoice == 1 then
    AddQuestStepKill(Quest, 1, "Slay Guttersnipe hooligans", 6, 100, "I'm supposed to knock these Dervishes in the Sprawl down a few notches.  I can reach the Sprawl by using any of the bells in and around the City of Freeport.", 611, 8400011)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
	elseif RandomChoice == 2 then
	AddQuestStepKill(Quest, 1, "Slay Guttersnipe crooks", 6, 100, "I'm supposed to knock these Dervishes in the Sprawl down a few notches.  I can reach the Sprawl by using any of the bells in and around the City of Freeport.", 611, 8400010)
	AddQuestStepCompleteAction(Quest, 1, "Step2Complete")    
   end
end


function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	conversation = CreateConversation()

	AddConversationOption(conversation, "I will do so.")
	StartConversation(conversation, QuestGiver, Player, "Glad to hear it. Defeat them and return to me for your payment.")
end

function Declined(Quest, QuestGiver, Player)
	-- Add dialog here for when the quest is declined
end

function Deleted(Quest, QuestGiver, Player)
	-- Remove any quest specific items here when the quest is deleted
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I've dealt with the Guttersnipe.")

    CheckProgress(Quest, QuestGiver, Player)
end

function Step2Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I've dealt with the Guttersnipe.")
CheckProgress(Quest, QuestGiver, Player)
end


function   CheckProgress(Quest, QuestGiver, Player)
if QuestStepIsComplete(Player, 5934, 1)  then
	UpdateQuestTaskGroupDescription(Quest, 1, "I'd say they've been cut down to size.")
	UpdateQuestTaskGroupDescription(Quest, 1, "Class dismissed.")
	AddQuestStepChat(Quest, 3, "Report to Liege Aquila", 1, "I should report back to Liege Aquila in the Sprawl.  I can reach the Sprawl by using any of the bells in and around the City of Freeport.", 11, 8400018)
	AddQuestStepCompleteAction(Quest, 3, "QuestComplete")
end
end

function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 3, "I spoke with Liege Aquila.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I've spoken with Liege Aquila.")

	UpdateQuestDescription(Quest, "I've taken care of the dervishes here in the Sprawl, just like Liege Aquila asked.  I should return to him only if I desire to continue doing this sort of work.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
 local RandomChoice = MakeRandomInt(1, 3)
	if Step == 1 then
	   if RandomChoice == 1 then
		Step1Complete(Quest, QuestGiver, Player)
	    elseif RandomChoice == 2 then
		Step2Complete(Quest, QuestGiver, Player)
	    elseif RandomChoice == 3 then
		Step3Complete(Quest, QuestGiver, Player)
		end
	elseif Step == 2 then
		CheckProgress(Quest, QuestGiver, Player)
	elseif Step == 3 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end
