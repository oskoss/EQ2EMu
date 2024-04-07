--[[
    Script Name    : SpawnScripts/TempleSt/ShieldsmithFubbledodge.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.23 04:10:21
    Script Purpose : 
                   : 
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
		PlayFlavor(NPC, "voiceover/english/gnome_eco_evil_1/ft/service/merchant/gnome_merchant_service_evil_1_aoi_gm_53388b91.mp3", "Only traitors to the Overlord would pass up a bargain like this.  You're not a traitor are you?", "scold", 991835348, 673767052, Spawn, 0)
 elseif  GetFactionAmount(Spawn,12) <=0 then
	 FaceTarget(NPC, Spawn)
     PlayFlavor(NPC, "", "", "shakefist", 0, 0, Spawn, 0)
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
        PlayFlavor(NPC, "voiceover/english/barbarian_eco_good_1/ft/service/petretailer/barbarian_petretailer_service_good_1_notcitizen_gm_820dc7e.mp3", "I'm afraid that I'm closed for the day.  I'm going to have to ask you to leave now.", "heckno", 1325380097, 3928490350
, Spawn)
    end	    
end

function     Dialog1(NPC, Spawn)
    FaceTarget(NPC,Spawn)
	local choice = MakeRandomInt(1,3)
	if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/gnome_eco_evil_1/ft/service/merchant/gnome_merchant_service_evil_1_hail_gm_aff3fc07.mp3", "Are you going to buy anything today or am I just wasting my time?  This isn't a museum display you know!", "glare", 1076899557, 563502184, Spawn, 0)
	elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/gnome_eco_evil_1/ft/service/merchant/gnome_merchant_service_evil_1_hail_gm_6ec08438.mp3", "In spite of the cost of living, it's still quite a popular item.", "ponder", 4264249232, 4201092275, Spawn, 0)
	elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/gnome_eco_evil_1/ft/service/merchant/gnome_merchant_service_evil_1_hail_gm_f715099e.mp3", "Hello there, kind adventurer.  My merchandise carries the seal of the Overlord himself!  Go ahead, take a look!", "salute_freeport", 1962442487, 899461162, Spawn, 0)
	end
end