--[[
    Script Name    : Quests/Hallmark/qeynos_to_freeport__exile.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.28 11:09:02
    Script Purpose : 

        Zone       : Hallmark
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]


function Init(Quest)
	AddQuestStepChat(Quest, 1, "Speak with Yuri in Antonica... he may have information to aid you.", 1, "After my brief encounter with the Jailer knocking me out, I awoke to find myself in Antonica.", 11, 120418)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
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
	UpdateQuestStepDescription(Quest, 1, "I've spoken with Yuri.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I've spoken with Yuri.  His recommendation for me was to find a man named Matthias Siegemaker in the Commonlands.")

	AddQuestStepChat(Quest, 2, "I need to find Matthias Siegemaker in the Commonlands.", 1, "Yuri instructed me to flee to the Commonlands and seek out Matthias.  It seems he can offer me a new home.  I am told he can be found slaughtering the &quot;cutthroats&quot;.  If I have any hope of finding a new home, it will be with him.", 11,331144)
	AddQuestStepCompleteAction(Quest, 2, "Step2Complete")
end

function Step2Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I have found Matthias Siegemaker")
	UpdateQuestTaskGroupDescription(Quest, 2, "I have found Matthias Siegemaker, but I was turned away.")

	AddQuestStepKill(Quest, 3, "Feed your hatred by annihilating all orcs you encounter in the Commonlands.", 500, 100, "Matthias refuses to speak with me again until I truly know what true vengeance and hatred means.  Until that time, I will suffer endlessly in this gods-forsaken world.  Meanwhile, I will slake my thirst for vengeance with the blood of those who slight me.  I should check back with him regularly as I learn from my experiences.", 2488, 1)
	AddQuestStepCompleteAction(Quest, 3, "Step3Complete")
end

function Step3Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 3, "I have sated my thirst for vengeance for the moment.")

	AddQuestStepKill(Quest, 4, "Seek vengeance on Dinas Drefelin in the Commonlands.", 1, 100, "Matthias refuses to speak with me again until I truly know what true vengeance and hatred means.  Until that time, I will suffer endlessly in this gods-forsaken world.  Meanwhile, I will slake my thirst for vengeance with the blood of those who slight me.  I should check back with him regularly as I learn from my experiences.", 611, 1)
	AddQuestStepCompleteAction(Quest, 4, "Step4Complete")
end

function Step4Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 4, "I have turned the knife in Dinas' side.")

	AddQuestStepKill(Quest, 5, "Destroy Garreg Stonecrusher, an orc that has been sighted in the Wailing Caves.", 1, 100, "Matthias refuses to speak with me again until I truly know what true vengeance and hatred means.  Until that time, I will suffer endlessly in this gods-forsaken world.  Meanwhile, I will slake my thirst for vengeance with the blood of those who slight me.  I should check back with him regularly as I learn from my experiences.", 611, 1)
	AddQuestStepCompleteAction(Quest, 5, "Step5Complete")
end

function Step5Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 5, "Garreg has been brought low.")

	AddQuestStepKill(Quest, 6, "Remove Dolfor Mochdre from the world of the living.  Seek him out in the Commonlands.", 1, 100, "Matthias refuses to speak with me again until I truly know what true vengeance and hatred means.  Until that time, I will suffer endlessly in this gods-forsaken world.  Meanwhile, I will slake my thirst for vengeance with the blood of those who slight me.  I should check back with him regularly as I learn from my experiences.", 611,1)
	AddQuestStepCompleteAction(Quest, 6, "Step6Complete")
end

function Step6Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 6, "Dolfor Mochdre has been removed.")

	AddQuestStepKill(Quest, 7, "Find Glan Mostyn in the Commonlands and tear the breath from his lungs.", 1, 100, "Matthias refuses to speak with me again until I truly know what true vengeance and hatred means.  Until that time, I will suffer endlessly in this gods-forsaken world.  Meanwhile, I will slake my thirst for vengeance with the blood of those who slight me.  I should check back with him regularly as I learn from my experiences.", 611, 1)
	AddQuestStepCompleteAction(Quest, 7, "Step7Complete")
end

function Step7Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 7, "Glan Mostyn breathes no longer.")

	AddQuestStepKill(Quest, 8, "Grug Geifr's offensive presence in the Commonlands can be tolerated no longer.", 1, 100, "Matthias refuses to speak with me again until I truly know what true vengeance and hatred means.  Until that time, I will suffer endlessly in this gods-forsaken world.  Meanwhile, I will slake my thirst for vengeance with the blood of those who slight me.  I should check back with him regularly as I learn from my experiences.", 611, 1)
	AddQuestStepCompleteAction(Quest, 8, "Step8Complete")
end

