--[[
	Script Name		:	avoiding_the_sea_beasties.lua
	Script Purpose	:	Handles the quest, "Avoiding the Sea Beasties"
	Script Author	:	torsten\\Dorbin
	Script Date		:	23.07.2022
	Script Notes	:	

	Zone			:	Scale Yard
	Quest Giver		:	Dunn Coldbrow
	Preceded by		:	Ending the Fury
	Followed by		:	None
--]]

require "SpawnScripts/Generic/DialogModule"

function Init(Quest)
	AddQuestStepKill(Quest, 1, "I need to kill ten orcs in the Commonlands.", 10, 100, "I need to travel to the Commonlands and kill ten orcs.", 611, 330068, 330126, 330128, 330129, 330202, 330204, 330218, 330249, 330250, 330268, 330265, 330323, 330327)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
    UpdateQuestZone(Quest,"The Commonlands")
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I've killed the orcs in the Commonlands.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I have killed the orcs as I was tasked by the Warchief.")
    UpdateQuestZone(Quest,"Scale Yard")
    AddQuestStepChat(Quest, 2, "I should return to Dunn.", 1, "I should return to Dunn in Scale Yard and tell him about the orcs.", 11, 1390036)
    AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I've spoken with Dunn.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I've informed Dunn that the orcs have been destroyed and Lucan's men didn't intervene.")
    
	UpdateQuestDescription(Quest, "Dunn Coldbrow has chosen to ask Verin why I wasn't killed by Lucan when I killed the orcs.  I think I can see how his 'advisor' may be the real Warchief.  Dunn doesn't seem to have much common sense, only a very strong presence.")
	GiveQuestReward(Quest, Player)
end

function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("And face the wrath of Lucan?  Do you think I'm mad?  Verin says we're not to kill orcs without the Overlord's command.  But you could do it!  You seem eager for battle.  Arm yourself well, journey beyond the gates, and fight the Bloodskulls.  Crush them!  If you die, you'll die with honor; and if you return alive and victorious ... may the mighty fist of Lucan spare your life.")
	Dialog.AddVoiceover("voiceover/english/dunn_coldbrow/fprt_hood06/quests/dunncoldbrow/dunn_x2_accept.mp3",2604399476,564355703)
    PlayFlavor(QuestGiver, "","","boggle",0,0, Player)
	Dialog.AddOption("We'll just see about that.")
	Dialog.Start()
end

function Declined(Quest, QuestGiver, Player)
	-- Add dialog here for when the quest is declined
end

function Deleted(Quest, QuestGiver, Player)
	-- Remove any quest specific items here when the quest is deleted
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
	    Step1Complete(Quest, QuestGiver, Player)
	elseif Step == 2 then
	    QuestComplete(Quest, QuestGiver, Player)
	end
end
