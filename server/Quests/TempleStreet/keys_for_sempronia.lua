--[[
    Script Name    : Quests/TempleStreet/keys_for_sempronia.lua
    Script Author  : Dorbin
    Script Date    : 2023.11.06 02:11:46
    Script Purpose : 

        Zone       : TempleStreet
        Quest Giver: 
        Preceded by: None
        Followed by: 
--]]
require "SpawnScripts/Generic/DialogModule"

function Init(Quest)
	AddQuestStepKill(Quest, 1, "I need to kill diseased ratonga until I find the one with the keys.", 1, 30, "I don't know which of the diseased ratonga took the keys, so I'll just have to kill them until I find the guy.", 11, 8430009,8430010,8430011)
	AddQuestStepCompleteAction(Quest, 1, "Step1Complete")
    UpdateQuestZone(Quest,"Thieves Way")
end

function Step1Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I've found the keys.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I've found the old vault keys on the body of a diseased ratonga.")
    UpdateQuestZone(Quest,"Temple Street")
	AddQuestStepChat(Quest, 2, "I need to talk with Sempronia the banker.", 1, "I should bring these keys back to Sempronia in the Temple Street district.", 1007, 1360020)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
end


function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	Dialog.New(QuestGiver, Player)
	Dialog.AddDialog("Perhaps there is. On the way to the bank this morning, I overheard a few ratonga talking about how one of their brethren had come down with a wasting disease.  They went on to say that he was the one that stole the spare vault keys and plans on ransoming them back to the Freeport Reserve in exchange for a cure.  I'd prefer the Reserve doesn't lose a single copper more over all of this.  If you'd be so kind as to try to find this diseased ratonga in the sewers and bring back the keys, I'd be willing to pay you from my own money.")
	Dialog.AddVoiceover("voiceover/english/banker_sempronia_gallus/fprt_hood03/quests/semproniagallus/sempronia_x1_accept.mp3", 494673703, 1541325887)
    PlayFlavor(QuestGiver,"","","agree",0,0,Player)
    Dialog.AddOption("Sounds reasonable, especially the part where I get paid.")
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
	UpdateQuestStepDescription(Quest, 2, "I've spoken with Sempronia.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I've returned the old vault keys to Sempronia the banker in the Temple Street district.")

	UpdateQuestDescription(Quest, "I've returned the old vault keys to Sempronia the banker in the Temple Street district.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		Step1Complete(Quest, QuestGiver, Player)
	elseif Step == 2 then
		QuestComplete(Quest, QuestGiver, Player)
		end
end