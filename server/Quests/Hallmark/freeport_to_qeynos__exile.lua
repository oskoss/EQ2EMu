--[[
    Script Name    : Quests/Hallmark/freeport_to_qeynos__exile.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.26 11:09:16
    Script Purpose : 

        Zone       : Hallmark
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]
require "SpawnScripts/Generic/DialogModule"



function Accepted(Quest, QuestGiver, Player)
    FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)   
 	Dialog.AddDialog("Stow away on a ship and travel to Antonica.  I will send a message to my old friend, Vishra.  Seek him out near the gnoll's lair where he fights to stop their impending threat.  I will tell him that you need a home. Go before it's too late!")
    Dialog.AddOption("Thank you Selindi. I will go to Antonica!")	
	Dialog.Start()
end

function Declined(Quest, QuestGiver, Player)
OfferQuest(nil,Player,5891)
end


function Init(Quest)
	AddQuestStepChat(Quest, 1, "Speak with Selindi in the Commonlands.", 1, "I need to speak with Executioner Selindi in the Commonlands.", 11, 330235)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
    UpdateQuestZone(Quest,"The Commonlands")
end

function Accepted(Quest, QuestGiver, Player)
	-- Add dialog here for when the quest is accepted
end

function Declined(Quest, QuestGiver, Player)
	-- Add dialog here for when the quest is declined
end

function Deleted(Quest, QuestGiver, Player)
	-- Remove any quest specific items here when the quest is deleted
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I've spoken with Selindi.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I spoke with Selindi about becoming a Qeynos citizen.")

	AddQuestStepChat(Quest, 2, "I need to find Vishra in Antonica.", 1, "Selindi instructed me to travel to Antonica and seek out Vishra.  It seems he can offer me a new home.  I am told that he can be found where the gnoll's make their home, preventing them from harming others.  I only hope he will see me for what I am, not what I was.", 11, 120402)
	AddQuestStepCompleteAction(Quest, 2, "Step2Complete")
end

function Step2Complete(Quest, QuestGiver, Player)
    UpdateQuestZone(Quest,"Multiple Zones")
	UpdateQuestStepDescription(Quest, 2, "I have found Vishra the Ranger.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I have found Vishra, but he turned me away for now.")
	AddQuestStepKillByRace(Quest, 3, "Strike into the heart of Blackburrow and attempt to put an end to their merciless attacks on Qeynosians.", 500, 100, "Vishra has tasked me with defending the innocent against those who seek to slaughter them.", 1221,298)
	AddQuestStepKill(Quest, 4, "Defeat Dancoed of the Pine in Antonica and end the threat he presents.", 1, 100, "Vishra has tasked me with defending the innocent against those who seek to slaughter them.", 1221, 1)
	AddQuestStepKill(Quest, 5, "Remove the threat Sarn the Wayfarer presents to the people of Antonica.", 1, 100, "Vishra has tasked me with defending the innocent against those who seek to slaughter them.", 1220, 1)
	AddQuestStepKill(Quest, 6, "Catch Towyn the Lazy unaware in Antonica and put an end to him.", 1, 100, "Vishra has tasked me with defending the innocent against those who seek to slaughter them.", 1221, 1)
	AddQuestStepKill(Quest, 7, "Find Crugybar the Rock in Blackburrow and stop him from mining ore for gnoll weapons.", 1, 100, "Vishra has tasked me with defending the innocent against those who seek to slaughter them.", 1220, 170038)
	AddQuestStepKill(Quest, 8, "Seek out and slay Nantglas the Cold in Blackburrow.", 1, 100, "Vishra has tasked me with defending the innocent against those who seek to slaughter them.", 1220, 170050)
	AddQuestStepCompleteAction(Quest, 3, "Step3Complete")
	AddQuestStepCompleteAction(Quest, 4, "Step4Complete")
	AddQuestStepCompleteAction(Quest, 5, "Step5Complete")
	AddQuestStepCompleteAction(Quest, 6, "Step6Complete")	
	AddQuestStepCompleteAction(Quest, 7, "Step7Complete")
	AddQuestStepCompleteAction(Quest, 8, "Step8Complete")
