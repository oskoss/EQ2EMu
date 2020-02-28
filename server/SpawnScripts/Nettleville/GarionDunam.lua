--[[
	Script Name	: SpawnScripts/Nettleville/GarionDunam.lua
	Script Purpose	: Garion Dunam <Alchemist>
	Script Author	: Scatman
	Script Date	: 2009.08.12
	Script Notes	: 
--]]

function spawn(NPC)
	SetPlayerProximityFunction(NPC, 10, "InRange", "LeaveRange")
end

function respawn(NPC)
	spawn(NPC)
end

function InRange(NPC, Spawn)
	local chance = math.random(0, 100)
	if chance <= 25 then
		Talk(NPC, Spawn)
	end
end

function LeaveRange(NPC, Spawn)
end

function hailed(NPC, Spawn)
	Talk(NPC, Spawn)
end

function Talk(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	local choice = math.random(1, 5)
	if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/human_eco_good_1/ft/service/alchemist/human_alchemist_service_good_1_hail_gm_a8ed74c7.mp3", "There are no refunds for caster error at this shop! Oh ... hello you're not here about a refund.", "no", 383508519, 1836231230, Spawn)
	elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/human_eco_good_1/ft/service/alchemist/human_alchemist_service_good_1_hail_gm_59de96bd.mp3", "What happened to the highly explosive bottle that was on my desk?  Have you seen it?", "peer", 1482977865, 753937939, Spawn)
	elseif choice == 3 then
		PlayFlavor(NPC, "", "Garion is my name, potions my game.  What can I get for you?", "", 1689589577, 4560189, Spawn)
	elseif choice == 4 then
		PlayFlavor(NPC, "voiceover/english/human_eco_good_1/ft/service/alchemist/human_alchemist_service_good_1_hail_gm_ec533e4c.mp3", "Are you wounded?  I just made up a fresh batch of healing potions an hour ago.", "hello", 3929603973, 2846331407, Spawn)
	elseif choice == 5 then
		PlayFlavor(NPC, "voiceover/english/human_eco_good_1/ft/service/alchemist/human_alchemist_service_good_1_hail_gm_efd903ba.mp3", "Hello, adventurer! Are you looking for a specific potion or ingredient?", "agree", 3478121196, 1626504328, Spawn)
	end
end