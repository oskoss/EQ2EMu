--[[
	Script Name		: SpawnScripts/LongshadowAlley/CizraJYax.lua
	Script Purpose	: Cizra J`Yax
	Script Author	: Dorbin
	Script Date		: 2023.10.14
	Script Notes	:
--]]
dofile("SpawnScripts/Generic/GenericEcologyVoiceOvers.lua")

local TimeCheck = false                                                       -- used to delay between hail uses
local CalloutTimeCheck = false                                                -- used to delay between callout uses

function spawn(NPC)
    SetPlayerProximityFunction(NPC, 7, "InRange", "LeaveRange")
    waypoints(NPC)
end

function InRange(NPC, Spawn)
	if GetFactionAmount(Spawn,12) <0 then
     	FaceTarget(NPC, Spawn)
        FactionChecking(NPC, Spawn, faction)
    else       
        if MakeRandomInt(1, 100) <= 30 and CalloutTimeCheck == false then
        CalloutTimeCheck = true
        FaceTarget(NPC, Spawn)			            
	    AddTimer(NPC,60000,"ResetCalloutTimer")      
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
		PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_arcanescientists/ft/eco/evil/darkelf_female_eco_evil_arcanescientists_hail_gf_ec2a8705.mp3", "Mindless brutes that feed on the weak make up the ranks of the Freeport Militia.", "", 3674227482, 1789009112, Spawn, 0)
	elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_arcanescientists/ft/eco/evil/darkelf_female_eco_evil_arcanescientists_hail_gf_6ad11033.mp3", "When it comes to arcane knowledge, no one knows more about it than Arcane Scientists.", "", 458970350, 57476188, Spawn, 0)
	elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_arcanescientists/ft/eco/evil/darkelf_female_eco_evil_arcanescientists_hail_gf_dfb5c3b3.mp3", "The Seafuries are just a bunch of ruffians that pirate ships and trade on the black market.", "", 1213807064, 3494632294, Spawn, 0)
	elseif choice == 4 then
        PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_arcanescientists/ft/eco/evil/darkelf_female_eco_evil_arcanescientists_hail_gf_4dd0033.mp3", "How is it any different to overprice your goods than to steal a few coin from an unsuspecting customer? Such are the ways of the Coalition of Tradefolke. Be careful if you ever deal with them.", "", 2508521854, 2690377311, Spawn)
	elseif choice == 5 then
        PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_arcanescientists/ft/eco/evil/darkelf_female_eco_evil_arcanescientists_hail_gf_1035b801.mp3", "The Dismal Rage is such a group of pure evil, that how can they be trusted to heal anyone?", "", 3091455674, 3623617426, Spawn)
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


function waypoints(NPC)
	MovementLoopAddLocation(NPC, -44.22, 1, -0.39, 2, 1)
	MovementLoopAddLocation(NPC, -44.22, 1, -0.39, 2, MakeRandomInt(25,30),"EcologyEmotes")
	MovementLoopAddLocation(NPC, -44.06, 1, -1.28, 2, 0)
	MovementLoopAddLocation(NPC, -44.34, 1, -2.35, 2, 2,"Door1")
	MovementLoopAddLocation(NPC, -48.56, 0.81, -5.15, 2, 0)
	MovementLoopAddLocation(NPC, -51.3, 1.01, -4.17, 2, 0)
	MovementLoopAddLocation(NPC, -53.55, 1.99, 0.64, 2, 0)
	MovementLoopAddLocation(NPC, -54.26, 2.44, 5.22, 2, 0)
	MovementLoopAddLocation(NPC, -53.21, 3.05, 8.72, 2, 0)
	MovementLoopAddLocation(NPC, -52.57, 3.63, 11.07, 2, 0)
	MovementLoopAddLocation(NPC, -50.26, 4.14, 14.28, 2, 0)
	MovementLoopAddLocation(NPC, -41.84, 4.1, 18.42, 2, 0)
	MovementLoopAddLocation(NPC, -36.47, 4.53, 21.84, 2, 0)
	MovementLoopAddLocation(NPC, -29.25, 4.31, 24.32, 2, 0)
	MovementLoopAddLocation(NPC, -21.23, 4.3, 27.15, 2, 0)
	MovementLoopAddLocation(NPC, -21.17, 3.96, 30.7, 2, 0)
	MovementLoopAddLocation(NPC, -21.15, 4, 32.04, 2, 2,"Door2")
	MovementLoopAddLocation(NPC, -23.99, 4, 37.74, 2, 0)
	MovementLoopAddLocation(NPC, -24.17, 4, 40.44, 2, 0)
	MovementLoopAddLocation(NPC, -19.46, 4, 43.29, 2, 0)
	MovementLoopAddLocation(NPC, -12.22, 4, 46.06, 2, 1)
	MovementLoopAddLocation(NPC, -12.22, 4, 46.06, 2, 25,"EcologyEmotes")
	MovementLoopAddLocation(NPC, -20.54, 4, 41.69, 2, 0)
	MovementLoopAddLocation(NPC, -22.81, 4, 38.43, 2, 2,"Door2")
	MovementLoopAddLocation(NPC, -22.78, 4.01, 35.68, 2, 0)
	MovementLoopAddLocation(NPC, -20.31, 3.91, 30.83, 2, 0)
	MovementLoopAddLocation(NPC, -11.83, 3.32, 30.95, 2, 0)
	MovementLoopAddLocation(NPC, -6.17, 3, 31, 2, 0)
	MovementLoopAddLocation(NPC, 6.66, 2.87, 27.56, 2, 0)
	MovementLoopAddLocation(NPC, 14.67, 1.9, 24.62, 2, 0)
	MovementLoopAddLocation(NPC, 18.13, 1.79, 22.67, 2, 0)
	MovementLoopAddLocation(NPC, 22.44, 1.35, 17.12, 2, 0)
	MovementLoopAddLocation(NPC, 29.85, 0.31, 8.87, 2, 0)
	MovementLoopAddLocation(NPC, 34.97, -0.75, 1.44, 2, 0)
	MovementLoopAddLocation(NPC, 36.39, -1.3, -4.04, 2, 0)
	MovementLoopAddLocation(NPC, 36.48, -1.51, -9.05, 2, 0)
	MovementLoopAddLocation(NPC, 42.14, -1.27, -14.85, 2, 1)
	MovementLoopAddLocation(NPC, 42.14, -1.27, -14.85, 2, MakeRandomInt(25,30),"EcologyEmotes")
	MovementLoopAddLocation(NPC, 37.2, -1.3, -18.3, 2, 0)
	MovementLoopAddLocation(NPC, 33.89, -1.29, -20.77, 2, 0)
	MovementLoopAddLocation(NPC, 26.43, -1.19, -20.8, 2, 0)
	MovementLoopAddLocation(NPC, 20.59, -0.2, -19.19, 2, 0)
	MovementLoopAddLocation(NPC, 13.55, 0, -15.88, 2, 0)
	MovementLoopAddLocation(NPC, 9.36, 0, -13.9, 2, 0)
	MovementLoopAddLocation(NPC, 9.39, 0, -11.18, 2, 0)
	MovementLoopAddLocation(NPC, 12.47, 0, -4.04, 2, 0)
	MovementLoopAddLocation(NPC, 12.78, 0, -0.4, 2, 0)
	MovementLoopAddLocation(NPC, 10.65, 0, 5.22, 2, 0)
	MovementLoopAddLocation(NPC, 8.38, 0, 7.67, 2, 0)
	MovementLoopAddLocation(NPC, 2.51, 0, 11.59, 2, 0)
	MovementLoopAddLocation(NPC, -1.75, 0, 12.13, 2, 0)
	MovementLoopAddLocation(NPC, -6.91, 0, 10.87, 2, 0)
	MovementLoopAddLocation(NPC, -18.25, 0, 11.78, 2, 1)
	MovementLoopAddLocation(NPC, -18.25, 0, 11.78, 2, MakeRandomInt(25,30),"EcologyEmotes")
	MovementLoopAddLocation(NPC, -18.25, 0, 11.78, 2, 0)
	MovementLoopAddLocation(NPC, -18.66, 0, 12.09, 2, 0)
	MovementLoopAddLocation(NPC, -18.05, 0, 12.41, 2, 0)
	MovementLoopAddLocation(NPC, -14.38, 0, 20.48, 2, 1)
	MovementLoopAddLocation(NPC, -14.38, 0, 20.48, 2, MakeRandomInt(25,30),"EcologyEmotes")
	MovementLoopAddLocation(NPC, -14.57, 0, 16.19, 2, 0)
	MovementLoopAddLocation(NPC, -15.15, 0, 9.49, 2, 0)
	MovementLoopAddLocation(NPC, -14.01, 0, -5.36, 2, 0)
	MovementLoopAddLocation(NPC, -13.29, 0, -8.95, 2, 0)
	MovementLoopAddLocation(NPC, -15.16, 0, -11.33, 2, 0)
	MovementLoopAddLocation(NPC, -22.21, 0.13, -15.23, 2, 0)
	MovementLoopAddLocation(NPC, -30, -0.05, -22.45, 2, 0)
	MovementLoopAddLocation(NPC, -33.47, -1.01, -26.42, 2, 0)
	MovementLoopAddLocation(NPC, -33.26, -1.66, -32.42, 2, 0)
	MovementLoopAddLocation(NPC, -33.34, -2.09, -34.52, 2, 0)
	MovementLoopAddLocation(NPC, -36.22, -1.91, -33.38, 2, 0)
	MovementLoopAddLocation(NPC, -39.4, -1.16, -31.41, 2, 0)
	MovementLoopAddLocation(NPC, -41.34, -0.64, -29.56, 2, 0)
	MovementLoopAddLocation(NPC, -43.39, -0.35, -27.33, 2, 0)
	MovementLoopAddLocation(NPC, -46.53, -0.93, -20.2, 2, 0)
	MovementLoopAddLocation(NPC, -48.51, 0.3, -10.26, 2, 0)
	MovementLoopAddLocation(NPC, -48.79, 0.73, -6.22, 2, 2,"Door1")
	MovementLoopAddLocation(NPC, -43.66, 1, -2.43, 2, 0)
end

function Door1(NPC,Spawn)
    local door = GetSpawn(NPC, 1380084)
    UseWidget(door)
end

function Door2(NPC,Spawn)
    local door = GetSpawn(NPC, 1380077)
    UseWidget(door)
end
