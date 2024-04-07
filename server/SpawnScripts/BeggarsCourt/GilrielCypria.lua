--[[
	Script Name		: SpawnScripts/BeggarsCourt/GilrielCypria.lua
	Script Purpose	: Gilriel Cypria
	Script Author	: Dorbin
	Script Date		: 2022.07.18
	Script Notes	: Auto-Generated Conversation from PacketParser Data
--]]


dofile("SpawnScripts/Generic/GenericEcologyVoiceOvers.lua")

local TimeCheck = false                                                       -- used to delay between hail uses
local CalloutTimeCheck = false                                                -- used to delay between callout uses

function spawn(NPC)
    SetPlayerProximityFunction(NPC, 7, "InRange", "LeaveRange")
end

function InRange(NPC, Spawn)
	if GetFactionAmount(Spawn,12) <0 then
     	FaceTarget(NPC, Spawn)
        FactionChecking(NPC, Spawn, faction)
    else       
        if MakeRandomInt(1, 100) <= 50 and CalloutTimeCheck == false then
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
local FP_ScoutFaction = GetFactionAmount(Spawn, 103)
	if FP_ScoutFaction >=10000 then
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
		PlayFlavor(NPC, "voiceover/english/human_eco_evil_seafurybuccaneers/ft/eco/evil/human_eco_evil_seafurybuccaneers_hail_gf_8d7c7902.mp3", "I'd rather be stranded overboard than be converted by the dark beliefs that Dismal Rage preaches.", "", 398195151, 3450382472, Spawn, 0)
	elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/human_eco_evil_seafurybuccaneers/ft/eco/evil/human_eco_evil_seafurybuccaneers_hail_gf_cf6319e5.mp3", "I don't trust the Freeport Militia. Neither should you, mate.", "", 841757214, 1711434021, Spawn, 0)
	elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/human_eco_evil_seafurybuccaneers/ft/eco/evil/human_eco_evil_seafurybuccaneers_hail_gf_a6172442.mp3", "You might as well hand your loot to the Coalition of Tradesfolke if you ever decide to work for them.", "", 3500427050, 3119081965, Spawn, 0)
	elseif choice == 4 then
		PlayFlavor(NPC, "voiceover/english/human_eco_evil_seafurybuccaneers/ft/eco/evil/human_eco_evil_seafurybuccaneers_hail_gf_1606a6dc.mp3", "It's weak to rely on magic for everything. If ye have the same weakness, the Academy of Arcane Sciences is for you.", "", 582247664, 3802790481, Spawn, 0)
	elseif choice == 5 then
		PlayFlavor(NPC, "voiceover/english/human_eco_evil_seafurybuccaneers/ft/eco/evil/human_eco_evil_seafurybuccaneers_hail_gf_b1479083.mp3", "The Seafury Buccaneers are feared by all others on the open sea. They show no mercy to the dogs that try to sail the sea unprotected.", "", 1087502675, 64319081, Spawn, 0)
	end
end

function FactionTalk(NPC,Spawn)
local FP_ScoutFaction = GetFactionAmount(Spawn,  103)
	    if FP_ScoutFaction >=40000 then
    	FaceTarget(NPC, Spawn)
        PlayFlavor(NPC, "voiceover/english/human_eco_evil_seafurybuccaneers/ft/eco/evil/human_eco_evil_seafurybuccaneers_40_gf_844f23c4.mp3", "You're no longer just a Seafury Buccaneer with us, matey. If port space weren't such a problem, we'd let you captain your own ship.", "", 2955148126, 830655827, Spawn)
	    elseif FP_ScoutFaction >=30000 then
	    FaceTarget(NPC, Spawn)
        PlayFlavor(NPC, "voiceover/english/human_eco_evil_seafurybuccaneers/ft/eco/evil/human_eco_evil_seafurybuccaneers_30_gf_e6790307.mp3", "Avast ye! I just wanted to thank you for the plunder you bring to the Seafury Buccaneers.", "", 2403558940, 3041491321, Spawn)
	    elseif FP_ScoutFaction >=20000 then
	    FaceTarget(NPC, Spawn)
        PlayFlavor(NPC, "voiceover/english/human_eco_evil_seafurybuccaneers/ft/eco/evil/human_eco_evil_seafurybuccaneers_20_gf_e6790307.mp3", "A landlubber be interested in working for the Seafury Buccaneers? I'm not saying it's impossible, but I'll keep steady eyes on you, mate.", "", 2403558940, 3041491321, Spawn)
	    elseif FP_ScoutFaction >=10000 then
	    FaceTarget(NPC, Spawn)
        PlayFlavor(NPC, "voiceover/english/human_eco_evil_seafurybuccaneers/ft/eco/evil/human_eco_evil_seafurybuccaneers_10_gf_e6790307.mp3", "The Seafury Buccaneers demand the most out of thier crew. Are you up to the task?", "", 2403558940, 3041491321, Spawn)
	    end
end

