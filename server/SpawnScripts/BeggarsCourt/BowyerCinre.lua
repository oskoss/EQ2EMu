--[[
    Script Name    : SpawnScripts/BeggarsCourt/BowyerCinre.lua
    Script Author  : Dorbin
    Script Date    : 2023.11.30 04:11:09
    Script Purpose : 
                   : 
--]]

require "SpawnScripts/Generic/DialogModule"

function spawn(NPC)
SetPlayerProximityFunction(NPC, 9, "InRange", "LeaveRange")
    SetInfoStructString(NPC, "action_state", "woodworking_idle")
end

function respawn(NPC)
	spawn(NPC)
end

function InRange(NPC, Spawn)
	 if MakeRandomInt(1, 100) <= 18 and GetFactionAmount(Spawn,12) >0 then
	    FaceTarget(NPC, Spawn)
        PlayFlavor(NPC, "voiceover/english/human_eco_evil_1/ft/service/weaponsmith/human_weaponsmith_service_evil_1_aoi_gf_e5231875.mp3", "Don't be caught defenseless when your enemies strike. See our stock of weapons, before it's too late!", "beckon", 309302899, 2401241224, Spawn)
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
	else
	FaceTarget(NPC, Spawn)
    PlayFlavor(NPC, "voiceover/english/highelf_eco_good_1/ft/highelf/highelf_eco_good_1_notcitizen_gf_6da83eeb.mp3", "I'll defend myself if it comes to that, savage.", "", 3357669916, 1930978996, Spawn)
    end	    
end

function     Dialog1(NPC, Spawn)
    FaceTarget(NPC,Spawn)
	local choice = MakeRandomInt(1,3)
	if choice == 1 then
        PlayFlavor(NPC, "voiceover/english/human_eco_evil_1/ft/service/weaponsmith/human_weaponsmith_service_evil_1_hail_gf_febc50f4.mp3", "We have a nice selection of previously owned weapons for those with modest funds.", "snicker", 371686597, 174492048, Spawn)
	elseif choice == 2 then
        PlayFlavor(NPC, "voiceover/english/human_eco_evil_1/ft/service/weaponsmith/human_weaponsmith_service_evil_1_hail_gf_fa46b6f6.mp3", "Is there a specific way you're looking to kill someone? Disemboweling, beheading, impaling, strangulation? ", "shrug", 501792161, 2107655376, Spawn)
	elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/human_eco_evil_1/ft/service/weaponsmith/human_weaponsmith_service_evil_1_hail_gf_9d2ef5c4.mp3", "A good weapon at your side is the only real friend you'll ever have!", "agree", 3419843926, 3349211138, Spawn, 0)
	end
end