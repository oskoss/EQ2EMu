--[[
    Script Name    : SpawnScripts/QeynosCitizenshipTrialChamber/TavithiNsari.lua
    Script Author  : Dorbin
    Script Date    : 2022.08.31 06:08:32
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/DialogModule"
require "SpawnScripts/Generic/CombatModule"

local BQCitizen = 5718
local CVQCitizen = 5719
local GQCitizen = 5720
local NQCitizen = 5721
local SCQCitizen = 5722
local WWQCitizen = 5723


function spawn(NPC, Spawn)
    combatModule(NPC, Spawn)
SetPlayerProximityFunction(NPC, 7, "InRange", "LeaveRange")
    SpawnSet(NPC,"model_type",79)
    SpawnSet(NPC,"soga_model_type",4973)
    SetTempVariable(NPC,"HailTimer",nil)
end

function InRange(NPC, Spawn)
if not IsInCombat(NPC) and GetTempVariable(NPC,"HailTimer")~="1" then
PlayFlavor(NPC, "","No!  Please don't hurt me!", "cringe", 0,0, Spawn)
end
end

function hailed(NPC, Spawn)
if GetTempVariable(NPC,"HailTimer")~="1" then
Dialog1(NPC, Spawn)
end
end

function respawn(NPC)
	spawn(NPC)
end

function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I swear, I didn't do anything!  The guards pulled me from my home and beat me!  I just want to go home!")
	Dialog.AddVoiceover("voiceover/english/tavithi_n_sari/qey_catacomb_epic01/tavithinsari000.mp3", 4098142648, 4182661778)
    PlayFlavor(NPC,"","","no",0,0,Spawn)
	Dialog.AddOption("Wait a minute... they beat you?", "Dialog2")
	Dialog.AddOption("You're saying you don't belong down here?", "Dialog2")
	Dialog.Start()
end

function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Yes!  You must believe me!  I was minding my own business, when they came for me!  I wasn't even near the Ironforge Estate!")
	Dialog.AddVoiceover("voiceover/english/tavithi_n_sari/qey_catacomb_epic01/tavithinsari001.mp3", 3040294218, 711712198)
    PlayFlavor(NPC,"","","agree",0,0,Spawn)
	Dialog.AddOption("Well for that, I'm sorry you had to endure it.  Wait here until I've made my decision.")
	Dialog.AddOption("Err, who said anything about the Ironforges?", "Dialog3")
	Dialog.Start()
end

function Dialog3(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("You did!  Just a second ago, don't you remember?")
	Dialog.AddVoiceover("voiceover/english/tavithi_n_sari/qey_catacomb_epic01/tavithinsari002.mp3", 2424577779, 2139550412)
    PlayFlavor(NPC,"","","stare",0,0,Spawn)
	Dialog.AddOption("Did I?  It must have slipped my mind.")
	Dialog.AddOption("I never said anything of the sort.", "Dialog4")
	Dialog.Start()
end

function Dialog4(NPC, Spawn)
    SetTempVariable(NPC,"HailTimer",1)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("You fool!  You should've let me go when you had the chance!  Prepare to be a stain on the floor of Innoruuk's realm!")
	Dialog.AddVoiceover("voiceover/english/tavithi_n_sari/qey_catacomb_epic01/tavithinsari003.mp3", 3211336740, 2450849190)
    PlayFlavor(NPC,"","","cackle",0,0,Spawn)
    SpawnSet(NPC,"mood_state",11852)
    AddTimer(NPC,4000,"Shimmer",1,Spawn)
    AddTimer(NPC,6000,"Poof",1,Spawn)
    AddTimer(NPC,8700,"AttackTimer",1,Spawn)
    AddTimer(NPC,9100,"Poof2",1,Spawn)
	Dialog.AddOption("...","Continue")
	Dialog.Start()
end

function Continue(NPC,Spawn)
end

function Shimmer(NPC,Spawn)
    PlayFlavor(NPC,"","","result_teleport_sparkle",0,0)

end

function Poof(NPC,Spawn)
    PlayFlavor(NPC,"","","result_teleport_appear",0,0)
end

function Poof2(NPC,Spawn)
    PlayFlavor(NPC,"","","result_dispell1_out",0,0)
end

function AttackTimer(NPC,Spawn)
    CloseConversation(NPC,Spawn)
    SpawnSet(NPC,"model_type",116)
    SpawnSet(NPC,"soga_model_type",4965)
    SpawnSet(NPC,"attackable",1)
    SpawnSet(NPC,"show_level",1)
    AddPrimaryEntityCommand(Spawn,NPC,"",0,"")
    AddPrimaryEntityCommand(Spawn,NPC,"attack",10000,"attack")
    SendUpdateDefaultCommand(NPC,10000,"attack")
    AddTimer(NPC,1200,"Attacking",1,Spawn)
end


function Attacking(NPC,Spawn)
    Attack(NPC,Spawn)
end

function aggro(NPC,Spawn)
    SpawnSet(NPC,"attackable",1)
    SpawnSet(NPC,"show_level",1)
    SpawnSet(NPC,"command_primary","11")
    
end

function death(NPC,Spawn)
local Mole = GetSpawn(NPC,8250011) 
local Refu = GetSpawn(NPC,8250012) 
local Part = GetSpawn(NPC,8250013) 
local Tavi = GetSpawn(NPC,8250014) 
if not HasLanguage(Spawn,2) then
	  PlayFlavor(NPC, "voiceover/english/optional3/darkelf_base_2/ft/darkelf/darkelf_base_2_1_garbled_gf_810a3ce3.mp3", "Dark in body and soul! Hah!", "", 1604363761, 647045676, Spawn, 2)
end   

    
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