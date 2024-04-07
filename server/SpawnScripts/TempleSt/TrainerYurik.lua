--[[
    Script Name    : SpawnScripts/TempleSt/TrainerYurik.lua
    Script Author  : Dorbin
    Script Date    : 2023.11.07 05:11:05
    Script Purpose : 
                   : 
--]]

require "SpawnScripts/Generic/DialogModule"

function spawn(NPC)
end

function respawn(NPC)
	spawn(NPC)
end



function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
	 if GetFactionAmount(Spawn,12) >0 then
     Dialog1(NPC, Spawn)
 elseif  GetFactionAmount(Spawn,12) <=0 then
	    FaceTarget(NPC, Spawn)
        PlayFlavor(NPC, "voiceover/english/ratonga_eco_evil_1/ft/ratonga/ratonga_eco_evil_1_notcitizen_gm_8d2a0876.mp3", "I heard you screaming from all the way over there.", "glare", 3634348917, 2158238801, Spawn)
    end	    
end

function     Dialog1(NPC, Spawn)
    FaceTarget(NPC,Spawn)
	local choice = MakeRandomInt(1,3)
	if choice == 1 then
        PlayFlavor(NPC, "voiceover/english/ratonga_eco_evil_1/ft/service/merchant/ratonga_merchant_service_evil_1_hail_gm_6ec08438.mp3", "In spite of the cost of living, it's still quite a popular item.", "ponder", 1147153942, 3317877781, Spawn)
	elseif choice == 2 then
        PlayFlavor(NPC, "voiceover/english/ratonga_eco_evil_1/ft/service/merchant/ratonga_merchant_service_evil_1_hail_gm_aff3fc07.mp3", "Are you going to buy anything today or am I just wasting my time? This isn't a museum display you know!", "glare", 2902124396, 1772494629, Spawn)
	elseif choice == 3 then
        PlayFlavor(NPC, "voiceover/english/ratonga_eco_evil_1/ft/service/merchant/ratonga_merchant_service_evil_1_hail_gm_f715099e.mp3", "Hello there, kind adventurer. My merchandise carries the seal of the Overlord himself! Go ahead, take a look!", "salute_freeport", 686446071, 58743600, Spawn)
	end
end