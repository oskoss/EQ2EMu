--[[
    Script Name    : SpawnScripts/BeggarsCourt/ShieldsmithPebblemark.lua
    Script Author  : Dorbin
    Script Date    : 2023.11.28 07:11:48
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
if  GetFactionAmount(Spawn,12) <=0 then
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
        PlayFlavor(NPC, "voiceover/english/halfelf_eco_evil_1/ft/service/merchant/halfelf_merchant_service_evil_1_hail_gf_aff3fc07.mp3", "Are you going to buy anything today or am I just wasting my time? This isn't a museum display you know!", "glare", 175282120, 2443997290, Spawn)
    elseif choice == 2 then
        PlayFlavor(NPC, "voiceover/english/halfelf_eco_evil_1/ft/service/merchant/halfelf_merchant_service_evil_1_hail_gf_d088c20d.mp3", "The stuff's over there. Just let me know if you find anything you like.", "ponder", 2378717460, 740610806, Spawn)
    elseif choice == 3 then
        PlayFlavor(NPC, "voiceover/english/halfelf_eco_evil_1/ft/service/merchant/halfelf_merchant_service_evil_1_hail_gf_f715099e.mp3", "Hello there, kind adventurer. My merchandise carries the seal of the Overlord himself! Go ahead, take a look!", "salute_freeport", 3198881432, 747888667, Spawn)
    end
end