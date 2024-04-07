--[[
    Script Name    : Quests/TheForestRuins/letter_for_hunter_forestdeep.lua
    Script Author  : Dorbin
    Script Date    : 2022.02.21 03:02:34
    Script Purpose : 

        Zone       : TheForestRuins
        Quest Giver: Outrider Vaughn
        Preceded by: Vaughn's Stuff
        Followed by: 
--]]



function Init(Quest)
	AddQuestStepChat(Quest, 1, "Deliver the letter to hunter Forestdeep", 1, "I need to deliver a letter to a hunter named Forestdeep in Qeynos.", 1223, 2370002)
	AddQuestStepCompleteAction(Quest, 1, "QuestComplete")
	UpdateQuestZone(Quest, "The Willow Wood")
end

function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	conversation = CreateConversation()

	PlayFlavor(QuestGiver, "voiceover/english/outlander_vaughn/qey_adv02_ruins/quests/outlander_dakota/outlander_dakota004.mp3", "", "", 3189315384, 2954944318, Player)
	AddConversationOption(conversation, "I'll deliver this letter for you to the Willow Wood.")
	StartConversation(conversation, QuestGiver, Player, "I need you to take this letter to Hunter Forestdeep. You'll find him in the Willow Wood village.")
end

function Declined(Quest, QuestGiver, Player)
	-- Add dialog here for when the quest is declined
end

function Deleted(Quest, QuestGiver, Player)
	-- Remove any quest specific items here when the quest is deleted
end

function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 1, "I've delivered the letter to hunter Forestdeep")
	UpdateQuestTaskGroupDescription(Quest, 1, "I have delivered the letter to hunter Forestdeep.")

	UpdateQuestDescription(Quest, "I delivered the letter Outlander Vaughn had given me.  The hunter was glad to receive the letter.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end
