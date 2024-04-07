--[[
    Script Name    : SpawnScripts/QeynosCitizenshipTrialChamber/adisgruntledrefugee.lua
    Script Author  : Dorbin
    Script Date    : 2022.08.31 06:08:19
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
    SetTempVariable(NPC,"HailTimer",nil)
end

function InRange(NPC, Spawn)
if not IsInCombat(NPC) and GetTempVariable(NPC,"HailTimer")==nil then
PlayFlavor(NPC, "","I'm so sorry... I didn't mean to do it!", "cry", 0,0, Spawn)
end
end


function hailed(NPC, Spawn)
if GetTempVariable(NPC,"HailTimer")==nil then
Dialog1(NPC, Spawn)
end
end

function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
    PlayFlavor(NPC,"","","wince",0,0,Spawn)
	Dialog.AddDialog("I promise I'll be better if you find it in your heart to spare me")
	Dialog.AddOption("Why would I do that?", "Dialog2")
	Dialog.AddOption("You must be punished for your crimes!", "AttackTimer")
	Dialog.Start()
end

function Dialog2(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I made one mistake ... I cast my lot with these scoundrels, and yet, I've regretted it ever since.  Can you not spare me?  I wish only to go back to my former life and make amends to the Ironforges.")
	Dialog.AddOption("Perhaps.  I need to think upon this further.")
	Dialog.AddOption("I'm listening...", "Dialog3")
	Dialog.AddOption("You must be punished for your crimes!", "AttackTimer")
	Dialog.AddOption("All traitors to Qeynos must die!", "AttackTimer")
	Dialog.Start()
end

function Dialog3(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I'll do anything!  I betrayed all who I loved by my actions, and I cannot bring myself to face the consequences.")
    PlayFlavor(NPC,"","","beg",0,0,Spawn)
	Dialog.AddOption("You will have to face those consequences... but you will not face death. Begone.","ThankYou")
	Dialog.AddOption("You can and will face the consequences.  For treason, this means death.", "AttackTimer")
	Dialog.Start()
end



function ThankYou(NPC,Spawn)
    SetTempVariable(NPC,"HailTimer",1)
    AddTimer(NPC,6400,"Runaway",1,Spawn)
    AddTimer(NPC,8000,"Sigh",1,Spawn)
    Update(NPC,Spawn)
    PlayFlavor(NPC,"","","notworthy",0,0,Spawn)
    CloseConversation(NPC,Spawn)
end 

function Sigh(NPC,Spawn)
    Update(NPC,Spawn)
    PlayFlavor(NPC,"","","sigh",0,0,Spawn)
end

function Runaway(NPC,Spawn)
    MovementLoopAddLocation(NPC, -3.64, -0.39, 2.39, 4,0,"Update")
  MovementLoopAddLocation(NPC, -1.83, -0.39, -8.21, 4,0,"Update")
  MovementLoopAddLocation(NPC, 16.44, -0.39, -9.29, 4,0,"Update")
  MovementLoopAddLocation(NPC, 19.30, 1.17, -0.86, 4,0,"Leave")
  MovementLoopAddLocation(NPC, -10.94, 0.99, 8.04 , 4,0,"Leave")
end

function Leave(NPC,Spawn)
    Despawn(NPC)
    Update(NPC,Spawn)
end

function death(NPC,Spawn)
Update(NPC,Spawn)
end
 
function Update(NPC,Spawn)
local Mole = GetSpawn(NPC,8250011) 
local Refu = GetSpawn(NPC,8250012) 
local Part = GetSpawn(NPC,8250013) 
local Tavi = GetSpawn(NPC,8250014) 
    
    if Mole == nil or not IsAlive(Mole) then
        --if Refu == nil or not IsAlive(Refu) then
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

   --end
    end
    end
end
end




function Leave(NPC)
    Despawn(NPC)
end

function AttackTimer(NPC,Spawn)
    SpawnSet(NPC, "show_level", 1)
    SpawnSet(NPC, "attackable", 1)
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
    SpawnSet(NPC,"command_primary",11)
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
  