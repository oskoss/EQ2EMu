--[[
    Script Name    : SpawnScripts/TempleSt/MerchantSvasha.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.23 04:10:35
    Script Purpose : 
                   : 
--]]
function spawn(NPC)
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC,Spawn)
	RandomGreeting(NPC, Spawn)
end

function RandomGreeting(NPC, Spawn)
	local choice = MakeRandomInt(1,5)

	if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/ratonga_eco_evil_1/ft/service/housing/ratonga_housing_service_evil_1_hail_gf_1330ddd8.mp3", "We don't sell contraband furnishings here.  We sell only pieces approved by the Overlord!", "salute_freeport", 1392993711, 273366781, Spawn, 0)
	elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/ratonga_eco_evil_1/ft/service/housing/ratonga_housing_service_evil_1_hail_gf_33fe2ae6.mp3", "Don't be ashamed, friend.  We have pieces that even ratongas can afford!", "wink", 4096328055, 3693524473, Spawn, 0)
	elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/ratonga_eco_evil_1/ft/service/housing/ratonga_housing_service_evil_1_hail_gf_b7e3bdf0.mp3", "Welcome friend of the Overlord,  please look around.  We have several pieces from the Citadel itself!      ", "bow", 1752480420, 1670014463, Spawn, 0)
	elseif choice == 4 then
		PlayFlavor(NPC, "voiceover/english/ratonga_eco_evil_1/ft/service/housing/ratonga_housing_service_evil_1_hail_gf_157bc4f4.mp3", "Please don't touch anything.  This isn't a museum. If you break it, you buy it!", "scold", 3969302593, 2173248115, Spawn, 0)
	elseif choice == 5 then
		PlayFlavor(NPC, "voiceover/english/ratonga_eco_evil_1/ft/service/housing/ratonga_housing_service_evil_1_aoi_gf_37d02a81.mp3", "This is it, adventurer, the Sir Lucan day sale!  For the next 24 hours no interest until the next cataclysm! ", "beckon", 3327307554, 1657108613, Spawn, 0)
	end
end