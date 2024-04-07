--[[
    Script Name    : SpawnScripts/TheSprawl_Classic/MerchantLoria.lua
    Script Author  : Dorbin
    Script Date    : 2023.12.05 07:12:05
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
        PlayFlavor(NPC, "voiceover/english/human_eco_evil_1/ft/service/merchant/human_merchant_service_evil_1_aoi_gf_53388b91.mp3", "Only traitors to the Overlord would pass up a bargain like this. You're not a traitor are you?", "scold", 2632179815, 4191292693, Spawn)
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
	local choice = MakeRandomInt(1,2)
	if choice == 1 then
	    PlayFlavor(NPC, "", "I'm sorry, much as I want your coin.... My skin intact is considerably more valuable.", "heckno", 0, 0, Spawn, 0)
    else	    
	    PlayFlavor(NPC, "", "It is treasonous to sell wares to the citizens of Qeynos!  Remove yourself and I will not summon the militia!", "shakefist", 0, 0, Spawn, 0)
    end
    end	    
end

function     Dialog1(NPC, Spawn)
    FaceTarget(NPC,Spawn)
	local choice = MakeRandomInt(1,3)
	if choice == 1 then
        PlayFlavor(NPC, "voiceover/english/human_eco_evil_1/ft/service/merchant/human_merchant_service_evil_1_hail_gf_f715099e.mp3", "Hello there, kind adventurer. My merchandise carries the seal of the Overlord himself! Go ahead, take a look!", "salute_freeport", 1817378690, 2459690771, Spawn)
	elseif choice == 2 then
        PlayFlavor(NPC, "voiceover/english/human_eco_evil_1/ft/service/merchant/human_merchant_service_evil_1_hail_gf_d088c20d.mp3", "The stuff's over there. Just let me know if you find anything you like.", "ponder", 2963689917, 1457704094, Spawn)
	elseif choice == 3 then
        PlayFlavor(NPC, "voiceover/english/optional2/barbarian_eco_evil_2/ft/service/merchant/barbarian_merchant_service_evil_2_hail_gm_aff3fc07.mp3", "Are you going to buy anything today or am I just wasting my time? This isn't a museum display you know!", "glare", 1385543830, 1478025098, Spawn)
	end
end