--[[
	Script Name	: Quests/Graystone/a_family_recipe.lua
	Script Purpose	: Handles the quest, "A Family Recipe"
	Script Author	: Scatman
	Script Date	: 2009.10.05
	
	Zone       : Graystone Yard
	Quest Giver: Mav Boilfist
	Preceded by: None
	Followed by: Cheers! (cheers.lua)
--]]

local AFamilyRecipe = 283

function Init(Quest)
	AddQuestStep(Quest, 1, "I need to acquire some Frozen Cherries. 4QGCG is the shipping number.", 1, 100, "I must collect the needed ingredients for Mav Boilfist. I will need to refer to the overflow shipping manifest she gave me to determine where the items are located.", 770) 
	AddQuestStep(Quest, 2, "I need to acquire some yeast. 2DF0F is the shipping number.", 1, 100, "I must collect the needed ingredients for Mav Boilfist. I will need to refer to the overflow shipping manifest she gave me to determine where the items are located.", 342) 
	AddQuestStep(Quest, 3, "I need to acquire some honey. QGC4F is the shipping number.", 1, 100, "I must collect the needed ingredients for Mav Boilfist. I will need to refer to the overflow shipping manifest she gave me to determine where the items are located.", 357) 
	AddQuestStepCompleteAction(Quest, 1, "Step1_Complete_FoundCherries")
	AddQuestStepCompleteAction(Quest, 2, "Step2_Complete_FoundYeast")
	AddQuestStepCompleteAction(Quest, 3, "Step3_Complete_FoundHoney")
end

function Accepted(Quest, QuestGiver, Player)
	FaceTarget(QuestGiver, Player)
	conversation = CreateConversation()
	
	-- Overflow Manifest
	if not HasItem(Player, 10268, 1) then
		SummonItem(Player, 10268, 1)
	end
	
	PlayFlavor(QuestGiver, "voiceover/english/tutorial_revamp/mav_boilfist/qey_village03/quests/mav_boilfist/mav_boilfist010.mp3", "", "", 2473952435, 2751712477, Player)
	AddConversationOption(conversation, "I'll go look for them.")
	StartConversation(conversation, QuestGiver, Player, "It shouldn't be too hard. The orders you're looking for are #4QGCG, #2DF0F, and #QGC4F.")
end

function Declined(Quest, QuestGiver, Player)
end

function Step1_Complete_FoundCherries(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 1, "I have acquired Frozen Cherries.")
	
	if QuestIsComplete(Player, AFamilyRecipe) then
		FoundAllItems(Quest, QuestGiver, Player)
	end
end

function Step2_Complete_FoundYeast(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 2, "I have acquired some yeast.")
	
	if QuestIsComplete(Player, AFamilyRecipe) then
		FoundAllItems(Quest, QuestGiver, Player)
	end
end

function Step3_Complete_FoundHoney(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 3, "I have acquired some honey.")
	
	if QuestIsComplete(Player, AFamilyRecipe) then
		FoundAllItems(Quest, QuestGiver, Player)
	end
end

function FoundAllItems(Quest, QuestGiver, Player)
	UpdateQuestTaskGroupDescription(Quest, 1, "I have collected all of the needed ingredients.")
	
	AddQuestStepChat(Quest, 4, "I need to bring all of these components to Mav Boilfist near the docks.", 1, "I need to bring these ingredients to Mav Boilfist in Graystone Yard.", 0, 2350016) 
	AddQuestStepCompleteAction(Quest, 4, "Quest_Complete")
end

function Quest_Complete(Quest, QuestGiver, Player)
	UpdateQuestStepDescription(Quest, 4, "I have given Mav all of the components she requested.")
	UpdateQuestTaskGroupDescription(Quest, 2, "I have given Mav the ingredients she asked for.")
	
	-- Overflow Manifest
	while HasItem(Player, 10268) do
		RemoveItem(Player, 10268)
	end
	
	GiveQuestReward(Quest, Player)
	UpdateQuestDescription(Quest, "I have collected the ingredients for Mav and returned them to her.")
end

function Reload(Quest, QuestGiver, Player, Step)
	if Step == 1 then
		Step1_Complete_FoundCherries(Quest, QuestGiver, Player)
	elseif Step == 2 then
		Step2_Complete_FoundYeast(Quest, QuestGiver, Player)
	elseif Step == 3 then
		Step3_Complete_FoundHoney(Quest, QuestGiver, Player)
	end
end