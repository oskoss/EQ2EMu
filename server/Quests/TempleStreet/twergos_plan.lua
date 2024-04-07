--[[
    Script Name    : Quests/TempleStreet/twergos_plan.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.30 03:10:31
    Script Purpose : 

        Zone       : TempleStreet
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]
require "SpawnScripts/Generic/DialogModule"

function Init(Quest)
	AddQuestStepKill(Quest, 1, "I must kill zombies in the Sunken City and collect their brains.", 10, 80, "I need to venture to the Sunken City and collect ten brains from zombies in the sunken city. I'll check each one to see if they still have a brain.", 109, 8410023,8410024,8410025,8410028,8410029,8410030)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
    UpdateQuestZone(Quest,"Sunken City")
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I gathered the brains from the zombies.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I've killed the zombies and am now holding ten squishy, rotting brains on my person.")
    UpdateQuestZone(Quest,"Temple Street")
	AddQuestStepChat(Quest, 2, "I need to speak with Merchant Twergo.", 1, "I should bring these brains back to Twergo before they start to smell any more than they already do.", 5, 1360025)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end


function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("My current theory involves the use of preserved brains.  At first, I experimented with the brains of some of my customers, but they weren't sufficiently preserved.  Zombie brains, however, should be perfect!  And there are wonderful specimens of zombies in the Sunken City.  If you'll go there and get me ten zombie brains, I will pay you handsomely.")
	Dialog.AddVoiceover("voiceover/english/merchant_twergo_togglesmeet/fprt_hood03/quests/twergotogglesmeet/twergo_x1_accept.mp3", 1761683922, 1170110378)
    PlayFlavor(QuestGiver,"","","ponder",0,0,Player)
    Dialog.AddOption("An odd request... but I do like to get paid.")
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
	UpdateQuestStepDescription(Quest, 2, "I've spoken with Twergo.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I've handed over all of the zombie brains to this little gnome.")

	UpdateQuestDescription(Quest, "Twergo paid me for the brains. I tried to convince him that he could use the device to rule the world, but he was adamant that it couldn't be used that way.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		Step1Complete(Quest, QuestGiver, Player)
	elseif Step == 2 then
		QuestComplete(Quest, QuestGiver, Player)
		end
end