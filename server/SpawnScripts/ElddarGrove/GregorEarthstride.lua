--[[
	Script Name	: SpawnScripts/ElddarGrove/GregorEarthstride.lua
	Script Purpose	: Gregor Earthstride 
	Script Author	: Dorbin
	Script Date	: 2022.5.4
	Script Notes	: 
--]]

local Hawks = 5517

function spawn(NPC)
    ProvidesQuest(NPC, Hawks)
    AddTimer(NPC, 5000, "EmoteLoop")    
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
 if GetFactionAmount(Spawn,11) <0 then
    PlayFlavor(NPC, "", "", "shakefist", 0, 0, Spawn)
    else
	FaceTarget(NPC, Spawn)
	conversation = CreateConversation()
	PlayFlavor(NPC, "voiceover/english/voice_emotes/greetings/greetings_2_1004.mp3", "", "confused", 0, 0, Spawn)
    if not HasQuest(Spawn,Hawks) and not HasCompletedQuest (Spawn,Hawks) then
	AddConversationOption(conversation, "Why would you need to buy arrows?  You seem to look capable of making your own.","Feathers1")
	end
	if GetQuestStep(Spawn,Hawks)==2 then
	AddConversationOption(conversation, "I've returned with the feathers you needed, though they're still on the birds.","FeathersDone1")
	end
	AddConversationOption(conversation, "I wish you luck with finding them.")
	StartConversation(conversation, NPC, Spawn, "I can't ever seem to find the arrows I need! Nightbow's shop here is good, but it's a bit pricey.")
	
    end
end

function Feathers1(NPC, Spawn)
 	FaceTarget(NPC, Spawn)
	conversation = CreateConversation()
	AddConversationOption(conversation, "I think I could get the feathers you need.","Feathersoffer")
	AddConversationOption(conversation, "I wish you luck with finding them.")
	StartConversation(conversation, NPC, Spawn, "I hate to admit it, but I've not been having the best of luck with the feathers.  It seems there's been some furious competition for the hawks in the forest ruins, as their feathers are not only very useful for fletching, but also for use as quills.")
end   


function Feathersoffer(NPC, Spawn)
OfferQuest(NPC,Spawn, Hawks)
FaceTarget(NPC, Spawn)
end

function FeathersDone1(NPC, Spawn)
    SetStepComplete(Spawn,Hawks,2)
 	FaceTarget(NPC, Spawn)
	conversation = CreateConversation()
	PlayFlavor(NPC, "", "", "thanks", 0, 0, Spawn)
	AddConversationOption(conversation, "Thank you, and safe journeys to you.")
	StartConversation(conversation, NPC, Spawn, "That's wonderful!  I'll be happy to pull the feathers off myself, that's not a problem!  You've saved me quite a bit of coin!  Speaking of coin, here's some for your effort.")
end   


function EmoteLoop(NPC)
    local emoteChoice = MakeRandomInt(1,3)

    if emoteChoice == 1 then
-- ponder
	    PlayFlavor(NPC, "", "", "ponder", 0, 0, Spawn)
        AddTimer(NPC, MakeRandomInt(15000,18000), "EmoteLoop")	
    elseif emoteChoice == 2 then
-- sniff
	    PlayFlavor(NPC, "", "", "sniff", 0, 0, Spawn)
        AddTimer(NPC, MakeRandomInt(6000,9000), "EmoteLoop")	
    else
-- tapfoot
    	PlayFlavor(NPC, "", "", "tapfoot", 0, 0, Spawn)
        AddTimer(NPC, MakeRandomInt(15000,18000), "EmoteLoop")	
    end
end