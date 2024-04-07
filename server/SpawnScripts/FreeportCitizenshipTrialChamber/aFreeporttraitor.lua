--[[
    Script Name    : SpawnScripts/FreeportCitizenshipTrialChamber/aFreeporttraitor.lua
    Script Author  : Dorbin
    Script Date    : 2023.06.25 01:06:51
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/DialogModule"
require "SpawnScripts/Generic/CombatModule"
local BBCitizen = 5866 --Big Bend
local BCCitizen = 5867 --Beggar's Court
local LACitizen = 5868 --Longshadow Alley
local SYCitizen = 5869 -- Scale Yard
local SBCitizen = 5870 --Stonestair Byway
local TSCitizen = 5871 --Temple St

function spawn(NPC, Spawn)
    combatModule(NPC, Spawn)
	SetPlayerProximityFunction(NPC, 7, "InRange", "LeaveRange")
end

function InRange(NPC, Spawn)
if not IsInCombat(NPC) then
PlayFlavor(NPC, "","Psst!  Perhaps we can come to an arrangement...", "", 0,0, Spawn)
end
end

function hailed(NPC, Spawn)
Dialog1(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function Dialog1(NPC, Spawn)
	FaceTarget(NPC, Spawn)
    PlayAnimation(NPC,"539")
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("Please don't hurt me. I can make you wealthy!")
	Dialog.AddVoiceover("voiceover/english/a_freeport_traitor/fprt_sewer_epic08/bribingtraitor000.mp3", 3714658197, 1541784827)
	Dialog.AddOption("I'm listening.", "Dialog2")
	Dialog.Start()
end

function Dialog2(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("My family already left for Qeynos. If you let me live, I'll send you exactly what you deserve for this!")
	Dialog.AddVoiceover("voiceover/english/a_freeport_traitor/fprt_sewer_epic08/bribingtraitor001.mp3", 0, 0)
    PlayFlavor(NPC,"","","nod",0,0,Spawn)
	Dialog.AddOption("Stay here. Let me consider this.")
	Dialog.AddOption("How can I trust you?", "Dialog3")
	Dialog.AddOption("Coin cannot cover what you've done!", "AttackTimer")
	Dialog.AddOption("I don't think so.", "AttackTimer")
	Dialog.Start()
end

function Dialog3(NPC, Spawn)
	FaceTarget(NPC, Spawn)
	Dialog.New(NPC, Spawn)
	Dialog.AddDialog("I don't suppose you can ... so you have to trust me.")
	Dialog.AddVoiceover("voiceover/english/a_freeport_traitor/fprt_sewer_epic08/bribingtraitor002.mp3", 0, 0)
    PlayFlavor(NPC,"","","whome",0,0,Spawn)
	Dialog.AddOption("Fine.","Fail")
	Dialog.AddOption("A bribe? Pay with your life!", "AttackTimer")
	Dialog.Start()
end

function AttackTimer(NPC,Spawn)
    AddTimer(NPC,1200,"Attacking",1,Spawn)
end

function Attacking(NPC,Spawn)
    SpawnSet(NPC,"attackable",1)
    SpawnSet(NPC,"show_level",1)
    AddPrimaryEntityCommand(Spawn,NPC,"",0,"")
    AddPrimaryEntityCommand(Spawn,NPC,"attack",10000,"attack")
    SendUpdateDefaultCommand(NPC,10000,"attack")
    Attack(NPC,Spawn)
end

function Fail(NPC,Spawn)
    PlaySound(Spawn,"sounds/ui/ui_warning.wav", GetX(NPC), GetY(NPC), GetZ(NPC))
    SendPopUpMessage(Spawn,"To accept a bribe from a Qeynosian shows a disgusting lack of ethics.",255,50,50)
    SendMessage(Spawn,"To accept a bribe from a Qeynosian shows a disgusting lack of ethics.","red")
    AddTimer(NPC,4500,"FailureExit",1,Spawn)
end


function FailureExit(NPC,Spawn)
    CloseConversation(NPC,Spawn)
      Race = GetRace(Spawn)

    -- Erudite / Kerra
    if Race == 3 or Race == 11 then
        ZoneRef = GetZone("Stonestair")
        Zone(ZoneRef,Spawn,3.24, -4.37, -98.46, 185.35)

      -- Ratonga / Gnome
    elseif Race == 5 or Race == 13 then
        ZoneRef = GetZone("TempleSt")
        Zone(ZoneRef,Spawn,21.81, 2.92, 21.37, 190.87)


      -- Human / Half Elf
    elseif Race == 9 or Race == 6 then
        ZoneRef = GetZone("BeggarsCourt")
        Zone(ZoneRef,Spawn,61.07, -7.08, 111.67, 339.27)


   -- Orge / Troll
    elseif Race == 12 or Race == 14 then
        ZoneRef = GetZone("BigBend")
        Zone(ZoneRef,Spawn,94.12, -2.00, 2.53, 98)
    
   -- Dark Elf 
    elseif Race == 1  or Race == 19 or Race == 17 then
        ZoneRef = GetZone("longshadow")
        Zone(ZoneRef,Spawn,4.22, 3.00, 71.07, 353.87)

    -- Barbarian / Iksar / Sarnak
    elseif Race == 0 or Race == 10 or Race == 18 then
        ZoneRef = GetZone("ScaleYard")
        Zone(ZoneRef,Spawn,-6.78, -5.63, -12.96, 194.63)

    else 
        ZoneRef = GetZone("BeggarsCourt")
        Zone(ZoneRef,Spawn,58.67, -7.08, 112.61, 352.60)

    end
end

function aggro(NPC,Spawn)
     SpawnSet(NPC,"attackable",1)
    SpawnSet(NPC,"show_level",1)
    SpawnSet(NPC,"command_primary",11)
    SpawnSet(NPC,"action_state",0)
end

function death(NPC,Spawn)

local Traitor1 = GetSpawn(NPC,1640001) 
local Traitor2 = GetSpawn(NPC,1640002) 
local Traitor3 = GetSpawn(NPC,1640018) 
local Traitor3 = GetSpawn(NPC,1640021) 
    
    if Traitor1 == nil or not IsAlive(Traitor1) then
        if Traitor2 == nil or not IsAlive(Traitor2) then
            if Traitor3 == nil or not IsAlive(Traitor3) then
                if Traitor3 == nil or not IsAlive(Traitor3) then    
        if HasQuest(Spawn,BBCitizen) then
	SetStepComplete(Spawn,BBCitizen,4)
	elseif HasQuest(Spawn,BCCitizen) then
 	SetStepComplete(Spawn,BCCitizen,4)
	elseif HasQuest(Spawn,LACitizen) then
 	SetStepComplete(Spawn,LACitizen,4)
	elseif HasQuest(Spawn,SYCitizen) then
 	SetStepComplete(Spawn,SYCitizen,4)
	elseif HasQuest(Spawn,SBCitizen) then
 	SetStepComplete(Spawn,SBCitizen,4)
	elseif HasQuest(Spawn,TSCitizen) then
 	SetStepComplete(Spawn,TSCitizen,4)
 	    end   
    end
    end
    end
    end
end

function victory(NPC,Spawn)
    AddTimer(NPC,2500,"FailureExit",1,Spawn)
end    