--[[
	Script Name	: SpawnScripts/Longshadow/LDor.lua
	Script Purpose	: L`Dor <Armorsmith>
	Script Author	: John Adams
	Script Date	: 2009.04.11
	Script Notes	: Auto-Generated Conversation from PacketParser Data
--]]

require "SpawnScripts/Generic/DialogModule"

function spawn(NPC)
SetPlayerProximityFunction(NPC, 9, "InRange", "LeaveRange")
end

function respawn(NPC)
	spawn(NPC)
end

function InRange(NPC, Spawn)
	 if MakeRandomInt(1, 100) <= 33 and GetFactionAmount(Spawn,12) >0 then
	    FaceTarget(NPC, Spawn)
        PlayFlavor(NPC, "voiceover/english/optional2/darkelf_eco_evil_1/ft/service/merchant/darkelf_merchant_service_evil_1_aoi_gm_53388b91.mp3", "Only traitors to the Overlord would pass up a bargain like this. You're not a traitor are you?", "beckon", 1403936443, 3068231605, Spawn)
 elseif  GetFactionAmount(Spawn,12) <=0 then
	 FaceTarget(NPC, Spawn)
     PlayFlavor(NPC, "", "", "shakefist", 4267987983, 4115199119, Spawn, 0)
    end
end   

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
	 if GetFactionAmount(Spawn,12) >0 then
     Dialog1(NPC, Spawn)
 elseif  GetFactionAmount(Spawn,12) <=0 then
	    FaceTarget(NPC, Spawn)
	    PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_1/ft/service/innkeeper/darkelf_innkeeper_service_evil_1_notcitizen_gm_85c35337.mp3", "We don't serve your pathetic kind here.  Get out of my sight!", "heckno", 4267987983, 4115199119, Spawn, 0)
    end	    
end

function     Dialog1(NPC, Spawn)
    FaceTarget(NPC,Spawn)
	local choice = MakeRandomInt(1,3)
	if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional2/darkelf_eco_evil_1/ft/service/merchant/darkelf_merchant_service_evil_1_hail_gm_f715099e.mp3", "Hello there, kind adventurer.  My merchandise carries the seal of the Overlord himself!  Go ahead, take a look!", "salute_freeport", 1302153135, 3653961458, Spawn)
	elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/optional2/darkelf_eco_evil_1/ft/service/merchant/darkelf_merchant_service_evil_1_hail_gm_6ec08438.mp3", "In spite of the cost of living, it's still quite a popular item.", "ponder", 2781916825, 678640011, Spawn)
	elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/optional2/darkelf_eco_evil_1/ft/service/merchant/darkelf_merchant_service_evil_1_hail_gm_aff3fc07.mp3", "Are you going to buy anything today or am I just wasting my time? This isn't a museum display you know!", "glare", 898812878, 1402234103, Spawn)
	end
end