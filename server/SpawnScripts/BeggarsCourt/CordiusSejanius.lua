--[[
	Script Name		: SpawnScripts/BeggarsCourt/CordiusSejanius.lua
	Script Purpose	: Cordius Sejanius
	Script Author	: Dorbin
	Script Date		: 2022.07.18
	Script Notes	: Auto-Generated Conversation from PacketParser Data
--]]

dofile("SpawnScripts/Generic/GenericEcologyVoiceOvers.lua")

local TimeCheck = false                                                       -- used to delay between hail uses

function spawn(NPC)
    SetPlayerProximityFunction(NPC, 6, "InRange", "LeaveRange")
    SetTempVariable(NPC,"CalloutTimeCheck","false") -- used to delay between callout uses
end

function InRange(NPC, Spawn)
	if GetFactionAmount(Spawn,12) <0 then
     	FaceTarget(NPC, Spawn)
        FactionChecking(NPC, Spawn, faction)
    else       
        if  GetTempVariable(NPC,"CalloutTimeCheck") == "false" then
        SetTempVariable(NPC,"CalloutTimeCheck","true") -- used to delay between callout uses
	    AddTimer(NPC,25000,"ResetCalloutTimer")  
	    if MakeRandomInt(1,2)==1 then
        FaceTarget(NPC, Spawn)			            
		Talk(NPC, Spawn)
		else
	    zone = GetZone(NPC)    
        Other = GetSpawnByLocationID(zone,402980)
        OtherTalk(Other,Spawn)    
    end
    end
end
end

function ResetTimer(NPC)                                                      -- resets hail timer after initial use
   TimeCheck = false 
end

function ResetCalloutTimer(NPC)                                               -- resets callout timer after use
    SetTempVariable(NPC,"CalloutTimeCheck","false")
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
	if GetFactionAmount(Spawn,12) <0 then
     	FaceTarget(NPC, Spawn)
        FactionChecking(NPC, Spawn, faction)
    else    
	    if TimeCheck == false then                                              -- checks timer
        TimeCheck = true                                                        -- turns on timer to stop player spamming
	    AddTimer(NPC,2500,"ResetTimer")   
	    FaceTarget(NPC, Spawn)
	    Talk(NPC, Spawn)
        end
    end
end

function Talk(NPC, Spawn)
local FP_PriestFaction = GetFactionAmount(Spawn,  105 	)
	if FP_PriestFaction >=10000 then
	local choice = MakeRandomInt(1, 3) --Adds faction praise callout 33% of the time when applicable.
    else
	local choice = MakeRandomInt(1, 2)
	if choice == 1 then
        BasicTalk(NPC,Spawn)
    elseif choice == 2 then
        BasicTalk(NPC,Spawn)
    elseif choice == 3 then
        FactionTalk(NPC,Spawn)
        end
    end
end

function BasicTalk(NPC,Spawn)
	local choice = MakeRandomInt(1, 5)
	if choice == 1 then
		PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_dismalrage/ft/eco/evil/darkelf_female_eco_evil_dismalrage_hail_gf_b9254acf.mp3", "The words preached by the Dismal Rage bring spiritual enlightenment to the weak.", "", 116806204, 1893451787, Spawn, 0)
	elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_dismalrage/ft/eco/evil/darkelf_female_eco_evil_dismalrage_hail_gf_f7ca6051.mp3", "I find it vile that our great city has entrusted its protection to a group of degenerates such as the Freeport Militia.", "", 1175835727, 2628271838, Spawn, 0)
	elseif choice == 3 then
        PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_dismalrage/ft/eco/evil/darkelf_female_eco_evil_dismalrage_hail_gf_5a9793ef.mp3", "The Coalition of Tradesfolke aren't capable of serving anyone other than to serve its own greed.", "", 3353210602, 2809554948, Spawn)
	elseif choice == 4 then
        PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_dismalrage/ft/eco/evil/darkelf_female_eco_evil_dismalrage_hail_gf_7abc3066.mp3", "Too often the Arcane Scientists at the academy dedicate themselves to useless knowledge that is of no use to our city.", "", 1261386119, 1368644822, Spawn)
	elseif choice == 5 then
        PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_dismalrage/ft/eco/evil/darkelf_female_eco_evil_dismalrage_hail_gf_7d78cf9d.mp3", "The weak souls of the Seafury Buccaneers only cry, running to a priest when facing certain death.", "", 683812929, 1852419614, Spawn)
    end
end

