--[[
	Script Name		: SpawnScripts/LongshadowAlley/NezzkaSTai.lua
	Script Purpose	: Nezzka S`Tai
	Script Author	: torsten
	Script Date		: 2022.07.20
	Script Notes	: Auto-Generated Conversation from PacketParser Data
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



function waypoints(NPC)
	MovementLoopAddLocation(NPC, -17.58, 4, 48.42, 2, 0)
	MovementLoopAddLocation(NPC, -19.27, 4, 51.76, 2, 1)
	MovementLoopAddLocation(NPC, -19.27, 4, 51.76, 2, MakeRandomInt(25,30),"EcologyEmotes")
	MovementLoopAddLocation(NPC, -17.97, 4, 50.82, 2, 0)
	MovementLoopAddLocation(NPC, -16.6, 4, 47.44, 2, 0)
	MovementLoopAddLocation(NPC, -16.5, 4, 45.05, 2, 0)
	MovementLoopAddLocation(NPC, -20.18, 4, 42.36, 2, 0)
	MovementLoopAddLocation(NPC, -23.89, 4, 37.68, 2, 2,"Door1")
	MovementLoopAddLocation(NPC, -20.86, 4, 32.15, 2, 0)
	MovementLoopAddLocation(NPC, -19.16, 3.85, 30.42, 2, 0)
	MovementLoopAddLocation(NPC, -10.69, 3.32, 30.94, 2, 0)
	MovementLoopAddLocation(NPC, -4.73, 2.98, 31.6, 2, 0)
	MovementLoopAddLocation(NPC, 7.51, 2.82, 27.83, 2, 0)
	MovementLoopAddLocation(NPC, 10.64, 2.37, 26.7, 2, 0)
	MovementLoopAddLocation(NPC, 21.69, 2, 25.67, 2, 1)
	MovementLoopAddLocation(NPC, 21.69, 2, 25.67, 2, 25)
	MovementLoopAddLocation(NPC, 19.78, 1.94, 24.69, 2, 0)
	MovementLoopAddLocation(NPC, 14.65, 1.93, 21.71, 2, 0)
	MovementLoopAddLocation(NPC, 12.3, 1.61, 18.97, 2, 0)
	MovementLoopAddLocation(NPC, 8.98, 0.21, 13.52, 2, 0)
	MovementLoopAddLocation(NPC, 7.78, 0, 11.63, 2, 0)
	MovementLoopAddLocation(NPC, 8.94, 0, 9.95, 2, 0)
	MovementLoopAddLocation(NPC, 9.91, 0, 4.58, 2, 0)
	MovementLoopAddLocation(NPC, 9.9, 0, -0.06, 2, 0)
	MovementLoopAddLocation(NPC, 7.86, 0, -6.42, 2, 0)
	MovementLoopAddLocation(NPC, 5.81, 0, -9.03, 2, 0)
	MovementLoopAddLocation(NPC, 4.98, 0.04, -17.83, 2, 0)
	MovementLoopAddLocation(NPC, 4.77, 0, -19.96, 2, 0)
	MovementLoopAddLocation(NPC, 1.62, 0.01, -23.17, 2, 2,"Door2")
	MovementLoopAddLocation(NPC, 1.35, 0.07, -26.6, 2, 0)
	MovementLoopAddLocation(NPC, 1.87, 0, -29.56, 2, 0)
	MovementLoopAddLocation(NPC, 2.75, 0.5, -34.66, 2, 1)
	MovementLoopAddLocation(NPC, 2.75, 0.5, -34.66, 2, MakeRandomInt(25,30),"EcologyEmotes")
	MovementLoopAddLocation(NPC, 2.75, 0.5, -34.66, 2, MakeRandomInt(25,30),"EcologyEmotes")
	MovementLoopAddLocation(NPC, 1.97, 0.5, -33.56, 2, 0)
	MovementLoopAddLocation(NPC, 1.91, 0, -28.8, 2, 2,"Door2")
	MovementLoopAddLocation(NPC, 1.1, 0.02, -23.2, 2, 0)
	MovementLoopAddLocation(NPC, 1.44, 0, -20.46, 2, 0)
	MovementLoopAddLocation(NPC, -0.15, 0, -13.64, 2, 0)
	MovementLoopAddLocation(NPC, -5.55, 0.06, -9.1, 2, 0)
	MovementLoopAddLocation(NPC, -9.98, 0, -2.89, 2, 0)
	MovementLoopAddLocation(NPC, -12.2, 0, 3.45, 2, 0)
	MovementLoopAddLocation(NPC, -9.07, 0, 8.46, 2, 0)
	MovementLoopAddLocation(NPC, -6.32, 0, 9.62, 2, 0)
	MovementLoopAddLocation(NPC, 2.27, 0, 16.46, 2, 1)
	MovementLoopAddLocation(NPC, 2.27, 0, 16.46, 2, MakeRandomInt(25,30),"EcologyEmotes")
	MovementLoopAddLocation(NPC, 2.78, 0, 14.67, 2, 0)
	MovementLoopAddLocation(NPC, 7.04, 0, 11.89, 2, 0)
	MovementLoopAddLocation(NPC, 8.92, 0, 12.92, 2, 0)
	MovementLoopAddLocation(NPC, 12, 1.29, 17.65, 2, 0)
	MovementLoopAddLocation(NPC, 16, 1.89, 22.81, 2, 0)
	MovementLoopAddLocation(NPC, 18.33, 2, 26.69, 2, 2,"Door3")
	MovementLoopAddLocation(NPC, 21.06, 2, 31.22, 2, 0)
	MovementLoopAddLocation(NPC, 20.32, 2, 35.2, 2, 0)
	MovementLoopAddLocation(NPC, 23, 2, 39.13, 2, 0)
	MovementLoopAddLocation(NPC, 31.78, 2, 41.93, 2, 1)
	MovementLoopAddLocation(NPC, 31.78, 2, 41.93, 2,  MakeRandomInt(45,50),"EcologyEmotes")
	MovementLoopAddLocation(NPC, 28.44, 2, 40.49, 2, 0)
	MovementLoopAddLocation(NPC, 22.3, 2.01, 37.85, 2, 0)
	MovementLoopAddLocation(NPC, 20.22, 2, 35.71, 2, 0)
	MovementLoopAddLocation(NPC, 20.85, 2, 31.38, 2, 2,"Door3")
	MovementLoopAddLocation(NPC, 17.58, 1.95, 25.93, 2, 0)
	MovementLoopAddLocation(NPC, 10.41, 2.44, 28.9, 2, 0)
	MovementLoopAddLocation(NPC, -4.01, 2.98, 33.42, 2, 0)
	MovementLoopAddLocation(NPC, -11.76, 3.31, 33.18, 2, 0)
	MovementLoopAddLocation(NPC, -18.85, 3.88, 31.26, 2, 0)
	MovementLoopAddLocation(NPC, -20.07, 3.99, 31.85, 2, 2,"Door1")
	MovementLoopAddLocation(NPC, -24.17, 4, 37.47, 2, 0)
	MovementLoopAddLocation(NPC, -23.56, 4, 38.14, 2, 0)
	MovementLoopAddLocation(NPC, -19.03, 4, 40.77, 2, 0)
	MovementLoopAddLocation(NPC, -15.73, 4, 43.98, 2, 0)
end




function Door1(NPC,Spawn)
    local door = GetSpawn(NPC, 1380077)
    UseWidget(door)
end

function Door2(NPC,Spawn)
    local door = GetSpawn(NPC, 1380085)
    UseWidget(door)
end

function Door3(NPC,Spawn)
    local door = GetSpawn(NPC, 1380075)
    UseWidget(door)
end
