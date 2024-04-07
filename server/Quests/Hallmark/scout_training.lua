--[[
    Script Name    : Quests/Hallmark/scout_training.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.29 02:09:41
    Script Purpose : 

        Zone       : Hallmark
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]
require "SpawnScripts/Generic/DialogModule"

function Init(Quest)
	AddQuestStepKill(Quest, 1, "I need to kill five rust monsters.", 5, 100, "Emissary Millia wants me to go to the Sunken City and kill five mature Rust Monsters. She claims that a Rogue always keeps open an avenue of escape.", 142, 1240011,8410008)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
    UpdateQuestZone(Quest,"Sunken City")
end

function Accepted(Quest, QuestGiver, Player)
    FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)   
 	Dialog.AddDialog("Let's see if you have the skills to go with that mouth of yours, eh? Being a scout doesn't take much, a couple of eyes, working limbs, that's about all can get out of a sticky situation. If you do, you'll go even further. For instance, a good rogue always has an escape route. Go into the Sunken City and clear an escape path. Kill several Rust Monsters, and then comes back. If you return in one piece, maybe I shows you a few more tricks.")
    Dialog.AddOption("I won't need to escape when they're dead! I'll return shortly.")	
	Dialog.Start()
end

function Declined(Quest, QuestGiver, Player)
	-- Add dialog here for when the quest is declined
end

function Deleted(Quest, QuestGiver, Player)
	-- Remove any quest specific items here when the quest is deleted
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I killed five rust monsters.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I've killed five Rust Monsters as Millia has asked. If I were a Rogue and needed to get out of the city really fast, that would definitely help.")
    UpdateQuestZone(Quest,"North Freeport")

	AddQuestStepChat(Quest, 2, "I need to speak with Emissary Millia", 1, "I should let Millia know that I've done what she suggested.", 11, 1440464)
	AddQuestStepCompleteAction(Quest, 2, "Step2Complete")
end

function Step2Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I have spoken with Emissary Millia")
	UpdateQuestTaskGroupDescription(Quest, 2, "Millia was pleased with the way I handled the situation.")
    UpdateQuestZone(Quest,"Multiple Zones")

	AddQuestStepChat(Quest, 3, "I should do some type of buffoonery in front of bartender Grum Zoomly of the Back Alley Brewhouse", 1, "Emissary Millia has now forced me to act the role of the fool in front of a couple bartenders here in the city.  I can't believe I'm about to do this....", 11,1280029	)
	AddQuestStepChat(Quest, 4, "I should sing my own special type of love song to bartender, Ranik Calman, of the Seafarer's Roost.", 1, "Emissary Millia has now forced me to act the role of the fool in front of a couple bartenders here in the city.  I can't believe I'm about to do this....", 11, 1680080	)
	AddQuestStepCompleteAction(Quest, 3, "Step3Complete")
	AddQuestStepCompleteAction(Quest, 4, "Step4Complete")
end

function Step3Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 3, "I conned Grum Zoomly into thinking I am a fool.")
    CheckProgress(Quest, QuestGiver, Player)

end

function Step4Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 4, "I've sang my song to Ranik Calman and also managed to swipe a gold coin for Millia.")
    CheckProgress(Quest, QuestGiver, Player)
end	
	
function CheckProgress(Quest, QuestGiver, Player)
    if QuestStepIsComplete(Player, 5910, 3) and QuestStepIsComplete(Player, 5910, 4)  then
   	UpdateQuestTaskGroupDescription(Quest, 3, "I've convinced the bartenders I was an idiot, and in doing so they let their guard down. I could get away with murder being a Bard.")
    UpdateQuestZone(Quest,"North Freeport")

	AddQuestStepChat(Quest, 5, "I need to speak with Emissary Millia", 1, "I should return to Millia and also give her this gold coin I swiped when Ranik wasn't looking.", 11, 1440464)
	AddQuestStepCompleteAction(Quest, 5, "Step5Complete")
end
end

function Step5Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 5, "I have spoken with Emissary Millia")
	UpdateQuestTaskGroupDescription(Quest, 4, "I told Millia about my buffoonery and she agreed that Bards are far more dangerous than they look.")
    UpdateQuestZone(Quest,"Theives' Way")

	AddQuestStepKill(Quest, 6, "I need to kill five Darkblade Scouts.", 5, 100, "Emissary Millia wants me to stalk the sewers for Darkblade Scouts and kill five of them.", 91, 8430008,1540040	, 1540027)
	AddQuestStepCompleteAction(Quest, 6, "Step6Complete")
end

function Step6Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 6, "I killed five Darkblade Scouts.")
	UpdateQuestTaskGroupDescription(Quest, 5, "I've killed five Darkblade Scouts the way a Predator would take care of their victims.")
    UpdateQuestZone(Quest,"North Freeport")

	AddQuestStepChat(Quest, 7, "I need to speak with Emissary Millia.", 1, "I should return to Millia to let her know that I was able to take care of the competition.", 11, 1440464)
	AddQuestStepCompleteAction(Quest, 7, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 7, "I spoke with Emissary Millia.")
	UpdateQuestTaskGroupDescription(Quest, 6, "Millia has let me know that I've learned all of the tricks she's willing to teach me.")

	UpdateQuestDescription(Quest, "I have been given a taste of what the Emissary does for Freeport, and it seems intriguing. With that in mind, I think I'm going to specialize in certain skills so that one day I might be in a position to do what she does. Either way, I'm pretty sure I can find some good loot in the meantime. ")
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
		Step5Complete(Quest, QuestGiver, Player)
	elseif Step == 6 then
		Step6Complete(Quest, QuestGiver, Player)
	elseif Step == 7 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end
