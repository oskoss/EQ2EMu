--[[
	Script Name		: SpawnScripts/BeggarsCourt/OctaviaJovina.lua
	Script Purpose	: Octavia Jovina
	Script Author	: Dorbin
	Script Date		: 2022.07.18
	Script Notes	: Auto-Generated Conversation from PacketParser Data
--]]
dofile("SpawnScripts/Generic/GenericEcologyVoiceOvers.lua")
local TimeCheck = false                                                       -- used to delay between hail uses
local CalloutTimeCheck = false                                                -- used to delay between callout uses

function spawn(NPC)
    waypoints(NPC)
    SetPlayerProximityFunction(NPC, 7, "InRange", "LeaveRange")
end

function respawn(NPC)
	spawn(NPC)
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
local FP_FighterFaction = GetFactionAmount(Spawn, 102)
	if FP_FighterFaction >=10000 then
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
		PlayFlavor(NPC, "voiceover/english/human_eco_evil_freeportmilitia/ft/eco/evil/human_eco_evil_freeportmilitia_hail_gf_6509ed3d.mp3", "The Arcane Scientists are just a cowardly bunch that can't stand getting their hands dirty.", "", 1024489319, 2331992073, Spawn, 0)
	elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/human_eco_evil_freeportmilitia/ft/eco/evil/human_eco_evil_freeportmilitia_hail_gf_f2eb775b.mp3", "There is no better collection of fearless warriors than the Freeport Militia.", "", 3315984902, 4037913760, Spawn, 0)
	elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/human_eco_evil_freeportmilitia/ft/eco/evil/human_eco_evil_freeportmilitia_hail_gf_d59d3347.mp3", "The Seafury Buccaneers can't be trusted. They will turn on you when you least expect it.", "", 1280576093, 2130150895, Spawn, 0)
	elseif choice == 4 then
		PlayFlavor(NPC, "voiceover/english/human_eco_evil_freeportmilitia/ft/eco/evil/human_eco_evil_freeportmilitia_hail_gf_c9e6b7a9.mp3", "The priests of Dismal Rage are better at running from battle than leading one.", "", 2396198417, 3099644701, Spawn, 0)
	elseif choice == 5 then
		PlayFlavor(NPC, "voiceover/english/human_eco_evil_freeportmilitia/ft/eco/evil/human_eco_evil_freeportmilitia_hail_gf_2972d442.mp3", "What does a thief and a trader from Coalition of Tradesfolke have in common? They both will strip you of your coins.", "", 1516863043, 2498897125, Spawn, 0)
	end
end

function FactionTalk(NPC,Spawn)
local FP_FighterFaction = GetFactionAmount(Spawn, 102)
	    if FP_MageFaction >=40000 then
    	FaceTarget(NPC, Spawn)
		PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_arcanescientists/ft/eco/evil/darkelf_female_eco_evil_arcanescientists_40_gf_c38c736.mp3", "To aid the Freeport Militia is to weild the blade of The Overlord! Bravo!", "cheer", 0, 0, Spawn)
	    elseif FP_MageFaction >=30000 then
	    FaceTarget(NPC, Spawn)
		PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_arcanescientists/ft/eco/evil/darkelf_female_eco_evil_arcanescientists_30_gf_130c3c71.mp3", "You have helped the Freeport Militia remain steadfast in these dark times.", "salute", 0, 0, Spawn)
	    elseif FP_MageFaction >=20000 then
	    FaceTarget(NPC, Spawn)
		PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_arcanescientists/ft/eco/evil/darkelf_female_eco_evil_arcanescientists_20_gf_7b836853.mp3", "Your actions have assisted the Freeport Militia, but there is more you can do to tighten its grip!", "", 0, 0, Spawn)
	    elseif FP_MageFaction >=10000 then
	    FaceTarget(NPC, Spawn)
        PlayFlavor(NPC, "voiceover/english/human_eco_evil_freeportmilitia/ft/eco/evil/human_eco_evil_freeportmilitia_10_gf_1236a75.mp3", "The Freeport Militia demands unconditional obedience among its ranks.", "", 70786309, 2889649459, Spawn)
	    end
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, 42.39, 3.5, 0.08, 2, 1)
	MovementLoopAddLocation(NPC, 42.39, 3.5, 0.08, 2, 15,"Action")
	MovementLoopAddLocation(NPC, 42.39, 3.5, 0.08, 2, 0)
	MovementLoopAddLocation(NPC, 40.65, 3.5, 0.51, 2, 0)
	MovementLoopAddLocation(NPC, 39.35, 3.5, -2.47, 2, 0)
	MovementLoopAddLocation(NPC, 37.65, 3.75, -4.75, 2, 0)
	MovementLoopAddLocation(NPC, 35.29, 5.25, -11.22, 2, 0)
	MovementLoopAddLocation(NPC, 33.69, 5.25, -17.74, 2, 1)
	MovementLoopAddLocation(NPC, 33.69, 5.25, -17.74, 2, 15,"Action")
	MovementLoopAddLocation(NPC, 34.46, 5.25, -16.87, 2, 0)
	MovementLoopAddLocation(NPC, 36.85, 5.25, -17.99, 2, 0)
	MovementLoopAddLocation(NPC, 37.56, 5.25, -18.94, 2, 0)
	MovementLoopAddLocation(NPC, 36.84, 5.25, -19.89, 2, 0)
	MovementLoopAddLocation(NPC, 34, 6.65, -21.18, 2, 0)
	MovementLoopAddLocation(NPC, 29.59, 9.12, -23.44, 2, 0)
	MovementLoopAddLocation(NPC, 26.83, 9.46, -24.65, 2, 1)
	MovementLoopAddLocation(NPC, 26.83, 9.46, -24.65, 2, 35,"Action")
	MovementLoopAddLocation(NPC, 26.83, 9.46, -24.65, 2, 0)
	MovementLoopAddLocation(NPC, 27.74, 9.46, -24.83, 2, 0)
	MovementLoopAddLocation(NPC, 31.31, 8.58, -24.29, 2, 0)
	MovementLoopAddLocation(NPC, 34.24, 6.93, -23.07, 2, 0)
	MovementLoopAddLocation(NPC, 38.8, 5.25, -20.4, 2, 0)
	MovementLoopAddLocation(NPC, 40.73, 5.25, -16.68, 2, 1)
	MovementLoopAddLocation(NPC, 40.73, 5.25, -16.68, 2, 15,"Action")
	MovementLoopAddLocation(NPC, 36.63, 5.25, -10.9, 2, 0)
	MovementLoopAddLocation(NPC, 35.68, 4.75, -7.51, 2, 0)
	MovementLoopAddLocation(NPC, 36.8, 3.5, -1.57, 2, 0)
	MovementLoopAddLocation(NPC, 37.17, 3.5, -0.14, 2, 1)
	MovementLoopAddLocation(NPC, 37.17, 3.5, -0.14, 2, 15,"Action")
end

function Action(NPC)
    local choice = MakeRandomInt(1, 4)
    if choice == 1 then
        PlayFlavor(NPC, "", "", "confused", 0, 0, Spawn)
    elseif choice == 2 then
        PlayFlavor(NPC, "", "", "ponder", 0, 0, Spawn)
    elseif choice == 3 then
        PlayFlavor(NPC, "", "", "sniff", 0, 0, Spawn)
    elseif choice == 4 then
        PlayFlavor(NPC, "", "", "tapfoot", 0, 0, Spawn)
    end
end 
