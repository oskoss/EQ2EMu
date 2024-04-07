--[[
	Script Name		: SpawnScripts/LongshadowAlley/ResearcherVTun.lua
	Script Purpose	: Researcher V'Tun
	Script Author	: torsten
	Script Date		: 2022.07.20
	Script Notes	: Auto-Generated Conversation from PacketParser Data
--]]

require "SpawnScripts/Generic/DialogModule"

function spawn(NPC)
SetPlayerProximityFunction(NPC, 7, "InRange", "LeaveRange")
    SetInfoStructString(NPC, "action_state", "tapfoot")
end

function respawn(NPC)
	spawn(NPC)
end

function InRange(NPC, Spawn)
	 if MakeRandomInt(1, 100) <= 18 and GetFactionAmount(Spawn,12) >0 then
	    FaceTarget(NPC, Spawn)
        PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_1/ft/service/merchant/darkelf_merchant_service_evil_1_aoi_gf_53388b91.mp3", "Only traitors to the Overlord would pass up a bargain like this. You're not a traitor are you?", "scold", 2250198640, 1947969981, Spawn)
 elseif  GetFactionAmount(Spawn,12) <=0 then
        PlayFlavor(NPC, "voiceover/english/highelf_eco_good_1/ft/highelf/highelf_eco_good_1_notcitizen_gf_6da83eeb.mp3", "I'll defend myself if it comes to that, savage.", "", 3357669916, 1930978996, Spawn)
    end
end   

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
    if GetFactionAmount(Spawn,12) >0 then
    Dialog1(NPC, Spawn)
	else
    PlayFlavor(NPC, "voiceover/english/highelf_eco_good_1/ft/highelf/highelf_eco_good_1_notcitizen_gf_6da83eeb.mp3", "I'll defend myself if it comes to that, savage.", "", 3357669916, 1930978996, Spawn)
    end	    
end

function     Dialog1(NPC, Spawn)
	local choice = MakeRandomInt(1,3)
	if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_1/ft/service/merchant/darkelf_merchant_service_evil_1_hail_gf_d088c20d.mp3", "The stuff's over there.  Just let me know if you find anything you like.", "ponder", 1457896156, 727813168, Spawn, 0)
	elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_1/ft/service/merchant/darkelf_merchant_service_evil_1_hail_gf_f715099e.mp3", "Hello there, kind adventurer.  My merchandise carries the seal of the Overlord himself!  Go ahead, take a look!", "salute_freeport", 3860282907, 2830883681, Spawn, 0)
	elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_1/ft/service/merchant/darkelf_merchant_service_evil_1_hail_gf_aff3fc07.mp3", "Are you going to buy anything today or am I just wasting my time?  This isn't a museum display you know!", "glare", 1486780566, 1792397389, Spawn, 0)
	end
end
