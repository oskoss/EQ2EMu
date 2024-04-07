--[[
	Script Name		: SpawnScripts/BeggarsCourt/NilniarUrsus.lua
	Script Purpose	: Nilniar Ursus
	Script Author	: Dorbin
	Script Date		: 2022.07.18
	Script Notes	: Auto-Generated Conversation from PacketParser Data
--]]
dofile("SpawnScripts/Generic/GenericEcologyVoiceOvers.lua")

local TimeCheck = false                                                       -- used to delay between hail uses
local CalloutTimeCheck = false                                                -- used to delay between callout uses

function spawn(NPC)
--    SetPlayerProximityFunction(NPC, 6, "InRange", "LeaveRange")
end

function InRange(NPC, Spawn)
	if GetFactionAmount(Spawn,12) <0 then
     	FaceTarget(NPC, Spawn)
        FactionChecking(NPC, Spawn, faction)
    else       
        if MakeRandomInt(1, 100) <= 30 and CalloutTimeCheck == false then
        CalloutTimeCheck = true
        FaceTarget(NPC, Spawn)			            
	    AddTimer(NPC,25000,"ResetCalloutTimer")      
		Talk(NPC, Spawn)
	    end
    end
end

function ResetTimer(NPC)                                                      -- resets hail timer after initial use
   TimeCheck = false 
end

function ResetCalloutTimer(NPC)                                               -- resets callout timer after use
   CalloutTimeCheck = false 
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
local FP_MageFaction = GetFactionAmount(Spawn, 104)
	if FP_MageFaction >=10000 then
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
		PlayFlavor(NPC, "voiceover/english/human_eco_evil_arcanescientists/ft/eco/evil/human_male_eco_evil_arcanescientists_hail_gm_d4cf5e3d.mp3", "The Dismal Rage is an evil entity that can destroy your soul.", "", 561192192, 3579530691, Spawn, 0)
	elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/human_eco_evil_arcanescientists/ft/eco/evil/human_male_eco_evil_arcanescientists_hail_gm_52cf3660.mp3", "The Seafuries are just a bunch of mindless sea dwellers.", "", 2052685278, 167982355, Spawn, 0)
	elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/human_eco_evil_arcanescientists/ft/eco/evil/human_male_eco_evil_arcanescientists_hail_gm_6727c950.mp3", "The minds at the Academy of Arcane Science are infinite.", "", 137200926, 848953238, Spawn, 0)
	elseif choice == 4 then
		PlayFlavor(NPC, "voiceover/english/human_eco_evil_arcanescientists/ft/eco/evil/human_male_eco_evil_arcanescientists_hail_gm_43509cc2.mp3", "The Freeport Militia is only as competent as their ability to swing a longsword.", "", 1079669242, 1377863119, Spawn, 0)
	elseif choice == 5 then
		PlayFlavor(NPC, "voiceover/english/human_eco_evil_arcanescientists/ft/eco/evil/human_male_eco_evil_arcanescientists_hail_gm_85a84d51.mp3", "The members within the Coalition of Tradefolke are nothing more than common thieves that empty your pockets before your eyes.", "", 1941815786, 1528387739, Spawn, 0)
	end
end

function FactionTalk(NPC,Spawn)
local FP_MageFaction = GetFactionAmount(Spawn, 104)
	    if FP_MageFaction >=40000 then
    	FaceTarget(NPC, Spawn)
		PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_arcanescientists/ft/eco/evil/darkelf_female_eco_evil_arcanescientists_40_gf_c38c736.mp3", "To aid the Academy of Arcane Science is to unleash the force for power that burns within us all!", "cheer", 0, 0, Spawn)
	    elseif FP_MageFaction >=30000 then
	    FaceTarget(NPC, Spawn)
		PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_arcanescientists/ft/eco/evil/darkelf_female_eco_evil_arcanescientists_30_gf_130c3c71.mp3", "You have helped the Academy of Arcane Science rise in power and brought some invaluable assets within these walls.", "thank", 0, 0, Spawn)
	    elseif FP_MageFaction >=20000 then
	    FaceTarget(NPC, Spawn)
		PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_arcanescientists/ft/eco/evil/darkelf_female_eco_evil_arcanescientists_20_gf_7b836853.mp3", "Your actions have assisted the Academy of Arcane Science in its quest for all knowledge!", "", 0, 0, Spawn)
	    elseif FP_MageFaction >=10000 then
	    FaceTarget(NPC, Spawn)
		PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_arcanescientists/ft/eco/evil/darkelf_female_eco_evil_arcanescientists_10_gf_5547196e.mp3", "Your actions have done well for the Academy of Arcane Science, but there is always more to know.", "nod", 0, 0, Spawn)
	    end
end