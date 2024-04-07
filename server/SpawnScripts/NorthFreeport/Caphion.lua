--[[
    Script Name    : SpawnScripts/NorthFreeport/Caphion.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.09 05:10:42
    Script Purpose : 
                   : 
--]]

function spawn(NPC)
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
	RandomGreeting(NPC, Spawn)
end

function RandomGreeting(NPC, Spawn)
	local choice = MakeRandomInt(1,5)

	if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/human_eco_evil_1/ft/service/merchant/human_merchant_service_evil_1_hail_gf_f715099e.mp3", "Hello there, kind adventurer.  My merchandise carries the seal of the Overlord himself!  Go ahead, take a look!", "salute_freeport", 1817378690, 2459690771, Spawn, 0)
	elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/human_eco_evil_1/ft/service/merchant/human_merchant_service_evil_1_hail_gf_7d521aa2.mp3", "Hello! Can I offer you one of our new lifetime extended warranties for any merchandise you purchase?  ", "nod", 1377121065, 1621186679, Spawn, 0)
	elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/human_eco_evil_1/ft/service/merchant/human_merchant_service_evil_1_hail_gf_aff3fc07.mp3", "Are you going to buy anything today or am I just wasting my time?  This isn't a museum display you know!", "glare", 1299723818, 3048193330, Spawn, 0)
	elseif choice == 4 then
		PlayFlavor(NPC, "voiceover/english/human_eco_evil_1/ft/service/merchant/human_merchant_service_evil_1_hail_gf_d088c20d.mp3", "The stuff's over there.  Just let me know if you find anything you like.", "ponder", 2963689917, 1457704094, Spawn, 0)
	elseif choice == 5 then
		PlayFlavor(NPC, "voiceover/english/human_eco_evil_1/ft/service/merchant/human_merchant_service_evil_1_aoi_gf_53388b91.mp3", "Only traitors to the Overlord would pass up a bargain like this.  You're not a traitor are you?", "scold", 2632179815, 4191292693, Spawn, 0)
	end
end