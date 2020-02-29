--[[
	Script Name	: SpawnScripts/Starcrest/Tanaira.lua
	Script Purpose	: Tanaira <Provisioner>
	Script Author	: John Adams
	Script Date	: 2008.09.23
	Script Notes	: Auto-Generated Conversation from PacketParser Data
--]]

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	choice = math.random(1,4)

	if choice == 1 then
		PlayFlavor(NPC, "", "Oops! Sorry! I thought you were someone else. Please, be on your way now.", "", 1689589577, 4560189, Spawn)
	elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/human_eco_good_1/ft/service/baker/human_baker_service_good_1_hail_gf_3d1ca473.mp3", "Tell me, do you prefer Halfling or Elven cuisine?  I myself have a hard time deciding between the two.", "confused", 3151047462, 2904038035, Spawn)
	elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/human_eco_good_1/ft/service/baker/human_baker_service_good_1_hail_gf_cca9cdef.mp3", "Welcome friend, welcome.  I hope you brought your appetite with you!", "wink", 488782681, 166399094, Spawn)
	elseif choice == 4 then
		PlayFlavor(NPC, "voiceover/english/human_eco_good_1/ft/service/baker/human_baker_service_good_1_hail_gf_9db280de.mp3", "I love the smell of fresh bread in the oven!", "sigh", 1068415951, 2036199467, Spawn)
	end
end