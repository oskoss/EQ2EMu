--[[
    Script Name    : Quests/TheDownBelow/working_the_down_below.lua
    Script Author  : Premierio015
    Script Date    : 2021.09.27 06:09:27
    Script Purpose : 

        Zone       : TheDownBelow
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]
require "SpawnScripts/Generic/DialogModule"


function Init(Quest)
    local RandomChoice = MakeRandomInt(1, 3)
	SetQuestFeatherColor(Quest, 3)
	SetQuestRepeatable(Quest)
	if RandomChoice == 1 then
	AddQuestStepKill(Quest, 1, "Get four forgotten soul rib cages.", 4, 100, "I've agreed to help merchant Adair Barnes gather items she intends on selling to her buyers in the Down Below.", 90, 8340029)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
	AddQuestStepKill(Quest, 2, "Get four tortured soul rib cages.", 4, 100, "I've agreed to help merchant Adair Barnes gather items she intends on selling to her buyers in the Down Below.", 90, 8340048)
	AddQuestStepCompleteAction(Quest, 2, "Step2Complete")
	AddQuestStepKill(Quest, 3, "Get four venomous watcher fangs.", 4, 100, "I've agreed to help merchant Adair Barnes gather items she intends on selling to her buyers in the Down Below.", 163, 8340051)
	AddQuestStepCompleteAction(Quest, 3, "Step3Complete")  
	elseif RandomChoice == 2 then
	AddQuestStepKill(Quest, 1, "Get four venomous keeper fangs.", 4, 100, "I've agreed to help merchant Adair Barnes gather items she intends on selling to her buyers in the Down Below.", 163, 8340050)
	AddQuestStepCompleteAction(Quest, 1, "Step1_1Complete")    
	AddQuestStepKill(Quest, 2, "Get four frenzied watcher fangs.", 4, 100, "I've agreed to help merchant Adair Barnes gather items she intends on selling to her buyers in the Down Below.", 163, 8340030)
	AddQuestStepCompleteAction(Quest, 2, "Step1_2Complete")  
	AddQuestStepKill(Quest, 3, "Get five vials of venom from frenzied watchers.", 5, 100, "I've agreed to help merchant Adair Barnes gather items she intends on selling to her buyers in the Down Below.", 178, 8340030)
	AddQuestStepCompleteAction(Quest, 3, "Step1_3Complete")   
	elseif RandomChoice == 3 then
	 AddQuestStepKill(Quest, 1, "Get five vials of venom from frenzied watchers.", 5, 100, "I've agreed to help merchant Adair Barnes gather items she intends on selling to her buyers in the Down Below.", 178, 8340030)
	AddQuestStepCompleteAction(Quest, 1, "Step3_1Complete") 
	 AddQuestStepKill(Quest, 2, "Get five vials of venom from rabid shrillers.", 5, 100, "I've agreed to help merchant Adair Barnes gather items she intends on selling to her buyers in the Down Below.", 178, 8340035)
	AddQuestStepCompleteAction(Quest, 2, "Step3_2Complete")
	AddQuestStepKill(Quest, 3, "Get five vials of venom from putrid vermin.", 5, 100, "I've agreed to help merchant Adair Barnes gather items she intends on selling to her buyers in the Down Below.", 178, 1990008, 1990010, 8340033)
	AddQuestStepCompleteAction(Quest, 3, "Step3_3Complete")    
    end
end

function Accepted(Quest, QuestGiver, Player)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Good. Let me write down in your journal what I need you to get.  Now hurry up, this stuff needs to stay fresh, got it?")
	Dialog.AddVoiceover("voiceover/english/merchant_adair_barnes/qey_catacomb01/merchant_barnes/merchant_barnes003.mp3", 800334803, 2767782322)
	Dialog.AddOption("Got it.")
	Dialog.Start()
end

function Declined(Quest, QuestGiver, Player)
	-- Add dialog here for when the quest is declined
end

function Deleted(Quest, QuestGiver, Player)
	-- Remove any quest specific items here when the quest is deleted
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I've got four forgotten soul rib cages.")
    Progress(Quest, QuestGiver, Player)
end

function Step2Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I've got tortured soul rib cages.")
    Progress(Quest, QuestGiver, Player)
end

function Step3Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 3, "I've got four venomous watcher fangs.")
   Progress(Quest, QuestGiver, Player)
end

function Step1_1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I've got four venomous keeper fangs.")
    Progress(Quest, QuestGiver, Player)
end

function Step1_2Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I've got four frenzied watcher fangs.")
   Progress(Quest, QuestGiver, Player)
end

function Step1_3Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 3, "I've got five vials of venom.")
    Progress(Quest, QuestGiver, Player)
end

function Step3_1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I've got five vials of venom.")
    Progress(Quest, QuestGiver, Player)
end


function Step3_2Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I've got five vials of venom from rabid shrillers.")
    Progress(Quest, QuestGiver, Player)
end

function Step3_3Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 3, "I've got five vials of venom from putrid vermin.")
	Progress(Quest, QuestGiver, Player)
end	


function Progress(Quest, QuestGiver, Player)
if QuestStepIsComplete(Player, 5365, 1)  and QuestStepIsComplete(Player, 5365, 2) and QuestStepIsComplete(Player, 5365, 3) then
	UpdateQuestTaskGroupDescription(Quest, 2, "I've got all of the items merchant Barnes asked me to obtain.  I should get them back to her as soon as possible.")
	AddQuestStepChat(Quest, 4, "I need to get this stuff to merchant Barnes.", 1, "I need to get these items back to merchant Barnes, here in the Down Below.", 11, 8340001)
	AddQuestStepCompleteAction(Quest, 4, "QuestComplete")
end
   end


function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 4, "I've spoken with merchant Barnes.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I've spoken with and given merchant Barnes the items.")

	UpdateQuestDescription(Quest, "I've helped merchant Adair Barnes gather a bunch of items for her customers in the Down Below.  If I'm going to be in the area for a while perhaps she would like some more help.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
    local RandomChoice = MakeRandomInt(1, 3)
	if Step == 1 then
	   if RandomChoice == 1 then
		Step1Complete(Quest, QuestGiver, Player)
	  elseif RandomChoice == 2 then
		Step1_1Complete(Quest, QuestGiver, Player)
	   elseif RandomChoice == 3 then
		Step3_1Complete(Quest, QuestGiver, Player)
	end	
elseif Step == 2 then
    	 if RandomChoice == 1 then
		Step2Complete(Quest, QuestGiver, Player)
	  elseif RandomChoice == 2 then
		Step1_2Complete(Quest, QuestGiver, Player)
	   elseif RandomChoice == 3 then
		Step3_2Complete(Quest, QuestGiver, Player)
		end
elseif Step == 3 then
        if RandomChoice == 1 then
		Step3Complete(Quest, QuestGiver, Player)
	  elseif RandomChoice == 2 then
		Step1_3Complete(Quest, QuestGiver, Player)
	   elseif RandomChoice == 3 then
		Step3_3Complete(Quest, QuestGiver, Player)
		end
	elseif Step == 4 then
		QuestComplete(Quest, QuestGiver, Player)
		
	end
end
