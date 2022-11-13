--[[
    Script Name    : Quests/Hallmark/welcome_to_qeynos_Starcrest.lua
    Script Author  : Dorbin
    Script Date    : 2022.10.28 03:10:03
    Script Purpose : 

        Zone       : Hallmark
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]
 require "SpawnScripts/Generic/DialogModule"

function Init(Quest)
	AddQuestStepZoneLoc(Quest, 1, "Use the room door to be given your inn room.  Click on the \"Buy\" button to get your room.  Once you have purchased your room click on \"Enter\" to enter your room.", 10, "I've been instructed to sign in at the inn's guest registry in order to get the key to my room.", 11,-5.21, 0.00, 0.03,223)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
    UpdateQuestZone(Quest,"Starcrest Commune")
end

function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("You are in the Starcrest Commune, a village surrounding the city of Qeynos. Many humans and Erudites call Starcrest home. Soon, you will call it home as well. Please, venture on now. Your new caretaker awaits you. I've confidence in you, young one. I know you will do well in our village.")
    PlayFlavor(QuestGiver,"","","orate",0,0,Player)
	Dialog.AddVoiceover("voiceover/english/steward_daedeakovoon/qey_village02/steward_daedeakovoon004.mp3", 2169284616, 3409785704)
	Dialog.AddOption("Well, thank you for your assistance, Steward.")
	Dialog.Start()
    if HasQuest(Player,5717) and GetQuestStep(Player,5717)==2 then
        SetStepComplete(Player,5717,2)
    end        
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I've been given your inn room")
	UpdateQuestTaskGroupDescription(Quest, 1, "I've been given the key to my room and can now come and go as I please.")
	AddQuestStepChat(Quest, 2, "I need to introduce myself to the caretaker.", 1, "I need to introduce myself to the caretaker",11,2230785)
	AddQuestStepCompleteAction(Quest, 2, "Step2Complete")   
end

function Step2Complete(Quest, QuestGiver, Player)
    UpdateQuestStepDescription(Quest, 2, "I've introduced myself to the caretaker of my room")
	UpdateQuestTaskGroupDescription(Quest, 2, "I've introduced myself to the caretaker of my innroom, Ms. Fairlee.")

	AddQuestStep(Quest, 3, "I need to place the table in my inn room and speak with the caretaker.", 1, 100, "I've spoken with the caretaker of the inn, Fairlee.  She gave me a table to put in my room, claiming that the Ironforge Exchange has offered it to me.  I should place this on the floor and then continue speaking with her.",11)
	AddQuestStepCompleteAction(Quest, 3, "Step3Complete")   
end

function Step3Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 3, "I've placed the table and spoken with the caretaker.")
	UpdateQuestTaskGroupDescription(Quest, 3, "I've placed the table and spoken with the caretaker.")
	AddQuestStepChat(Quest, 4, "Speak with the Banker Orudormo in Nettleville Hovel.", 1, "Ms. Fairlee has informed me that I have a bank account waiting for me.  I need to speak with the Banker Caroline to open the account.",11,2340031)
	AddQuestStepCompleteAction(Quest, 4, "Step4Complete")   
end

function Step4Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 4, "I've spoken with the Banker Orudormo in Starcrest Commune.")
	UpdateQuestTaskGroupDescription(Quest, 4, "I've spoken with the Banker in the Starcrest Commune.")
	AddQuestStepChat(Quest, 5, "Return to your room and speak with Caretaker Fairlee.", 1, "I should return to the caretaker in my inn room.",11,2230785)
	AddQuestStepCompleteAction(Quest, 5, "Step5Complete")   
end

function Step5Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 5, "I've returned to my room and spoken with caretaker Fairlee.")
	UpdateQuestTaskGroupDescription(Quest, 5, "I've returned to my room and spoken with caretaker Fairlee.  She gave me a painting of hers to place on my walls.")
	AddQuestStep(Quest, 6, "Open your inventory.  \"Place\" your new painting and then speak with the caretaker.", 1,100, "Caretake Fairlee has suggested that I place the painting on my walls to liven up the place.  I should place the painting and then ask her about The Baubbleshire.",0)
	AddQuestStepCompleteAction(Quest, 6, "Step6Complete")   
end

function Step6Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 6, "I've placed the painting and spoken with the caretaker.")
	UpdateQuestTaskGroupDescription(Quest, 6, "I've placed the painting and spoken with the caretaker.")
	AddQuestStepZoneLoc(Quest, 7, "I need to visit the gates to the Peat Bog.",6,"\"Some people choose to adventure in the Peat Bog.  It's a dangerous place, so watch yourself.  Here's where you can find the gates to the Bog.  I'll show you a few other places after you take a look at the gates.\" - Ms. Fairlee", 11,769.35, -26.47, 360.3,234)
	AddQuestStepCompleteAction(Quest, 7, "Step7Complete")   
end

function Step7Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 7, "I've found the gates to the Peat Bog.")
	UpdateQuestTaskGroupDescription(Quest, 7, "I've visisted one of four locations Ms. Fairlee has told me about.")
	AddQuestStepChat(Quest, 8, "I need to introduce myself to the Starcrest crafting trainer, Erian Seaver.",1,"\"Not all coin gained by refugees comes from battling vermin. Crafting is a great opportunity for some refugees to become skilled in a tradeskill.  You should meet with the crafting trainer outside The Luminary Cache so you become familiar with where to begin a tradeskill if you so desire.\" - Ms. Fairlee", 11,2340036)
	AddQuestStepCompleteAction(Quest, 8, "Step8Complete")   
