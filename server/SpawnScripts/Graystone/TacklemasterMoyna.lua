--[[
	Script Name	: SpawnScripts/Graystone/TacklemasterMoyna.lua
	Script Purpose	: Tacklemaster Moyna
	Script Author	: Scatman
	Script Date	: 2008.09.19
	Script Notes	: 
--]]

local QUEST_1 = 293

function spawn(NPC)
	ProvidesQuest(NPC, QUEST_1)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	conversation = CreateConversation()
	RandomVoice(NPC, Spawn)

	if HasQuest(Spawn, QUEST_1) and GetQuestStep(Spawn, QUEST_1) == 2 then
		AddConversationOption(conversation, "I've returned with the bait you requested.", "ReturnedWithBait")
	elseif not HasQuest(Spawn, QUEST_1) and not HasCompletedQuest(Spawn, QUEST_1) then
		AddConversationOption(conversation, "I'm interested in finding a little work around here.", "FindingWork")
	end

	PlayFlavor(NPC, "voiceover/english/tacklemaster_moyna/qey_village03/tacklemastermoyna.mp3", "", "", 2910658366, 1466320622, Spawn)
	AddConversationOption(conversation, "No thanks, not today.")
	StartConversation(conversation, NPC, Spawn, "Welcome to Graystone! With our Kerran population, the fish supply is never enough. If you're looking to fill that supply, you'll need some of my goods. Care to have a look?")
end

function respawn(NPC)
	spawn(NPC)
end

function RandomVoice(NPC, Spawn)
	local choice = math.random(1, 3)
	if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/voice_emotes/greetings/greetings_1_1001.mp3", "", "", 0, 0, Spawn)
	elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/voice_emotes/greetings/greetings_2_1001.mp3", "", "", 0, 0, Spawn)
	else
		PlayFlavor(NPC, "voiceover/english/voice_emotes/greetings/greetings_3_1001.mp3", "", "", 0, 0, Spawn)
	end
end

-----------------------------------------------------------------------------------------------------
--						QUEST 1
-----------------------------------------------------------------------------------------------------

function FindingWork(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	conversation = CreateConversation()

	PlayFlavor(NPC, "voiceover/english/tacklemaster_moyna/qey_village03/tacklemastermoyna001.mp3", "", "", 530187050, 1736772086, Spawn)
	AddConversationOption(conversation, "Provided the job actually pays, I'll do it.", "ProvidedItPays")
	AddConversationOption(conversation, "No thanks, sounds icky.")
	StartConversation(conversation, NPC, Spawn, "You're in luck. I need more bait. If you're interested, you could fetch me some centipede meat. Ubani and Brice catch all the fish from the pier, and I always need more bait.")
end

function ProvidedItPays(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	conversation = CreateConversation()

	PlayFlavor(NPC, "voiceover/english/tacklemaster_moyna/qey_village03/tacklemastermoyna002.mp3", "", "", 3085757696, 757857128, Spawn)
	AddConversationOption(conversation, "I'll be back when I've got what you need.", "OfferQuest1")
	StartConversation(conversation, NPC, Spawn, "It'll pay but not too well. The bait business is decent next to the pier, but the stuff isn't exactly worth its weight in platinum, if you know what I mean. I need you to gather some centipede meat for me from the Forest Ruins.")
end

function OfferQuest1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	OfferQuest(NPC, Spawn, QUEST_1)
end

function ReturnedWithBait(NPC, Spawn)
	SetStepComplete(Spawn, QUEST_1, 2)
	
	FaceTarget(NPC, Spawn)
	conversation = CreateConversation()

	AddConversationOption(conversation, "Thank you Moyna!")
	StartConversation(conversation, NPC, Spawn, "Thank you! With this supply, I can keep my bait buckets filled for at least another day or two. Well done. Here's your reward as promised.")
end