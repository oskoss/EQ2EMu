--[[
    Script Name    : SpawnScripts/TheSprawl_Classic/MerchantSasha.lua
    Script Author  : Dorbin
    Script Date    : 2023.12.05 07:12:47
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
		PlayFlavor(NPC, "voiceover/english/optional2/ratonga_eco_evil_3/ft/service/merchant/ratonga_merchant_service_evil_3_aoi_gf_53388b91.mp3", "Only traitors to the Overlord would pass up a bargain like this.  You're not a traitor are you?", "scold", 2288309507, 1188267472, Spawn, 0)
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
	local choice = MakeRandomInt(1,3)
	if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional2/ratonga_eco_evil_3/ft/service/merchant/ratonga_merchant_service_evil_3_notcitizen_gf_85c35337.mp3", "I'm sorry, much as I want your coin.... My skin intact is considerably more valuable.", "no", 371334210, 3276810891, Spawn, 0)
	elseif choice == 2 then
 		PlayFlavor(NPC, "voiceover/english/optional2/ratonga_eco_evil_3/ft/service/merchant/ratonga_merchant_service_evil_3_notcitizen_gf_34401a59.mp3", "It is treasonous to sell wares to the citizens of Qeynos!  Remove yourself and I will not summon the militia!", "shakefist", 2607521739, 3744177496, Spawn, 0)
   else	    
		PlayFlavor(NPC, "voiceover/english/optional2/ratonga_eco_evil_3/ft/service/merchant/ratonga_merchant_service_evil_3_notcitizen_gf_c0c992e7.mp3", "I'm afraid your business is not welcome here.  Now please, go away!", "no", 3973165990, 420905398, Spawn, 0)
    end
    end	    
end

function     Dialog1(NPC, Spawn)
    FaceTarget(NPC,Spawn)
	local choice = MakeRandomInt(1,3)
	if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/optional2/ratonga_eco_evil_3/ft/service/merchant/ratonga_merchant_service_evil_3_hail_gf_f715099e.mp3", "Hello there, kind adventurer.  My merchandise carries the seal of the Overlord himself!  Go ahead, take a look!", "salute_freeport", 3460692084, 694864112, Spawn, 0)
	elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/optional2/ratonga_eco_evil_3/ft/service/merchant/ratonga_merchant_service_evil_3_hail_gf_d088c20d.mp3", "The stuff's over there.  Just let me know if you find anything you like.", "ponder", 3740786388, 4176254637, Spawn, 0)
	elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/ratonga_eco_evil_1/ft/service/merchant/ratonga_merchant_service_evil_1_hail_gf_aff3fc07.mp3", "Are you going to buy anything today or am I just wasting my time?  This isn't a museum display you know!", "glare", 3896024368, 3267129756, Spawn, 0)
	end
end