end

function Step8Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 8, "I've met with the village crafting trainer.")
	UpdateQuestTaskGroupDescription(Quest, 8, "I've visisted two of four locations Ms. Fairlee has told me about.")
	AddQuestStepZoneLoc(Quest, 9, "I need to locate the grate to the Down Below.",6,"\"Some of the more adventurous souls help keep the city clean of vermin by venturing into the catacombs.  You can find the grate leading down to them if you take a close look.  I'll show you where you can find the entrance to the catacombs.  After that, I'll show you one more place.\" - Ms. Fairlee", 0,809.60, -19.90, 257.14,234)
	AddQuestStepCompleteAction(Quest, 9, "Step9Complete")   
end

function Step9Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 9, "I've found the enterence to the Down Below.")
	UpdateQuestTaskGroupDescription(Quest, 9, "I've visisted three of four locations Ms. Fairlee has told me about.")
	AddQuestStepZoneLoc(Quest, 10, "I need to locate the gates to South Qeynos.",6, "\"Even though only citizens can travel into the city proper, it would be rude not to at least show where the gates to Qeynos are.  I'll lead you over to where you can find the gates into the city.  I should be done with fixing up the place by the time you get back.\" - Ms. Fairlee", 11,704.68, -20.38, 264.64,234)
	AddQuestStepCompleteAction(Quest, 10, "Step10Complete")   
end

function Step10Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 10, "I've visited the inner city gates but was not allowed access.")
	UpdateQuestTaskGroupDescription(Quest, 10, "I've visisted all four locations Ms. Fairlee has told me about.")
	AddQuestStepChat(Quest, 11, "I need to return to my room and ask Ms. Fairlee why I can't enter the city.", 1, 100, "I should return back to my room and ask Ms. Fairlee why the guard didn't allow me to enter into the city.  Hopefully she might know why.",11,2230785)
	AddQuestStepCompleteAction(Quest, 11, "Step11Complete")   
end

function Step11Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 11, "I've spoken with Ms. Fairlee and have been given another piece of furniture, this time a chandelier.")
	UpdateQuestTaskGroupDescription(Quest, 11, "I've spoken with Ms. Fairlee and have been given another piece of furniture, this time a chandelier.")
	AddQuestStep(Quest, 12, "Open your inventory.  \"Place\" your new chandelier and then speak with the caretaker.", 1, 100,"As if two pieces of furniture weren't enough, I now have a chandelier some neighbors brought by.  I should place this on my ceiling for better lighting and then ask Ms. Fairlee why the guard said only \"citizens\" were allowed into the city.",11)
	AddQuestStepCompleteAction(Quest, 12, "Step12Complete")   
end

function Step12Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 12, "I've placed the chandelier on the ceiling and spoke with Ms. Fairlee.")
	UpdateQuestTaskGroupDescription(Quest, 12, "I've placed the chandelier on the ceiling and spoke with Ms. Fairlee.")
	AddQuestStep(Quest, 13, "Take an application from the citizenship sign, complete the task, then speak with Marshal Glorfel by using the citizenship sign again.", 1, 100,"\"If you want to deal with all the hub-bub of city life, then you'll want to go to the citizenship sign at the city gates.  Pull an application from the wall and fulfill the application task, afterwards return to the sign and use it to speak with Marshal Glorfel about becoming a citizen.  If you ask me, I don't know what's wrong with settling down here.  It's a nice sleepy village, not troubled with excitement and danger and all that.  But then again, you kids like that kind of thing.  Well, good luck to you!\" - Ms. Fairlee",11)
	AddQuestStepCompleteAction(Quest, 13, "Step13Complete")   
end

function Step13Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 13, "I've spoken with Marshal Glorfel and have been told how to become a citizen.")
	UpdateQuestTaskGroupDescription(Quest, 13, "I've spoken with Marshal Glorfel and have been told how to become a citizen.")
	AddQuestStepChat(Quest, 14, "Judge the traitors individually and prove your loyalty to Qeynos.", 1, 100,"Marshal Glorfel has tasked me with rendering judgment upon some treasonous residents in order to gain citizenship.  He has pointed out that there are those who would betray our great city to that wretch Lucan.  To prove myself, I will have to render final judgment on all of them.",11,22101350)
	AddQuestStepCompleteAction(Quest, 14, "QuestComplete")   
end


function QuestComplete(Quest, QuestGiver, Player)
	-- The following UpdateQuestStepDescription and UpdateTaskGroupDescription are not needed, parser adds them for completion in case stuff needs to be moved around
	UpdateQuestStepDescription(Quest, 14, "I have completed the Citizenship Trial and am now a citizen of Qeynos.")
	UpdateQuestTaskGroupDescription(Quest, 14, "I am now a citizen of Qeynos!")

	UpdateQuestDescription(Quest, "Thanks to the help of the inn's caretaker, I've been able to familiarize myself with the Baubbleshire.  Not only did she show me the way around, she also let me know who to speak to in order to become a citizen.")
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
		QuestComplete(Quest, QuestGiver, Player)
		end
end