function FactionTalk(NPC,Spawn)
local FP_PriestFaction = GetFactionAmount(Spawn,  105 	)
	    if FP_PriestFaction >=40000 then
    	FaceTarget(NPC, Spawn)
		PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_arcanescientists/ft/eco/evil/darkelf_female_eco_evil_arcanescientists_40_gf_c38c736.mp3", "To aid the Dismal Rage is to worship the One True God for power that binds us to this realm!", "cheer", 0, 0, Spawn)
	    elseif FP_PriestFaction >=30000 then
	    FaceTarget(NPC, Spawn)
		PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_dismalrage/ft/eco/evil/darkelf_female_eco_evil_dismalrage_30_gf_350ac522.mp3", "To realize your full potential you must drive all empathy and pity from your heart.", "", 2475957665, 3294345346, Spawn, 0)
	    elseif FP_PriestFaction >=20000 then
	    FaceTarget(NPC, Spawn)
		PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_arcanescientists/ft/eco/evil/darkelf_female_eco_evil_arcanescientists_20_gf_7b836853.mp3", "The ritualistic power of Dismal Rage is what gives spiritual strength to us all.", "", 0, 0, Spawn)
	    elseif FP_PriestFaction >=10000 then
	    FaceTarget(NPC, Spawn)
        PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_dismalrage/ft/eco/evil/darkelf_female_eco_evil_dismalrage_10_gf_1a36b724.mp3", "You must learn to release the chaos and destruction of your power.", "", 1739074440, 1700879521, Spawn)
	    end
end

function OtherTalk(Other, Spawn)
local FP_MageFaction = GetFactionAmount(Spawn, 104)
	if FP_MageFaction >=10000 then
	local choice = MakeRandomInt(1, 3) --Adds faction praise callout 33% of the time when applicable.
    else
	local choice = MakeRandomInt(1, 2)
	if choice == 1 then
        OtherBasicTalk(Other,Spawn)
    elseif choice == 2 then
        OtherBasicTalk(Other,Spawn)
    elseif choice == 3 then
        OtherFactionTalk(Other,Spawn)
        end
    end
end

function OtherBasicTalk(Other,Spawn)
	local choice = MakeRandomInt(1, 5)
	if choice == 1 then
		PlayFlavor(Other, "voiceover/english/human_eco_evil_arcanescientists/ft/eco/evil/human_male_eco_evil_arcanescientists_hail_gm_d4cf5e3d.mp3", "The Dismal Rage is an evil entity that can destroy your soul.", "", 561192192, 3579530691, Spawn, 0)
	elseif choice == 2 then
		PlayFlavor(Other, "voiceover/english/human_eco_evil_arcanescientists/ft/eco/evil/human_male_eco_evil_arcanescientists_hail_gm_52cf3660.mp3", "The Seafuries are just a bunch of mindless sea dwellers.", "", 2052685278, 167982355, Spawn, 0)
	elseif choice == 3 then
		PlayFlavor(Other, "voiceover/english/human_eco_evil_arcanescientists/ft/eco/evil/human_male_eco_evil_arcanescientists_hail_gm_6727c950.mp3", "The minds at the Academy of Arcane Science are infinite.", "", 137200926, 848953238, Spawn, 0)
	elseif choice == 4 then
		PlayFlavor(Other, "voiceover/english/human_eco_evil_arcanescientists/ft/eco/evil/human_male_eco_evil_arcanescientists_hail_gm_43509cc2.mp3", "The Freeport Militia is only as competent as their ability to swing a longsword.", "", 1079669242, 1377863119, Spawn, 0)
	elseif choice == 5 then
		PlayFlavor(Other, "voiceover/english/human_eco_evil_arcanescientists/ft/eco/evil/human_male_eco_evil_arcanescientists_hail_gm_85a84d51.mp3", "The members within the Coalition of Tradefolke are nothing more than common thieves that empty your pockets before your eyes.", "", 1941815786, 1528387739, Spawn, 0)
	end
end

function OtherFactionTalk(Other,Spawn)
local FP_MageFaction = GetFactionAmount(Spawn, 104)
	    if FP_MageFaction >=40000 then
    	FaceTarget(Other, Spawn)
		PlayFlavor(Other, "voiceover/english/darkelf_eco_evil_arcanescientists/ft/eco/evil/darkelf_female_eco_evil_arcanescientists_40_gf_c38c736.mp3", "To aid the Academy of Arcane Science is to unleash the force for power that burns within us all!", "cheer", 0, 0, Spawn)
	    elseif FP_MageFaction >=30000 then
	    FaceTarget(Other, Spawn)
		PlayFlavor(Other, "voiceover/english/darkelf_eco_evil_arcanescientists/ft/eco/evil/darkelf_female_eco_evil_arcanescientists_30_gf_130c3c71.mp3", "You have helped the Academy of Arcane Science rise in power and brought some invaluable assets within these walls.", "thank", 0, 0, Spawn)
	    elseif FP_MageFaction >=20000 then
	    FaceTarget(Other, Spawn)
		PlayFlavor(Other, "voiceover/english/darkelf_eco_evil_arcanescientists/ft/eco/evil/darkelf_female_eco_evil_arcanescientists_20_gf_7b836853.mp3", "Your actions have assisted the Academy of Arcane Science in its quest for all knowledge!", "", 0, 0, Spawn)
	    elseif FP_MageFaction >=10000 then
	    FaceTarget(Other, Spawn)
		PlayFlavor(Other, "voiceover/english/darkelf_eco_evil_arcanescientists/ft/eco/evil/darkelf_female_eco_evil_arcanescientists_10_gf_5547196e.mp3", "Your actions have done well for the Academy of Arcane Science, but there is always more to know.", "nod", 0, 0, Spawn)
	    end
end