--[[
	Script Name		: SpawnScripts/BeggarsCourt/SestiusBuccio.lua
	Script Purpose	: Sestius Buccio
	Script Author	: torsten
	Script Date		: 2022.07.18
	Script Notes	: Auto-Generated Conversation from PacketParser Data
--]]

function spawn(NPC)
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC,Spawn)
	RandomGreeting(NPC, Spawn)
end

function RandomGreeting(NPC, Spawn)
	local choice = MakeRandomInt(1,2)

	if choice == 1 then
    PlayFlavor(NPC, "voiceover/english/human_eco_evil_bartender/ft/eco/evil/human_eco_evil_bartender_hail_gm_35e6e167.mp3", "Just so ya know, I'm not in the business to hear your sad stories. Now what will it be?", "nod", 1595668242, 2514401652, Spawn)
    elseif choice == 2 then
    PlayFlavor(NPC, "voiceover/english/human_eco_evil_bartender/ft/eco/evil/human_eco_evil_bartender_hail_gm_201b6d6a.mp3", "What can I get for ya?", "hello", 2895097847, 2686872643, Spawn)    
    end
end