end

function Step3Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 3, "I fought for the forces of good and now understand the truth of virtue.")
    CheckProgress(Quest, QuestGiver, Player)
end

function Step4Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 4, "I have defeated Dancoed of the Pine.")
    CheckProgress(Quest, QuestGiver, Player)
end

function Step5Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 5, "I have removed Sarn the Wayfarer.")
    CheckProgress(Quest, QuestGiver, Player)
end

function Step6Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 6, "You have put an end to Towyn the Lazy.")
    CheckProgress(Quest, QuestGiver, Player)
end

function Step7Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 7, "You have stopped Crugybar the Rock.")
    CheckProgress(Quest, QuestGiver, Player)
end

function Step8Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 8, "I have slain Nantglas the Cold.")
    CheckProgress(Quest, QuestGiver, Player)
end

function CheckProgress(Quest, QuestGiver, Player)
    if QuestStepIsComplete(Player, 5891, 3) and
    QuestStepIsComplete(Player, 5891, 4) and
    QuestStepIsComplete(Player, 5891, 5) and
    QuestStepIsComplete(Player, 5891, 6) and
    QuestStepIsComplete(Player, 5891, 7) and
    QuestStepIsComplete(Player, 5891, 8) then
	UpdateQuestTaskGroupDescription(Quest, 3, "I have proved myself in battle against the enemies of Qeynos: the gnolls.")

	AddQuestStepChat(Quest, 9, "Speak with Vishra once more.", 1, "While fighting monsters, I came to realize that I was no different than them.  Only when I refused to add hatred's strength to my attacks did I truly defeat my enemies.  I see now that virtue and wrath cannot co-exist.  I think it's time I speak with Vishra again.", 11, 120402)
	AddQuestStepCompleteAction(Quest, 9, "Step9Complete")
end
end

function Step9Complete(Quest, QuestGiver, Player)
    UpdateQuestZone(Quest,"Antonica")
	UpdateQuestStepDescription(Quest, 9, "I have spoken with Vishra again")
	UpdateQuestTaskGroupDescription(Quest, 4, "I have spoken with Vishra and shown him my new understanding.")

	AddQuestStepChat(Quest, 10, "Speak with Timothy Cooper.", 1, "Vishra has asked that I speak with Timothy Cooper and offer my assistance to him.", 11, 1)
	AddQuestStepCompleteAction(Quest, 10, "Step10Complete")
end

function Step10Complete(Quest, QuestGiver, Player)
    UpdateQuestZone(Quest,"Antonica")
	UpdateQuestStepDescription(Quest, 10, "I have spoken with Timothy Cooper.")
	UpdateQuestTaskGroupDescription(Quest, 5, "I have spoken with Timothy Cooper")

	AddQuestStepChat(Quest, 11, "Speak with Felzik Dursin in Antonica.", 1, "I must seek out Felzik Dursin and offer my aid.", 11, 1)
	AddQuestStepCompleteAction(Quest, 11, "Step11Complete")
end

function Step11Complete(Quest, QuestGiver, Player)
    UpdateQuestZone(Quest,"Antonica")
	UpdateQuestStepDescription(Quest, 11, "I found out what Felzik was doing and put a stop to it.")
	UpdateQuestTaskGroupDescription(Quest, 6, "I've put an end to the slave trade that Felzik Dursin was running.")

	AddQuestStepChat(Quest, 12, "Speak with Vishra once more.", 1, "I must return to Vishra to let him know what I've done.", 11, 120402)
	AddQuestStepCompleteAction(Quest, 12, "Step12Complete")
end

function Step12Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 12, "I have spoken with Vishra.")
	UpdateQuestTaskGroupDescription(Quest, 7, "I've spoken with Vishra and have received another task.")

	AddQuestStepChat(Quest, 13, "Speak with Darvin Gallowyn in Antonica.", 1, "Vishra has asked that I speak with children and convince them to follow the path of good.", 11, 1)
	AddQuestStepCompleteAction(Quest, 13, "Step13Complete")
