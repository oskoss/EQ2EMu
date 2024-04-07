--[[
    Script Name    : Quests/TempleStreet/teeth_for_sparzit.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.29 06:07:27
    Script Purpose : 

        Zone       : TempleStreet
        Quest Giver: Sparzit
        Preceded by: None
        Followed by: None
--]]
require "SpawnScripts/Generic/DialogModule"

function Init(Quest)
	AddQuestStepKill(Quest, 1, "I must kill some snakes in the Sprawl until I find a pair of Perfect Snake Fangs.", 1, 33, "I need to kill snakes until I find a perfect set of fangs.", 102, 8400009,8400012)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
    UpdateQuestZone(Quest,"Sprawl")
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I've found some fangs.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I've collected a pair of fangs from the snakes.")
    UpdateQuestZone(Quest,"Temple Street")
	AddQuestStepChat(Quest, 2, "I need to speak with Sparzit in Temple Street.", 1, "This is the amount that Sparzit asked for, so I should return them to him.  He is in Temple Street in Freeport, standing near the makeshift bar in the downstairs plaza.", 102, 1360041)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end


function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("I'm trying to make teeth for my snake, but the ones I make snap off after puncturing the victim's skin. A real asp, on the other hand, doesn't have this problem. I want to study the teeth of a real snake so I can enhance my design. You can help me by retrieving teeth from a Shoreside Asp. Thank, thank you ... I can't thank you enough!")
	Dialog.AddVoiceover("voiceover/english/sparzit_cogsnibble/fprt_hood03/quests/sparzitcogsnibble/sparzit_x1_accept.mp3", 1710457152, 3762147821)
    PlayFlavor(QuestGiver,"","","agree",0,0,Player)
    Dialog.AddOption("I'll find you some sturdy snake teeth. Try not to blow anything up.")
	Dialog.Start()
end

function Declined(Quest, QuestGiver, Player)
	-- Add dialog here for when the quest is declined
end

function Deleted(Quest, QuestGiver, Player)
	-- Remove any quest specific items here when the quest is deleted
end

function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 2, "I've given Sparzit some fangs.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I've returned to Sparzit snakes with his snake fangs.")

	UpdateQuestDescription(Quest, "Sparzit was rather happy with the fangs I brought him. He gave me some coin for gathering the teeth for him.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		Step1Complete(Quest, QuestGiver, Player)
	elseif Step == 2 then
		QuestComplete(Quest, QuestGiver, Player)
		end
end