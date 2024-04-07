--[[
    Script Name    : Quests/TempleStreet/improving_the_design.lua
    Script Author  : Dorbin
    Script Date    : 2023.11.01 08:11:32
    Script Purpose : 

        Zone       : TempleStreet
        Quest Giver: Sparzit
        Preceded by: None
        Followed by: 
--]]
require "SpawnScripts/Generic/DialogModule"

function Init(Quest)
	AddQuestStepKill(Quest, 1, "I must kill some undead pikemen and collect bone rot from them.", 10, 100, "I need to kill some undead pikemen in the Graveyard. I'll try to collect the samples after I've killed them.", 181, 8390024)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
    UpdateQuestZone(Quest,"The Graveyard")
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I have gathered the bone rot from the pikemen.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I've managed to collect the samples of bone rot for Sparzit.")
    UpdateQuestZone(Quest,"Temple Street")
	AddQuestStepChat(Quest, 2, "I need to speak with Sparzit in Temple Street.", 1, "This is the amount that Sparzit asked for, so I should return them to him.  He is in Temple Street in Freeport, standing near the makeshift bar in the downstairs plaza.", 102, 1360041)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end


function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("Wonderful!  What I need is a time-released debilitating toxin ... which is precisely the active substance found in the decomposing osteonecrotic tissue of the undead!  Good friend, go and find me some samples of \"bone rot\" from those Undead Pikemen.  Bring the samples to me and I'll give you some coin.")
	Dialog.AddVoiceover("voiceover/english/sparzit_cogsnibble/fprt_hood03/quests/sparzitcogsnibble/sparzit_x2_accept.mp3", 2139375878, 1700119912)
    PlayFlavor(QuestGiver,"","","happy",0,0,Player)
    Dialog.AddOption("Err... \"Bone Rot\"? I'll see what I can do.")
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
	UpdateQuestStepDescription(Quest, 2, "I have given Sparzit the samples as he requested.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I have given Sparzit the samples as he requested.")

	UpdateQuestDescription(Quest, "Sparzit offered me some coin for my time that I spent collecting samples of bone rot for him.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		Step1Complete(Quest, QuestGiver, Player)
	elseif Step == 2 then
		QuestComplete(Quest, QuestGiver, Player)
		end
end