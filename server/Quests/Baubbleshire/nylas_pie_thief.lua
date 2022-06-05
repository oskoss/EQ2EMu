--[[
    Script Name    : Quests/Baubbleshire/nylas_pie_thief.lua
    Script Author  : Dorbin
    Script Date    : 2022.01.11 01:01:26
    Script Purpose : 
    Notes: Reconstructed Removed Quest from Live - Using Voice Overs and Prima Guide as resources.

        Zone       : Baubbleshire
        Quest Giver: Nyla Diggs
        Preceded by: None
        Followed by: 
--]]

function Init(Quest)
	AddQuestStepLocation(Quest, 1, "I must check 'The Ringing Hammer' smithy.", 5, "I need to check the smithy for someone who may have taken the pie.", 2558, 850.34, -18.22, -514.64, 238)
	AddQuestStepCompleteAction(Quest, 1, "step1beentothesmithy")
end

function Accepted(Quest, QuestGiver, Player)
    FaceTarget(QuestGiver, Player)
 conversation = CreateConversation()
 AddConversationOption(conversation, "I'll be back once I look around!")
 StartConversation(conversation, QuestGiver, Player, "You'd do that? Tell you what, you search for the missing pie and when you return I'll have a fresh baked pie waiting for you. I'll give the culprit such a scolding they'll think twice before taking one of my pies.")
end

function Declined(Quest, QuestGiver, Player)
end

function Deleted(Quest, QuestGiver, Player)
end

function step1beentothesmithy(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I checked 'The Ringing Hammer'")
	UpdateQuestTaskGroupDescription(Quest, 1, "I checked the smithy, but found no one who took the pie")

	AddQuestStepLocation(Quest, 2, "I need to check 'The Qeynos Exchange'.", 5, "I need to check the bank for someone who may have taken the pie", 2558, 895.18, -18.01, -480.29, 238)
	AddQuestStepCompleteAction(Quest, 2, "step2beentobank")
end

function step2beentobank(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I checked 'The Qeynos Exchange'")
	UpdateQuestTaskGroupDescription(Quest, 2, "I checked the bank, but found no one who took the pie")

    AddQuestStepLocation(Quest, 3, "I need to investigate 'The Deepmug Tavern'.", 5, "I need to check the tavern for someone who may have taken the pie", 2558, 880.47, -18.31, -443.50, 238)
	AddQuestStepCompleteAction(Quest, 3, "step3deepmug")
end

function step3deepmug(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 3, "I smell the pie in 'The Deepmug Tavern'")
	UpdateQuestTaskGroupDescription(Quest, 3, "I smell the pie coming from someone in The Deepmug Tavern")

	AddQuestStepChat(Quest, 4, "I need to ask the The Deepmug Tavern patrons about the pie.", 1, "Someone in the tavern must know about the pie.", 0, 2380030)
	AddQuestStepCompleteAction(Quest, 4, "step4Thief")
end

function step4Thief(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 4, "Lozoria Shinkicker took the pie!")
	UpdateQuestTaskGroupDescription(Quest, 4, "Sadly, Lozoria Shinkicker couldn't resist eating the pie.")

	AddQuestStepChat(Quest, 5, "I should tell Nyla about her pie.", 1, "Nyla needs to know Lozoria Shinkicker took her pie.", 0, 2380023)
	AddQuestStepCompleteAction(Quest, 5, "QuestComplete")
end

function QuestComplete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 5, "I've told Nyla about her lost pie.")
	UpdateQuestTaskGroupDescription(Quest, 5, "I've uncovered Nyla's pie thief and told Nyla who did it.")

	UpdateQuestDescription(Quest, "I told Nyla about her lost pie. I guess the thief was Lozoria over in the Deepmug tavern. Couldn't resist he said! Oh well, it seems like everything's all right though. ")
	GiveQuestReward(Quest, Player)
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		step1beentothesmithy(Quest, QuestGiver, Player)
	elseif Step == 2 then
		step2beentobank(Quest, QuestGiver, Player)
			elseif Step == 3 then
		step3deepmug(Quest, QuestGiver, Player)
					elseif Step == 4 then
		step4Thief(Quest, QuestGiver, Player)
					elseif Step == 5 then
		ThiefFound(Quest, QuestGiver, Player)
	--						elseif Step == 6 then
	--	QuestComplete(Quest, QuestGiver, Player)
    end

end
