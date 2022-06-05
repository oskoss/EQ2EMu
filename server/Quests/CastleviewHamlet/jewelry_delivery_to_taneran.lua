--[[
    Script Name    : Quests/CastleviewHamlet/jewelry_delivery_to_taneran.lua
    Script Author  : Dorbin
    Script Date    : 2022.01.26 07:01:39
    Script Purpose : 

        Zone       : CastleviewHamlet
        Quest Giver: Taneranthalis Nedaiveren
        Preceded by: None
        Followed by: 
--]]

function Init(Quest)
    AddQuestStepChat(Quest, 1, " I need to deliver this note to Tara Ironforge.", 1, " I must deliver a note to Tara Ironforge in the Jewel Box located in North Qeynos.", 75, 2220057)
    AddQuestStepCompleteAction(Quest, 1, "Delivery")
    	UpdateQuestZone(Quest, "North Qeynos")
end

function Accepted(Quest, QuestGiver, Player)
  conversation = CreateConversation()
      PlayFlavor(QuestGiver,"","","thank",0,0,Player)
  AddConversationOption(conversation, "I'll be back soon.")
  StartConversation(conversation, QuestGiver, Player, "I have waited this long. I can wait a little longer.")
end   



function Declined(Quest, QuestGiver, Player)
end

function Delivery(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "	I've delivered the note to Tara Ironforge.")
	UpdateQuestTaskGroupDescription(Quest, 1, "I've delivered the note to Tara Ironforge in the Jewel Box.")

	AddQuestStepChat(Quest, 2, "I need to return to Taneran.", 1, "I need to deliver this jewlery to Taneran in Castleview.", 927, 2360012)
	AddQuestStepCompleteAction(Quest, 2, "QuestComplete")
	UpdateQuestZone(Quest, "Castleview Hamlet")
end

function QuestComplete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I've returned to Taneran.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I've given Taneran the jewlery from Tara Ironforge as requested.")

	UpdateQuestDescription(Quest, "I'm sure Taneranthalis and Listalania will make a good couple when and if he decides the time is right. Perhaps one day their children will be able to visit his home city of Felwithe... indeed, maybe I will be able to see its white towers as well.")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		Delivery(Quest, QuestGiver, Player)
	elseif Step == 2 then
		QuestComplete(Quest, QuestGiver, Player)
    end
end
