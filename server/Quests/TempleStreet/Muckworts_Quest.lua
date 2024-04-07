--[[
    Script Name    : Quests/TempleStreet/Muckworts_Quest.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.29 03:10:43
    Script Purpose : 

        Zone       : TempleStreet
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]
require "SpawnScripts/Generic/DialogModule"

function Init(Quest)
	AddQuestStepChat(Quest, 1, "I need to speak with Crantik.", 1, "I need to go find Crantik the Crazed. Muckwort said he's a troll, so I should be able to find him in Big Bend.", 11, 1340046)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
    UpdateQuestZone(Quest,"Big Bend")
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I have spoken with Crantik.")
	UpdateQuestTaskGroupDescription(Quest, 1, "Crantik gave me a vial of murky slime which he claims that he made from his own body. I don't even want to think about what I'm holding in my hands.")
    UpdateQuestZone(Quest,"Temple Street")
	AddQuestStepChat(Quest, 2, "I need to speak with Old Man Muckwort.", 1, "Now that I have the vial of... stuff... I should give it to Muckwort for my reward.", 178, 1360023)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end


function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("HAH! Not as angry as you'll be when I'm done with you! If you want the respect of your elders then go get me a vial of ... of something, got it? Pick it up from the troll who makes it. His name is Crantik and he lives in Big Bend. I'd do it, but my legs aren't what they used to be. Now get off my lawn! ")
	Dialog.AddVoiceover("voiceover/english/old_man_muckwort/fprt_hood03/quests/oldmanmuckwort/muckwort_x1_accept.mp3", 3927245994, 1244079768)
    PlayFlavor(QuestGiver,"","","chuckle",0,0,Player)
    Dialog.AddOption("Fine! I'm going!")
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
	UpdateQuestStepDescription(Quest, 2, "I gave Muckwort the vial of... something.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I gave Muckwort the vial of... something.")

	UpdateQuestDescription(Quest, "Muckwort gave me an old mug in exchange for my service. I think he plans on poisoning the area so that the gnomes and ratonga don't step on his lawn anymore.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		Step1Complete(Quest, QuestGiver, Player)
	elseif Step == 2 then
		QuestComplete(Quest, QuestGiver, Player)
		end
end
