--[[
	Script Name	: SpawnScripts/Longshadow/ArmsdealerTNyvez.lua
	Script Purpose	: Armsdealer T`Nyvez <Weaponsmith>
	Script Author	: John Adams
	Script Date	: 2008.09.29
	Script Notes	: Auto-Generated Conversation from PacketParser Data
--]]
require "SpawnScripts/Generic/DialogModule"

function spawn(NPC)
SetPlayerProximityFunction(NPC, 9, "InRange", "LeaveRange")
end

function respawn(NPC)
	spawn(NPC)
end

function InRange(NPC, Spawn)
	 if MakeRandomInt(1, 100) <= 18 and GetFactionAmount(Spawn,12) >0 then
	    FaceTarget(NPC, Spawn)
        PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_1/ft/service/weaponsmith/darkelf_weaponsmith_service_evil_1_aoi_gf_e5231875.mp3", "Don't be caught defenseless when your enemies strike.  See our stock of weapons, before it's too late!", "bye", 3596090341, 1905755630, Spawn)
 elseif  GetFactionAmount(Spawn,12) <=0 then
        PlayFlavor(NPC, "voiceover/english/highelf_eco_good_1/ft/highelf/highelf_eco_good_1_notcitizen_gf_6da83eeb.mp3", "I'll defend myself if it comes to that, savage.", "", 3357669916, 1930978996, Spawn)
    end
end   

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
    if GetFactionAmount(Spawn,12) >0 then
    Dialog1(NPC, Spawn)
	else
    PlayFlavor(NPC, "voiceover/english/highelf_eco_good_1/ft/highelf/highelf_eco_good_1_notcitizen_gf_6da83eeb.mp3", "I'll defend myself if it comes to that, savage.", "", 3357669916, 1930978996, Spawn)
    end	    
end

function Dialog1(NPC, Spawn)
	local choice = MakeRandomInt(1,4)
	if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_1/ft/service/weaponsmith/darkelf_weaponsmith_service_evil_1_hail_gf_de25bbfc.mp3", "The only thing separating you from death in this city are your wits.  I wouldn't call that adequate protection.", "sarcasm", 3764437747, 3191922927, Spawn, 0)
	elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_1/ft/service/weaponsmith/darkelf_weaponsmith_service_evil_1_hail_gf_fa46b6f6.mp3", "Is there a specific way you're looking to kill someone?  Disemboweling, beheading, impaling, strangulation?", "shrug", 1925778208, 2473902714, Spawn, 0)
	elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_1/ft/service/weaponsmith/darkelf_weaponsmith_service_evil_1_hail_gf_9d2ef5c4.mp3", "A good weapon at your side is the only real friend you'll ever have!", "agree", 2557998412, 1299746806, Spawn, 0)
	elseif choice == 4 then
		PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_1/ft/service/weaponsmith/darkelf_weaponsmith_service_evil_1_hail_gf_febc50f4.mp3", "We have a nice selection of previously owned weapons for those with modest funds.", "sniff", 1102225128, 1972146444, Spawn, 0)
	end
end
