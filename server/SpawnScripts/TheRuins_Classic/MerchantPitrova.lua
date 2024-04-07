--[[
    Script Name    : SpawnScripts/TheRuins_Classic/MerchantPitrova.lua
    Script Author  : Dorbin
    Script Date    : 2023.07.04 05:07:48
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
		PlayFlavor(NPC, "voiceover/english/ratonga_eco_evil_1/ft/service/merchant/ratonga_merchant_service_evil_1_aoi_gf_53388b91.mp3", "Only traitors to the Overlord would pass up a bargain like this.  You're not a traitor are you?", "scold", 1269771027, 1321830597, Spawn, 0)
        end
    end
end


function hailed(NPC, Spawn)
    if GetFactionAmount(Spawn,12)<0 then
	local choice = MakeRandomInt(1,2)
	    if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/ratonga_eco_evil_1/ft/service/merchant/ratonga_merchant_service_evil_1_notcitizen_gf_a42fcf6.mp3", "We don't serve your pathetic kind here.  Get out of my sight!", "glare", 2693427635, 1267181463, Spawn, 0)
	    elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/ratonga_eco_evil_1/ft/service/merchant/ratonga_merchant_service_evil_1_notcitizen_gf_6967bdd1.mp3", "I'm sorry. We don't sell lollipops and daisies here.  Go on now, run along and play.", "swear", 918667969, 4244893713, Spawn, 0)
        end
    else        
	RandomGreeting(NPC, Spawn)
    end
end

function RandomGreeting(NPC, Spawn)
	local choice = MakeRandomInt(1,2)

	if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/ratonga_eco_evil_1/ft/service/merchant/ratonga_merchant_service_evil_1_hail_gf_f715099e.mp3", "Hello there, kind adventurer.  My merchandise carries the seal of the Overlord himself!  Go ahead, take a look!", "salute_freeport", 3557499503, 3758276116, Spawn, 0)
	elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/ratonga_eco_evil_1/ft/service/merchant/ratonga_merchant_service_evil_1_hail_gf_aff3fc07.mp3", "Are you going to buy anything today or am I just wasting my time?  This isn't a museum display you know!", "glare", 3896024368, 3267129756, Spawn, 0)
	elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/ratonga_eco_evil_1/ft/service/merchant/ratonga_merchant_service_evil_1_hail_gf_d088c20d.mp3", "The stuff's over there.  Just let me know if you find anything you like.", "ponder", 4265688146, 2432877514, Spawn, 0)
	end
end