end

function Step13Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 13, "I have convinced Darvin Gallowyn to turn away from the darkness.")
	UpdateQuestTaskGroupDescription(Quest, 8, "I have convinced Sialla Windwhisper to turn away from the darkness.")

	AddQuestStepChat(Quest, 14, "Speak with Wolfgang Constantine in Antonica.", 1, "Vishra has asked that I speak with children and convince them to follow the path of good.", 11, 1)
	AddQuestStepCompleteAction(Quest, 14, "Step14Complete")
end

function Step14Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 14, "I have convinced Wolfgang Constantine to turn away from the darkness.")
	UpdateQuestTaskGroupDescription(Quest, 9, "I have convinced Wolfgang Constantine to turn away from the darkness.")

	AddQuestStepChat(Quest, 15, "Speak with Sialla Windwhisper in Antonica.", 1, "Vishra has asked that I speak with children and convince them to follow the path of good.", 11, 1)
	AddQuestStepCompleteAction(Quest, 15, "Step15Complete")
end

function Step15Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 15, "I have convinced Sialla Windwhisper to turn away from the darkness.")
	UpdateQuestTaskGroupDescription(Quest, 10, "I have convinced Sialla Windwhisper to turn away from the darkness.")

	AddQuestStepChat(Quest, 16, "Speak with Vishra again.", 1, "I must return to Vishra to let him know what I've done.", 11, 120402)
	AddQuestStepCompleteAction(Quest, 16, "Step16Complete")
end

function Step16Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 16, "I have spoken with Vishra.")
	UpdateQuestTaskGroupDescription(Quest, 11, "I've spoken with Vishra and have received another task.")

	AddQuestStepChat(Quest, 17, "Speak with Magistrate Rachelle and confess your crimes.", 1, "Vishra has bid me confess any crimes that I may have committed to Lower Magistrate Rachelle in Antonica.", 11, 1)
	AddQuestStepCompleteAction(Quest, 17, "Step17Complete")
end

function Step17Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 17, "I have spoken with Magistrate Rachelle and my honesty has won me her backing.")
	UpdateQuestTaskGroupDescription(Quest, 12, "I have spoken with Magistrate Rachelle and my honesty has won me her backing.")

	AddQuestStepChat(Quest, 18, "Speak with Vishra once more.", 1, "I must return to Vishra and speak to him once more.", 11, 120402)
	AddQuestStepCompleteAction(Quest, 18, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 18, "I have spoken with Vishra again.")
	UpdateQuestTaskGroupDescription(Quest, 13, "Vishra has absolved me of all crimes and I am now free to walk among the citizens of Qeynos.")

	UpdateQuestDescription(Quest, "During the time I spent in exile, I thought upon what it means to hold the ideals of virtue.  I understand that the ends do not justify the means, but rather the path that one takes decides what is good or evil.  Though a good life is harder, it is more rewarding.")
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
		Step7Complete(Quest, QuestGiver, Player)
	elseif Step == 8 then
		Step8Complete(Quest, QuestGiver, Player)
	elseif Step == 9 then
		Step9Complete(Quest, QuestGiver, Player)
	elseif Step == 10 then
		Step10Complete(Quest, QuestGiver, Player)
	elseif Step == 11 then
		Step11Complete(Quest, QuestGiver, Player)
	elseif Step == 12 then
		Step12Complete(Quest, QuestGiver, Player)
	elseif Step == 13 then
		Step13Complete(Quest, QuestGiver, Player)
	elseif Step == 14 then
		Step14Complete(Quest, QuestGiver, Player)
	elseif Step == 15 then
		Step15Complete(Quest, QuestGiver, Player)
	elseif Step == 16 then
		Step16Complete(Quest, QuestGiver, Player)
	elseif Step == 17 then
		Step17Complete(Quest, QuestGiver, Player)
	elseif Step == 18 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end

