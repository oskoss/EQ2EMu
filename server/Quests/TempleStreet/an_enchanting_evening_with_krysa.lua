--[[
    Script Name    : Quests/TempleStreet/an_enchanting_evening_with_krysa.lua
    Script Author  : Dorbin
    Script Date    : 2023.11.07 10:11:22
    Script Purpose : 

        Zone       : TempleStreet
        Quest Giver: Krysa 
        Preceded by: None
        Followed by: 
--]]
require "SpawnScripts/Generic/DialogModule"

function Init(Quest)
	AddQuestStepChat(Quest, 1, "I need to speak with Raban in Stonestair Byway.", 1, "I need to find Raban. She should be in Stonestair Byway.", 11, 1350037)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
    UpdateQuestZone(Quest,"Stonestair Byway")
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I've spoken with Raban.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I have had a little conversation with Raban. It seems she's behind all of this.")
    UpdateQuestZone(Quest,"Temple Street")
	AddQuestStepChat(Quest, 2, "I have to speak with Krysa.", 1, "I should let Krysa know that Raban has offered to continue casting these spells free of charge.", 11, 1360042)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end


function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("Even though I don't have makeup, I still have the helps of a witch in the Erudite district. You go there for me, yes? When you get there, look for a woman named Raban. She is the witch who helps me. Tell her I brings her money if she makes Spezi and Krasa more ugly. Okay?")
	Dialog.AddVoiceover("voiceover/english/krysa/fprt_hood03/quests/krysa/krysa_x2_accept.mp3", 67608218, 4287928755)
    PlayFlavor(QuestGiver,"","","agree",0,0,Player)
    Dialog.AddOption("I'll try to find her in Stonestair.")
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
	UpdateQuestStepDescription(Quest, 2, "I've spoken with Krysa.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I have told Krysa that Raban has offered to cast the spells free of charge.")

	UpdateQuestDescription(Quest, "Those three women have no idea how badly they're being played. Their vanity is so great that Raban the Erudite is playing them like little marionettes. It seems that Raban has been casting some type of special enchantment to make Krasa and Spezi ugly. I think it's best to not get involved at this point.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		Step1Complete(Quest, QuestGiver, Player)
	elseif Step == 2 then
		QuestComplete(Quest, QuestGiver, Player)
		end
end
