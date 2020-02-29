--[[
	Script Name	: SpawnScripts/ScaleYard/Kakriss.lua
	Script Purpose	: Kakriss <Bowyer>
	Script Author	: John Adams
	Script Date	: 2008.10.01
	Script Notes	: Auto-Generated Conversation from PacketParser Data
--]]

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	choice = math.random(1,4)

	if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/iksar_eco_evil_1/ft/service/merchant/iksar_merchant_service_evil_1_hail_gm_aff3fc07.mp3", "Are you going to buy anything today, or am I just wasting my time?  This isn't a museum display you know!", "glare", 1394544165, 1181852771, Spawn)
	elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/iksar_eco_evil_1/ft/service/merchant/iksar_merchant_service_evil_1_hail_gm_6ec08438.mp3", "In spite of the cost of living, it's still quite a popular item.", "ponder", 2596269432, 669710728, Spawn)
	elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/iksar_eco_evil_1/ft/service/merchant/iksar_merchant_service_evil_1_hail_gm_1a08e567.mp3", "Hello! Can I offer you one of our new lifetime extended warranties for any merchandise you purchase?  ", "nod", 1197055422, 631535840, Spawn)
	elseif choice == 4 then
		PlayFlavor(NPC, "voiceover/english/iksar_eco_evil_1/ft/service/merchant/iksar_merchant_service_evil_1_hail_gm_f715099e.mp3", "Hello there, kind adventurer.  My merchandise carries the seal of the Overlord himself!  Go ahead, take a look!", "salute_freeport", 105908870, 230263487, Spawn)
	end

end

