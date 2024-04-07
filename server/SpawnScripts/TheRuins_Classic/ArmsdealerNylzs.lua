--[[
    Script Name    : SpawnScripts/TheRuins_Classic/ArmsdealerNylzs.lua
    Script Author  : Dorbin
    Script Date    : 2023.07.04 05:07:56
    Script Purpose : 
                   : 
--]]
function spawn(NPC)
	SetPlayerProximityFunction(NPC, 12, "InRange", "LeaveRange")
end

function respawn(NPC)
	spawn(NPC)
end


function InRange(NPC, Spawn)
    if GetFactionAmount(Spawn,12)>0 then	  
	    if MakeRandomInt(1, 100) <= 25 then
 	    FaceTarget(NPC, Spawn)
		PlayFlavor(NPC, "voiceover/english/iksar_eco_evil_1/ft/service/merchant/iksar_merchant_service_evil_1_aoi_gm_b9dbd27d.mp3", "Only traitors to the Overlord would pass up a bargain like this.  You're not a traitor are you?", "scold", 3019943489, 1406568446, Spawn, 0)
        end
    end
end


function hailed(NPC, Spawn)
    if GetFactionAmount(Spawn,12)<0 then
	local choice = MakeRandomInt(1,4)
	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/iksar_eco_evil_1/ft/service/merchant/iksar_merchant_service_evil_1_notcitizen_gm_34401a59.mp3", "It is treasonous to sell wares to the citizens of Qeynos!  Remove yourself and I will not summon the militia!", "tapfoot", 3207287074, 2285969803, Spawn, 0)
	elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/iksar_eco_evil_1/ft/service/merchant/iksar_merchant_service_evil_1_notcitizen_gm_aef2fedb.mp3", "I'm sorry. We don't sell lollipops and daisies here.  Go on now, run along and play.", "frustrated", 4198095463, 3568397698, Spawn, 0)
	elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/iksar_eco_evil_1/ft/service/merchant/iksar_merchant_service_evil_1_notcitizen_gm_a42fcf6.mp3", "We don't serve your pathetic kind here.  Get out of my sight!", "no", 1225129708, 2416370663, Spawn, 0)
	elseif choice == 4 then
        PlayFlavor(NPC, "voiceover/english/iksar_eco_evil_1/ft/service/merchant/iksar_merchant_service_evil_1_hail_gm_f715099e.mp3", "Hello there, kind adventurer. My merchandise carries the seal of the Overlord himself! Go ahead, take a look!", "salute_freeport", 105908870, 230263487, Spawn)
        end
    else        
	RandomGreeting(NPC, Spawn)
    end
end


function RandomGreeting(NPC, Spawn)
	local choice = MakeRandomInt(1,4)

	if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/iksar_eco_evil_1/ft/service/merchant/iksar_merchant_service_evil_1_hail_gm_f715099e.mp3", "Hello there, kind adventurer.  My merchandise carries the seal of the Overlord himself!  Go ahead, take a look!", "salute_freeport", 105908870, 230263487, Spawn, 0)
	elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/iksar_eco_evil_1/ft/service/merchant/iksar_merchant_service_evil_1_hail_gm_6ec08438.mp3", "In spite of the cost of living, it's still quite a popular item.", "ponder", 2596269432, 669710728, Spawn, 0)
	elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/iksar_eco_evil_1/ft/service/merchant/iksar_merchant_service_evil_1_hail_gm_1a08e567.mp3", "Hello! Can I offer you one of our new lifetime extended warranties for any merchandise you purchase?  ", "nod", 1197055422, 631535840, Spawn, 0)
	elseif choice == 4 then
		PlayFlavor(NPC, "voiceover/english/iksar_eco_evil_1/ft/service/merchant/iksar_merchant_service_evil_1_hail_gm_aff3fc07.mp3", "Are you going to buy anything today, or am I just wasting my time?  This isn't a museum display you know!", "glare", 1394544165, 1181852771, Spawn, 0)
   end
end

    
function respawn(NPC)
	spawn(NPC)
end