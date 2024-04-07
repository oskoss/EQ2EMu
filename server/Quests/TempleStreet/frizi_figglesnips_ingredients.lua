--[[
    Script Name    : Quests/TempleStreet/frizi_figglesnips_ingredients.lua
    Script Author  : Dorbin
    Script Date    : 2023.11.07 01:11:46
    Script Purpose : 

        Zone       : TempleStreet
        Quest Giver: Frizi 
        Preceded by: None
        Followed by: 
--]]

require "SpawnScripts/Generic/DialogModule"

function Init(Quest)
	AddQuestStepKill(Quest, 1, "I need to find a glassy crab eye.", 1, 66, "I must find the ingredients that Frizi needs.", 83, 8410002,8410001,8410017)
	AddQuestStepKill(Quest, 2, "I must find a shoreside adder fang.", 1, 66, "I must find the ingredients that Frizi needs.", 137, 8420018,8420020)
	AddQuestStepKill(Quest, 3, "I must find a unbroken scorpion stinger.", 1, 66, "I must find the ingredients that Frizi needs.", 202, 8410010)
	AddQuestStepKill(Quest, 4, "I must find an oversized rat stomach.", 1, 66, "I must find the ingredients that Frizi needs.", 109, 8430009,8430010,8430011,8430029,8430008,8400001,8400002,8400003,8400004)
    UpdateQuestZone(Quest,"Multiple Zones")


	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
	AddQuestStepCompleteAction(Quest, 2, "Step2Complete")
   	AddQuestStepCompleteAction(Quest, 3, "Step3Complete")
   	AddQuestStepCompleteAction(Quest, 4, "Step4Complete")

end

function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("Let's see, I need a glassy crab eye and a scorpion stinger--you'll find both items in the Sunken City. I also need a shoreside adder fang from the Sprawl or Ruins. Finally, an enlarged rat stomach from... somewhere. Return to me after you gather these ingredients.")
	Dialog.AddOption("I'll get to it.")
	Dialog.Start()
end



function Declined(Quest, QuestGiver, Player)
	-- Add dialog here for when the quest is declined
end

function Deleted(Quest, QuestGiver, Player)
	-- Remove any quest specific items here when the quest is deleted
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I have found a glassy crab eye.")
    CheckProgress(Quest, QuestGiver, Player)
end

function Step2Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I have found a snake fang.")
    CheckProgress(Quest, QuestGiver, Player)
end

function Step3Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 3, "I have found a dune scorpion stinger.")
    CheckProgress(Quest, QuestGiver, Player)
end

function Step4Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 4, "I have found a oversized rat stomach.")
    CheckProgress(Quest, QuestGiver, Player)
end

 function  CheckProgress(Quest, QuestGiver, Player)
      if QuestStepIsComplete(Player, 5923, 1) and QuestStepIsComplete(Player, 5923, 2) and QuestStepIsComplete(Player, 5923, 3) and QuestStepIsComplete(Player, 5923, 4) then
	UpdateQuestTaskGroupDescription(Quest, 1, "I have found all of ingredients Frizi needs.")
	AddQuestStepChat(Quest, 5, "I need to speak to Frizi.", 1, "I need to deliver these ingredients to Frizi Figglesnip in her shop.", 11, 1360053)
	AddQuestStepCompleteAction(Quest, 5, "QuestComplete")
    UpdateQuestZone(Quest,"Temple Street")
 end    
    end




function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 5, "I've given Frizi the ingredients she asked for.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I've given Frizi the ingredients she had asked for.")

	UpdateQuestDescription(Quest, "I gathered four ingredients for Frizi Figglesnip. When I returned them to her, she rewarded me with a pair of magical gloves.")
	GiveQuestReward(Quest, Player)
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