function Step8Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 8, "You have removed Grug Geifr from the Commonlands.")
	UpdateQuestTaskGroupDescription(Quest, 3, "I have spent a long time wandering the world and have learned to hate unlike no other.")

	AddQuestStepChat(Quest, 9, "Return to Matthias Siegemaker in the Commonlands.", 1, "Every creature that died by my hands wore the face of those who betrayed me.  I now know that vengeance can never be satisifed.  In turn, I will always have something to look forward to.  It is time I speak with Matthias again.", 11, 331144)
	AddQuestStepCompleteAction(Quest, 9, "Step9Complete")
end

function Step9Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 9, "I have spoken with Matthias.")
	UpdateQuestTaskGroupDescription(Quest, 4, "I have spoken with Matthias and shown him my new understanding.")

	AddQuestStepChat(Quest, 10, "Stop the message runner in the Commonlands.", 1, "I must kill the Message Runner and take his codes.", 11, 1)
	AddQuestStepCompleteAction(Quest, 10, "Step10Complete")
end

function Step10Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 10, "I've killed the message runner.")
	UpdateQuestTaskGroupDescription(Quest, 5, "I slew the message runner and took what I needed.")

	AddQuestStepKill(Quest, 11, "Kill Libertius in the Commonlands, use the codes from the messenger to gain his trust.", 1, 100, "Kill Libertius, but do not alert him to the fact that you have been sent to kill him... at least not until he's already dead.", 11, 1)
	AddQuestStepCompleteAction(Quest, 11, "Step11Complete")
end

function Step11Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 11, "I have slain Libertius.")
	UpdateQuestTaskGroupDescription(Quest, 6, "I poisoned Libertius and prevented him from smuggling more to Qeynos.")

	AddQuestStepChat(Quest, 12, "Return to Matthias Siegemaker in the Commonlands.", 1, "I have done as Matthias asked and now I must return to speak with him again.", 11, 331144)
	AddQuestStepCompleteAction(Quest, 12, "Step12Complete")
end

function Step12Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 12, "I have spoken with Matthias.")
	UpdateQuestTaskGroupDescription(Quest, 7, "I have spoken with Matthias once more and he has given me further enlightenment.")

	AddQuestStepChat(Quest, 13, "Take the Aethus Kasyu's engagement ring.", 1, "Matthias has bid me take items from people who... no longer have a use for them... the first on the list is a ring from Aethus Kasyu.", 595, 1)
	AddQuestStepCompleteAction(Quest, 13, "Step13Complete")
end

function Step13Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 13, "I've taken the ring from Aethus.")
	UpdateQuestTaskGroupDescription(Quest, 8, "I have taken the items Matthias wanted.")

	AddQuestStepChat(Quest, 14, "Seek out Twirlwhizzer and take the medal from her.", 1, "Now that the ring is dealt with, I'm to take the medal of service from a gnome named Twirlwhizzer.", 1303, 1)
	AddQuestStepCompleteAction(Quest, 14, "Step14Complete")
end

function Step14Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 14, "I've taken the medal from Grandma Twirlwhizzer.")
	UpdateQuestTaskGroupDescription(Quest, 9, "The medal is mine!")

	AddQuestStepChat(Quest, 15, "Seek out Stalker Granis and take his lucky shard.", 1, "Stalker Granis has a nice shard that he keeps as a childhood reminder.  Take it from him.", 183, 1)
	AddQuestStepCompleteAction(Quest, 15, "Step15Complete")
end

function Step15Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 15, "I've taken the last thing Granis holds dear.")
	UpdateQuestTaskGroupDescription(Quest, 10, "I've taken the last thing Granis has to remember his childhood by.")

	AddQuestStepChat(Quest, 16, "Return to Matthias Siegemaker in the Commonlands.", 1, "I have done as Matthias asked and now I must return to speak with him again.", 11, 331144)
	AddQuestStepCompleteAction(Quest, 16, "Step16Complete")
end

function Step16Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 16, "I have spoken with Matthias.")
	UpdateQuestTaskGroupDescription(Quest, 11, "I have yet another task laid before me now that I have spoken with Matthias.")

	AddQuestStepKill(Quest, 17, "Kill Gesarius before he can escape to Qeynos.", 1, 100, "Matthias is pleased with my progress... and has asked me to make certain War Duke Gesarius doesn't escape.", 11, 1)
	AddQuestStepCompleteAction(Quest, 17, "Step17Complete")
end

function Step17Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 17, "I've killed the War Duke and prevented his escape.")
	UpdateQuestTaskGroupDescription(Quest, 12, "I'm positive that Gesarius won't be escaping anytime soon...")

	AddQuestStepChat(Quest, 18, "Return to Matthias Siegemaker in the Commonlands.", 1, "I have done as Matthias asked and now I must return to speak with him again.", 11, 331144)
	AddQuestStepCompleteAction(Quest, 18, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 18, "I have spoken with Matthias.")
	UpdateQuestTaskGroupDescription(Quest, 13, "I have earned my place within Freeport now.")

	UpdateQuestDescription(Quest, "During my time in exile, I spent day and night cultivating my vengeance towards those who spurned me and betrayed my trust.  I can now see my own soul, and find it to be black and twisted.  This comforts me. ")
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
