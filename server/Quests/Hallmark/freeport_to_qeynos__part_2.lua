--[[
    Script Name    : Quests/Hallmark/freeport_to_qeynos__part_2.lua
    Script Author  : Dorbin
    Script Date    : 2023.09.25 07:09:16
    Script Purpose : 

        Zone       : Hallmark
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]
require "SpawnScripts/Generic/DialogModule"


function Init(Quest)
	AddQuestStep(Quest, 1, "I need to reach the official before it's too late.", 1, 100, "I need to find the official in the mansion and put a stop to him.  I only hope I can reach him in time.", 11)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
end

function Accepted(Quest, QuestGiver, Player)
    FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)   
 	Dialog.AddDialog("You made the right choice and just in time!  We learned the location of a secret meeting involving a very important Freeport official. As we speak, he's planning to invade Qeynos.")
	Dialog.AddVoiceover("voiceover/english/watcher_kenjedeau/fprt_sewer02/watcher_kenjedeau006.mp3", 1366986633, 1336111674)
    PlayFlavor(QuestGiver, "", "", "agree", 0, 0, Player)
    Dialog.AddOption("What must I do?","Retry")	
	Dialog.Start()
	if HasQuest(Player,5889) and GetQuestStep(Player,5889) ==1 then
	    SetStepComplete(Player,5889,1)
	end
end

function Declined(Quest, QuestGiver, Player)
    FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)   
 	Dialog.AddDialog("I thought I smelled a coward. I want nothing to do with you until you come to your senses.")
	Dialog.AddVoiceover("voiceover/english/watcher_kenjedeau/fprt_sewer02/watcher_kenjedeau005.mp3", 1178065540, 4141402431)
    PlayFlavor(QuestGiver, "", "", "glare", 0, 0, Player)
    Dialog.AddOption("Fine.")	
	Dialog.Start()
	if HasQuest(Player,5889) and GetQuestStep(Player,5889) ==1 then
	    SetStepFailed(Player,5889,1)
	end
end

function Deleted(Quest, QuestGiver, Player)
end

function Step1Complete(Quest)
	UpdateQuestStepDescription(Quest, 1, "I fought my way to the room where the official awaited me.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I've reached the official, only to find out he was waiting for me... along with my fellow 'conspirators'.")
	AddQuestStepZoneLoc(Quest, 2, "I need to await judgement.", 15, "I've been tricked, but I'm still intent on leaving Freeport. I must await judgement.", 11-1341.61, -69.51, 333.4,33)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I have been judged as a traitor to Freeport.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I have been banished from Freeport, but I am still alive for some reason.")

	UpdateQuestDescription(Quest, "I am the victim of a cruel and elaborate hoax intended to coerce people into betraying Freeport, all for the amusement of the Overlord himself.  In the end, I still believed in what I said and accepted my fate.  For some reason... I'm still alive. <br> <br>")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		Step1Complete(Quest, QuestGiver, Player)
	elseif Step == 1 then
		QuestComplete(Quest, QuestGiver, Player)
	end
end
