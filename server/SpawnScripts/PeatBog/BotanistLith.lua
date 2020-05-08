--[[
	Script Name	: SpawnScripts/PeatBog/BotanistLith.lua
	Script Purpose	: Botanist Lith 
	Script Author	: scatman
	Script Date	: 2009.05.10
	Script Notes	: Auto-Generated Conversation from PacketParser Data
	
	Updated 5/5/20. Much information couldn't be verified through online and in game sources, so some creativity was
	involved with some of the dialogue. It should fulfill the general purpose. Change as you feel is required.
	Mahalo, Darksinga.
	
--]]

local KERRA = 11
local QUEST_1 = 518

function spawn(NPC)
	ProvidesQuest(NPC, QUEST_1)
	end


function respawn(NPC)
	spawn(NPC)
end


function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	conversation = CreateConversation()
	
	if HasCompletedQuest(Spawn, QUEST_1) then
	Quest1Completed(NPC, Spawn, conversation)
	elseif HasQuest(Spawn, QUEST_1) then
	OnQuest1(NPC, Spawn, conversation)
	else
		if GetRace(Spawn) == KERRA then
		else
			PlayFlavor(NPC, "voiceover/english/tutorial_revamp/botanist_lith/qey_adv04_bog/quests/nareh/nareh_lakosha000.mp3", "", "", 1585352530, 1011819212, Spawn)
			AddConversationOption(conversation, "Lakosha Maera sent me.", "dlg_0_1")
			StartConversation(conversation, NPC, Spawn, "The plant life here is absolutely astounding.")
		end
	end

		
end

	
	

		
function dlg_0_1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	conversation = CreateConversation()

	PlayFlavor(NPC, "voiceover/english/tutorial_revamp/botanist_lith/qey_adv04_bog/quests/nareh/nareh_lakosha001.mp3", "", "", 2621096962, 3551613449, Spawn)
	AddConversationOption(conversation, "Unfortunate news. Someone in Nettleville attempted to perform a Pa'Rok ceremony with tainted dirt.", "dlg_0_2")
	StartConversation(conversation, NPC, Spawn, "Ah, wonderful. I have not spoken to her in quite some time. What news does she send?")
end

function dlg_0_2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	conversation = CreateConversation()

	PlayFlavor(NPC, "voiceover/english/tutorial_revamp/botanist_lith/qey_adv04_bog/quests/nareh/nareh_lakosha002.mp3", "", "", 619900214, 1453098884, Spawn)
	AddConversationOption(conversation, "No, but the ceremony was for naught. Lakosha asked me to visit you because the dirt that corrupted the ceremony came from Peat Bog.", "dlg_0_3")
	StartConversation(conversation, NPC, Spawn, "I'm not familiar with that ceremony, was anybody hurt?")
end

function dlg_0_3(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	conversation = CreateConversation()

	PlayFlavor(NPC, "voiceover/english/tutorial_revamp/botanist_lith/qey_adv04_bog/quests/nareh/nareh_lakosha003.mp3", "", "", 418560600, 341427965, Spawn)
	AddConversationOption(conversation, "How so?", "dlg_0_4")
	StartConversation(conversation, NPC, Spawn, "Oh, I see. I guess that agrees with my findings, unfortunately.")
end

function dlg_0_4(NPC, Spawn) 
	FaceTarget(NPC, Spawn)
	conversation = CreateConversation()

	AddConversationOption(conversation, "Yes, of course.", "dlg_0_5")
	StartConversation(conversation, NPC, Spawn, "The very ground that the bogs crawl across is becoming contaminated. I need some of their bodies, and the mud they crawl over, to be sure. Can you help?")
end

function dlg_0_5(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	conversation = CreateConversation()
	AddConversationOption(conversation, "Easy enough! I will be back shortly.", "OfferQuest1")
	StartConversation(conversation, NPC, Spawn, "Fantastic! I need the stomach contents of bog slugs and sludges. I also need a few mud samples. Once I can examine all the evidence, we will know how to move forward.")
	
	
end

function OfferQuest1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	OfferQuest(NPC, Spawn, QUEST_1)
end

function Quest1Completed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Say(NPC, "Go speak to Lieutenant Dawson near the Nettleville gate.", Spawn)
end


function OnQuest1(NPC, Spawn, conversation)
	

	if (HasQuest(Spawn, QUEST_1) and GetQuestStep(Spawn, QUEST_1) == 4) then
		AddConversationOption(conversation, "Yes, I have collected the components you requested.", "dlg_1_1")
	elseif (HasQuest(Spawn, QUEST_1) and GetQuestStep(Spawn, QUEST_1) == 5) then
		AddConversationOption(conversation, "No. I need to speak with Dawson.", Spawn)
	else
		AddConversationOption(conversation, "No, not yet.")
	end
	
	StartConversation(conversation, NPC, Spawn, "Yes? Do you have an update?")
end
	


	function dlg_1_1 (NPC, Spawn, conversation)
	SetStepComplete(Spawn, QUEST_1, 4)
	FaceTarget(NPC, Spawn)
	conversation = CreateConversation()
	AddConversationOption(conversation, "I will go right away.", Spawn)
	StartConversation(conversation, NPC, Spawn, "It is as I expected... This evidence suggests foreign substances are being introduced into the Peat Bog. I'm concerned that these substances have originated in the Caves. Speak with Lieutenant Dawson immediately. I must get back to my work.")
	end
	
	
	

--[[ raw_conversations
	PlayFlavor(NPC, "voiceover/english/tutorial_revamp/botanist_lith/qey_adv04_bog/quests/nareh/nareh000.mp3", "The plant life here is absolutely astounding.", "", 1130721210, 2119698425, Spawn)
--]]

