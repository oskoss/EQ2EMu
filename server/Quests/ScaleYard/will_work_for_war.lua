--[[
	Script Name		:	will_work_for_war.lua
	Script Purpose	:	Handles the quest, "Will Work for War"
	Script Author	:	Dorbin
	Script Date		:	25.07.2022
	Script Notes	:	

	Zone			:	Scale Yard
	Quest Giver		:	Colin Stoutfist
	Preceded by		:	None
	Followed by		:	Will Fight for Fun
--]]
require "SpawnScripts/Generic/DialogModule"

function Init(Quest)
	AddQuestStepChat(Quest, 1, "I need to speak with Coldbrow in the Scale Yard.", 1, "I need to find and speak with this so-called Warchief.", 11, 1390036)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I have spoken with Coldbrow.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I have spoken to Dunn Coldbrow and was told to tell Colin to calm down.")

    AddQuestStepChat(Quest, 2, "I should let Colin know that Dunn Coldbrow doesn't have any plans right now.", 1, "Colin's not going to be too happy when I let him know that there's no work for him.", 11, 1390052)
    AddQuestStepCompleteAction(Quest, 2, "Step2Complete")
end

function Step2Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I have returned to Colin Stoutfist.")
	UpdateQuestTaskGroupDescription(Quest, 1, "Colin has now asked me to speak with Mirin here to see if there's any work for him.")
    AddQuestStepChat(Quest, 3, "I should speak to Mirin Zilishia.", 1, "I need to try to find this Mirin guy and let him know Colin's asking for work.", 11, 1390006)
    AddQuestStepCompleteAction(Quest, 3, "Step3Complete")
end

function Step3Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 3, "I have spoken with Mirin Zilishia.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I have spoken to Mirin Zilishia in Scale Yard.")

    AddQuestStepChat(Quest, 4, "I should let Colin know that Dunn Coldbrow doesn't have any plans right now.", 1, "Colin's not going to be too happy when I let him know that there's no work for him.", 11, 1390052)
    AddQuestStepCompleteAction(Quest, 4, "Step4Complete")
end

function Step4Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 4, "I have spoken with Mirin Zilishia.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I have spoken to Mirin Zilishia in Scale Yard.")
--Colin's not going to be too happy when I let him know that there's no work for him.
    AddQuestStepChat(Quest, 5, "I need to speak with Colin in the Scale Yard.", 1, "Colin's not going to be too happy when I let him know that there's no work for him.", 11, 1390052)
    AddQuestStepCompleteAction(Quest, 5, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 5, "I have returned to Colin Stoutfist.")
	UpdateQuestTaskGroupDescription(Quest, 3, "Colin was quite disappointed when I told him about the lack of work.")
	UpdateQuestDescription(Quest, "Colin Stoutfist is quite upset with the state of things in Scale Yard. It seems he has nothing to do, and began to make an unpleasant comment about his Warchief. He had the wisdom to stop mid-sentence.")
	GiveQuestReward(Quest, Player)
end

function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("Warchief Dunn Coldbrow is in his palace.  I tell you, when we crush the last of those filthy orcs, their citadel will be ours!  Then we barbarians will toss Lucan out on his big, bony butt, and roast his annoying iksar on spits!  Mmm ... I hear iksar meat tastes just like tundrafowl.")
	Dialog.AddVoiceover("voiceover/english/colin_stoutfist/fprt_hood06/quests/colinstoutfist/colin_x1_accept.mp3",1343954066,3596296789)
    PlayFlavor(QuestGiver, "","","frustrated",0,0, Player)
	Dialog.AddOption("I'll return once I've spoken with him.")
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
	    Step2Complete(Quest, QuestGiver, Player)
	elseif Step == 3 then
	    Step3Complete(Quest, QuestGiver, Player)
	elseif Step == 4 then
	    Step4Complete(Quest, QuestGiver, Player)
	elseif Step == 5 then
	    QuestComplete(Quest, QuestGiver, Player)
	end
end

