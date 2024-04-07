--[[
	Script Name	: SpawnScripts/Longshadow/VorsharLFaz.lua
	Script Purpose	: Vorshar L`Faz 
	Script Author	: Dorbin
	Script Date	: 2022.10.13
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
local FP_CrafterFaction = GetFactionAmount(Spawn, 101)
    if FP_CrafterFaction >=10000 then
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
		PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_coalitionoftradesfolke/ft/eco/evil/darkelf_male_eco_evil_coalitionoftradesfolke_hail_gm_a8fbb723.mp3", "The arcane scientists hone their minds through the study of arcane arts, but they will never become as cunning as a skilled trader.", "", 4254147398, 134359674, Spawn)
	elseif choice == 2 then
		PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_coalitionoftradesfolke/ft/eco/evil/darkelf_male_eco_evil_coalitionoftradesfolke_hail_gm_cd3a748b.mp3", "The withering hands of the Dismal Rage priests look more like hands of death than hands that can heal people.", "", 2122145851, 2411357575, Spawn)
	elseif choice == 3 then
		PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_coalitionoftradesfolke/ft/eco/evil/darkelf_male_eco_evil_coalitionoftradesfolke_hail_gm_263a8bb0.mp3", "Although they serve to protect the city, the individuals of the Freeport Militia are only loyal to their own self interest and nothing more.", "", 3104017481, 741752503, Spawn)
	elseif choice == 4 then
        PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_coalitionoftradesfolke/ft/eco/evil/darkelf_male_eco_evil_coalitionoftradesfolke_hail_gm_8702506b.mp3", "Those Seafury Buccaneers wouldn't know what a fair deal was if it hit them on the head.", "", 3039159838, 1799277697, Spawn)
	elseif choice == 5 then
        PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_coalitionoftradesfolke/ft/eco/evil/darkelf_male_eco_evil_coalitionoftradesfolke_hail_gm_73c8a151.mp3", "There's nothing that the Coalition of Tradesfolke can't make a profit out of.", "", 1077955965, 3866305338, Spawn)
    end
end

function FactionTalk(NPC,Spawn)
local FP_CrafterFaction = GetFactionAmount(Spawn, 101)
	    if FP_CrafterFaction >=40000 then
    	FaceTarget(NPC, Spawn)
        PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_coalitionoftradesfolke/ft/eco/evil/darkelf_male_eco_evil_coalitionoftradesfolke_40_gm_3397b8bb.mp3", "The Coalition is fortunate to have your dedication! The sway you wield with them is worthy of awe!", "cheer", 0, 0, Spawn)
	    elseif FP_CrafterFaction >=30000 then
	    FaceTarget(NPC, Spawn)
        PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_coalitionoftradesfolke/ft/eco/evil/darkelf_male_eco_evil_coalitionoftradesfolke_30_gm_deefc882.mp3", "You have achieved quite a reputation for your work with the Coalition.", "", 0, 0, Spawn)
	    elseif FP_CrafterFaction >=20000 then
	    FaceTarget(NPC, Spawn)
        PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_coalitionoftradesfolke/ft/eco/evil/darkelf_male_eco_evil_coalitionoftradesfolke_20_gm_376317f5.mp3", "Although you still have quite a distance to go, the reputation you have managed to achieve is nevertheless impressive.", "", 2535649617, 1724444157, Spawn)
	    elseif FP_CrafterFaction >=10000 then
	    FaceTarget(NPC, Spawn)
        PlayFlavor(NPC, "voiceover/english/darkelf_eco_evil_coalitionoftradesfolke/ft/eco/evil/darkelf_male_eco_evil_coalitionoftradesfolke_10_gm_bda4135a.mp3", "Are you willing to sacrifice yourself for the glory of Freeport, and the profit of the Coalition? Are you willing to endure days locked within a leaky cellar, your fingers bleeding as you work the loom and the forge?", "", 0, 0, Spawn)
	    end
end



function Drink(NPC)
        PlayFlavor(NPC,"","","drinking_idle",0,0)
    AddTimer(NPC,8000, "Drink2")
end

function Drink2(NPC)
  choice = math.random(1,4)   
        if choice == 1 then    
        PlayFlavor(NPC,"","","snicker",0,0)
        elseif choice == 2 then    
        PlayFlavor(NPC,"","","drinking_idle",0,0)
        elseif choice == 3 then    
        PlayFlavor(NPC,"","","sniff",0,0)
        else
        PlayFlavor(NPC,"","","grumble",0,0)
        end            
    AddTimer(NPC,6000, "Drink3")
end

function Drink3(NPC)
        PlayFlavor(NPC,"","","drinking_idle",0,0)
end

function Door1(NPC,Spawn)
    local door = GetSpawn(NPC, 1380077)
    UseWidget(door)
end

function Door2(NPC,Spawn)
    local door = GetSpawn(NPC, 1380084)
    UseWidget(door)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, -10.65, 0, -9.32, 2, 0)
	MovementLoopAddLocation(NPC, -7.19, 0.09, -12.52, 2, 0)
	MovementLoopAddLocation(NPC, -1.44, 0, -16.95, 2, 0)
	MovementLoopAddLocation(NPC, -0.84, 0, -18.25, 2, 0)
	MovementLoopAddLocation(NPC, -1.73, 0, -19.28, 2, 0)
	MovementLoopAddLocation(NPC, -1.73, 0, -19.28, 2, 1)
	MovementLoopAddLocation(NPC, -1.73, 0, -19.28, 2, 18,"Drink")
	MovementLoopAddLocation(NPC, -1.73, 0, -19.28, 2, 18,"Drink")
	MovementLoopAddLocation(NPC, -1.73, 0, -19.28, 2, 0)
	MovementLoopAddLocation(NPC, 2.18, 0, -17.5, 2, 0)
	MovementLoopAddLocation(NPC, 5.2, 0.03, -16.12, 2, 0)
	MovementLoopAddLocation(NPC, 13.75, 0, -19.66, 2, 0)
	MovementLoopAddLocation(NPC, 28, -1.32, -24.03, 2, 0)
	MovementLoopAddLocation(NPC, 35.28, -1.46, -22.63, 2, 0)
	MovementLoopAddLocation(NPC, 37.88, -1.43, -21.25, 2, 0)
	MovementLoopAddLocation(NPC, 40.77, -1.32, -16.38, 2, 0)
	MovementLoopAddLocation(NPC, 41.3, -1.34, -3.85, 2, 0)
	MovementLoopAddLocation(NPC, 37.27, -0.32, 6.42, 2, 0)
	MovementLoopAddLocation(NPC, 31.13, 0.32, 12.03, 2, 0)
	MovementLoopAddLocation(NPC, 23.18, 1.41, 20.19, 2, 0)
	MovementLoopAddLocation(NPC, 18.47, 1.9, 24.94, 2, 0)
	MovementLoopAddLocation(NPC, 11.31, 2.41, 29.18, 2, 0)
	MovementLoopAddLocation(NPC, 4.64, 2.9, 31.72, 2, 0)
	MovementLoopAddLocation(NPC, 4.93, 3, 34.11, 2, 0)
	MovementLoopAddLocation(NPC, 9.25, 3, 43.84, 2, 0)
	MovementLoopAddLocation(NPC, 11.17, 3, 49.16, 2, 0)
	MovementLoopAddLocation(NPC, 11.38, 3, 53.33, 2, 1)
	MovementLoopAddLocation(NPC, 11.38, 3, 53.33, 2, MakeRandomInt(25,30),"EcologyEmotes")
	MovementLoopAddLocation(NPC, 11.38, 3, 53.33, 2, 0)
	MovementLoopAddLocation(NPC, 7.16, 3, 47.68, 2, 0)
	MovementLoopAddLocation(NPC, 4.02, 3, 39.33, 2, 0)
	MovementLoopAddLocation(NPC, 1.67, 2.98, 33.35, 2, 0)
	MovementLoopAddLocation(NPC, 1.18, 2.93, 32.35, 2, 0)
	MovementLoopAddLocation(NPC, -9.52, 3, 33.59, 2, 0)
	MovementLoopAddLocation(NPC, -15.36, 3.43, 31.98, 2, 0)
	MovementLoopAddLocation(NPC, -18.91, 3.88, 31.15, 2, 0)
	MovementLoopAddLocation(NPC, -20.14, 3.99, 31.98, 2, 0)
	MovementLoopAddLocation(NPC, -20.14, 3.99, 31.98, 2, 2,"Door1")
	MovementLoopAddLocation(NPC, -24.03, 4, 36.84, 2, 0)
	MovementLoopAddLocation(NPC, -29.12, 4, 35.32, 2, 0)
	MovementLoopAddLocation(NPC, -35.21, 4, 32.81, 2, 1)
	MovementLoopAddLocation(NPC, -35.21, 4, 32.81, 2, MakeRandomInt(25,30),"EcologyEmotes")
	MovementLoopAddLocation(NPC, -35.21, 4, 32.81, 2, 1)
	MovementLoopAddLocation(NPC, -34.91, 4, 33.43, 2, 0)
	MovementLoopAddLocation(NPC, -31.54, 4, 34.83, 2, 0)
	MovementLoopAddLocation(NPC, -24.33, 4, 37.72, 2, 2,"Door1")
	MovementLoopAddLocation(NPC, -24.33, 4, 37.72, 2, 0)
	MovementLoopAddLocation(NPC, -20.52, 3.95, 31.12, 2, 0)
	MovementLoopAddLocation(NPC, -27.94, 4.25, 27.43, 2, 0)
	MovementLoopAddLocation(NPC, -35.69, 4.51, 23.89, 2, 0)
	MovementLoopAddLocation(NPC, -45.88, 4.1, 18.89, 2, 0)
	MovementLoopAddLocation(NPC, -53.58, 3.75, 14.19, 2, 0)
	MovementLoopAddLocation(NPC, -56.52, 2.58, 5.12, 2, 0)
	MovementLoopAddLocation(NPC, -55.84, 2.12, 1.23, 2, 0)
	MovementLoopAddLocation(NPC, -51.88, 0.68, -6.22, 2, 0)
	MovementLoopAddLocation(NPC, -47.93, 0.85, -4.43, 2, 2,"Door2")
	MovementLoopAddLocation(NPC, -43.72, 1, -3.25, 2, 0)
	MovementLoopAddLocation(NPC, -37.99, 1.5, -1.96, 2, 1)
	MovementLoopAddLocation(NPC, -37.99, 1.5, -1.96, 2, MakeRandomInt(25,30),"EcologyEmotes")
	MovementLoopAddLocation(NPC, -40.66, 1.5, -1.56, 2, 0)
	MovementLoopAddLocation(NPC, -44.48, 1, -2.92, 2, 2,"Door2")
	MovementLoopAddLocation(NPC, -48.64, 0.8, -5.06, 2, 0)
	MovementLoopAddLocation(NPC, -50.45, -0.08, -13.56, 2, 0)
	MovementLoopAddLocation(NPC, -46.5, -0.49, -14.88, 2, 0)
	MovementLoopAddLocation(NPC, -44.36, -0.03, -14.72, 2, 0)
	MovementLoopAddLocation(NPC, -42.12, 0, -13.19, 2, 0)
	MovementLoopAddLocation(NPC, -32.42, 0, -11.3, 2, 0)
	MovementLoopAddLocation(NPC, -27.14, 0, -9.15, 2, 0)
	MovementLoopAddLocation(NPC, -21.25, 0, -6.74, 2, 0)
	MovementLoopAddLocation(NPC, -17.43, 0, -4.78, 2, 0)
	MovementLoopAddLocation(NPC, -13.94, 0, -5.86, 2, 0)
end


