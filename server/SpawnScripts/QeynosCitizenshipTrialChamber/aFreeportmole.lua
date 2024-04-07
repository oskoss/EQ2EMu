--[[
    Script Name    : SpawnScripts/QeynosCitizenshipTrialChamber/aFreeportmole.lua
    Script Author  : Dorbin
    Script Date    : 2022.08.31 03:08:06
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/CombatModule"
local BQCitizen = 5718
local CVQCitizen = 5719
local GQCitizen = 5720
local NQCitizen = 5721
local SCQCitizen = 5722
local WWQCitizen = 5723

function spawn(NPC, Spawn)
    combatModule(NPC, Spawn)
    local Level = GetLevel(NPC)
    local level1 = 5
    local level2 = 6
    local difficulty1 = 6
    local hp1 = 130
    local power1 = 65
    local difficulty2 = 6
    local hp2 = 150
    local power2 = 80
    if Level == level1 then
    SpawnSet(NPC, "difficulty", difficulty1)
    SpawnSet(NPC, "hp", hp1)
    SpawnSet(NPC, "power", power1)
    elseif Level == level2
        then
    SpawnSet(NPC, "difficulty", difficulty2)
    SpawnSet(NPC, "hp", hp2)
    SpawnSet(NPC, "power", power2)
    end
    
waypoints(NPC)
end

function hailed(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function aggro(NPC,Spawn)
if GetGender(NPC)== 2 then 
    choice = MakeRandomInt(1,2)
    if choice ==1 then
    PlayFlavor(NPC, "voiceover/english/halfelf_eco_evil_1/ft/halfelf/halfelf_eco_evil_1_hail_gf_e88fad9f.mp3", "Whoa!!!  I don't remember saying I wanted to talk to you!", "", 3869016622, 3073089976, Spawn)
    else
   	PlayFlavor(NPC, "", "I'll take you down just like that last knight!", "", 0, 0, Spawn, 0)
    end
else
    choice = MakeRandomInt(1,2)
    if choice ==1 then
   	PlayFlavor(NPC, "voiceover/english/halfelf_eco_evil_1/ft/halfelf/halfelf_eco_evil_1_hail_gm_7344f21b.mp3", "I'm in the mood to kick someone in the teeth.", "kick", 620861878, 995351111, Spawn, 0)
    else
   	PlayFlavor(NPC, "", "I'll take you down just like that last knight!", "", 0, 0, Spawn, 0)
    end
end
end

function death(NPC,Spawn)
local Mole = GetSpawn(NPC,8250011) 
local Refu = GetSpawn(NPC,8250012) 
local Part = GetSpawn(NPC,8250013) 
local Tavi = GetSpawn(NPC,8250014) 
    
    if Mole == nil or not IsAlive(Mole) then
        if Refu == nil or not IsAlive(Refu) then
            if Part == nil or not IsAlive(Part) then
                if Tavi == nil or not IsAlive(Tavi) then
            if HasQuest(Spawn,BQCitizen) then
	        SetStepComplete(Spawn,BQCitizen,4)
	        elseif HasQuest(Spawn,CVQCitizen) then
 	        SetStepComplete(Spawn,CVQCitizen,4)
	        elseif HasQuest(Spawn,GQCitizen) then
 	        SetStepComplete(Spawn,GQCitizen,4)
	        elseif HasQuest(Spawn,NQCitizen) then
 	        SetStepComplete(Spawn,NQCitizen,4)
	        elseif HasQuest(Spawn,SCQCitizen) then
 	        SetStepComplete(Spawn,SCQCitizen,4)
	        elseif HasQuest(Spawn,WWQCitizen) then
    	    SetStepComplete(Spawn,WWQCitizen,4)
 	        end 

    end
    end
    end
    end
        if GetGender(NPC)== 2 then 
        PlayFlavor(NPC, "voiceover/english/optional3/halfelf_base_1/ft/halfelf/halfelf_base_1_1_death_gf_610c650e.mp3", "You must flee!  I'll try to hold them.", "", 1612338229, 10301262, Spawn, 0)
        else
	    PlayFlavor(NPC, "voiceover/english/halfelf_base_1/ft/halfelf/halfelf_base_1_1_death_gm_610c650e.mp3", "You must flee!  I'll try to hold them.", "", 3580386891, 3023137994, Spawn, 0)
        end 
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, -5.55, -0.39, -9.49, 2, 8)
	MovementLoopAddLocation(NPC, -5.62, -0.39, 0.64, 2, 6)
	MovementLoopAddLocation(NPC, -2.9, -0.39, 0.77, 2, 8)
	MovementLoopAddLocation(NPC, -5.26, -0.39, -7.92, 2, 8)
	MovementLoopAddLocation(NPC, -2.84, -0.39, 2.12, 2, 6)
	MovementLoopAddLocation(NPC, -4.8, -0.39, 4.41, 2, 5)
end


function FailureExit(NPC,Spawn)
        if GetRace(Spawn)== 7 or GetRace(Spawn)== 5 then
      BBShire = GetZone("Baubbleshire")
       Zone(BBShire,Spawn,819.46, -20.60, -525.61, 200.47)
       
    elseif GetRace(Spawn)== 0 or GetRace(Spawn)== 2 then
        Gray = GetZone("graystone")
        Zone(Gray,Spawn,865.03, -25.45, -97.91, 357.68)
        
    elseif GetRace(Spawn)== 4 or GetRace(Spawn)== 8 then
        CV = GetZone("castleview")
        Zone(CV,Spawn,729.01, -21.10, -124.36, 290.81)
        
    elseif GetRace(Spawn)== 9 or GetRace(Spawn)== 11 then
        Net = GetZone("nettleville")
        Zone(Net,Spawn,670.07, -20.39, 273.85, 114.78)
        
    elseif GetRace(Spawn)== 3 or GetRace(Spawn)== 8 then
        SC = GetZone("starcrest")
        Zone(SC,Spawn,704.07, -20.38, 264.40, 269.84)
        
    elseif GetRace(Spawn)== 15 or GetRace(Spawn)== 16 or GetRace(Spawn)== 6 then
        WW = GetZone("willowwood")
        Zone(WW,Spawn,809.96, -21.30, -566.02, 323.13)
        
    else
        Net = GetZone("nettleville")
        Zone(Net,Spawn,670.07, -20.39, 273.85, 114.78)
    end
end

function victory(NPC,Spawn)
    AddTimer(NPC,2500,"FailureExit",1,Spawn)
end    