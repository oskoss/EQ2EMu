--[[
    Script Name    : SpawnScripts/TempleSt/MrButtons.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.24 07:10:04
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/CombatModule"

function spawn(NPC)
AddTimer(NPC,MakeRandomInt(3000,6000),"ChefCheck")
AddTimer(NPC,MakeRandomInt(3000,6000),"PocketCheck")
AddTimer(NPC,MakeRandomInt(1000,4000),"waypoints")
SetTempVariable(NPC,"PocketFollow", nil)
SetPlayerProximityFunction(NPC, 7, "InRange", "LeaveRange")
SetTempVariable(NPC,"HissTimer", "0")
end

function InRange(NPC,Spawn)
if not IsInCombat(NPC) and GetTempVariable(NPC,"HissTimer")~="1" then
   local Choice = MakeRandomInt(0,100)   
   if GetRace(Spawn)== 13 then
        if Choice <=75 then
        InRange_Attack(NPC,Spawn)
        end
    elseif Choice <= 40 then
    InRange_Attack(NPC,Spawn)
    end      
end
end

function InRange_Attack(NPC,Spawn)
    local Choice = MakeRandomInt(1,2)
    if Choice == 1 then
    FaceTarget(NPC,Spawn)
    AddTimer(NPC,1000,"HissAttack",1,Spawn)
    else
    AddTimer(NPC,500,"Hiss",1,Spawn)
    end    
SetTempVariable(NPC,"HissTimer", "1")
AddTimer(NPC,25000,"HissReset",1,Spawn)
end


function HissAttack(NPC,Spawn)
    PlayFlavor(NPC,"","","attack",0,0)
end

function Hiss(NPC,Spawn)
   local Choice = MakeRandomInt(1,2)
    if Choice == 1 then
    PlaySound(NPC,"sounds/critters/cat/cat_hiss001.wav",GetX(NPC), GetY(NPC), GetZ(NPC))
    else
    PlaySound(NPC,"sounds/critters/cat/cat_hiss002.wav",GetX(NPC), GetY(NPC), GetZ(NPC))
    end
end

function HissReset(NPC,Spawn)
SetTempVariable(NPC,"HissTimer", "0")
end   


function ChefCheck(NPC,Spawn)
    if IsAlive(NPC) then
        AddTimer(NPC,MakeRandomInt(4000,7000),"ChefCheck")
        
        local zone = GetZone(NPC)
        local Chef = GetSpawnByLocationID(zone,420550)
        if not IsInCombat(NPC) and Chef~= nil and not IsInCombat(Chef)then
        local Distance = GetDistance(NPC,Chef,1)
        if Distance <=4 then
            if GetTempVariable(NPC,"Speed_Set")~= nil then
             Reset(NPC,Spawn) 
            end
            Attack(Chef,NPC)
            Attack(NPC,Chef)
            local x = GetX(Chef)
            local y = GetY(Chef)
            local z = GetZ(Chef)
            SetFollowTarget(Chef,NPC)
            SetFollowTarget(NPC,Chef)
            ToggleFollow(Chef)
            ToggleFollow(NPC)
            SetTarget(Chef,NPC)
            FaceTarget(Chef,NPC)
            FaceTarget(NPC,Chef)
            PlayFlavor(NPC,"","","attack",0,0)
            AddTimer(NPC,MakeRandomInt(2500,4500),"kill",1,Spawn)
      end
    end
end
end

function PocketCheck(NPC,Spawn)
    if IsAlive(NPC) then
        AddTimer(NPC,MakeRandomInt(4000,7000),"PocketCheck")
        if not IsInCombat(NPC)  then
        local zone = GetZone(NPC)
        local Pocket = GetSpawnByLocationID(zone,420615)
        local Distance = GetDistance(NPC,Pocket,1)
        if Pocket ~= nil and IsAlive(Pocket) and Distance <=5 then
            SetTarget(Pocket,NPC)
            FaceTarget(Pocket,NPC)
            PlayFlavor(Pocket,"","","attack",0,0)
            AddTimer(NPC,2300,"AttackBack",1,Spawn)
            AddTimer(NPC,4000,"ResetFollow",1,Spawn)
      end
    end
end
end

function AttackBack(NPC,Spawn)
        local zone = GetZone(NPC)
        local Pocket = GetSpawnByLocationID(zone,420615)
        SetTarget(NPC,Pocket)
        FaceTarget(NPC,Pocket)
        PlayFlavor(NPC,"","","attack",0,0)
end

function ResetFollow(NPC,Spawn)
        local zone = GetZone(NPC)
        local Pocket = GetSpawnByLocationID(zone,420615)
        SetTarget(Pocket,nil)
        SetTarget(NPC,nil)
end

function kill (NPC,Spawn)
     ApplySpellVisual(NPC,51)
   local zone = GetZone(NPC)
    local Chef = GetSpawnByLocationID(zone,420550)
    PlayFlavor(Chef,"","","1h_sword_attack",0,0)
    KillSpawn(NPC)
    AddTimer(Chef,2500,"scoop")
    AddTimer(NPC,3000,"Despawning")
end

function Despawning(NPC,Spawn)
    Despawn(NPC)
end

function scoop(NPC,Spawn)
    local zone = GetZone(NPC)
    local Chef = GetSpawnByLocationID(zone,420550)
    PlayFlavor(Chef,"","","gathering_success",0,0)
    Despawn(NPC)
end



function respawn(NPC)
	spawn(NPC)
end


function waypoints(NPC)
    local choice = MakeRandomInt(1,2)
    if choice == 1 then
         SetTempVariable(NPC,"Speed1_Set", "1")
         SetTempVariable(NPC,"Speed2_Set", "4")
    else    
         SetTempVariable(NPC,"Speed1_Set", "4")
         SetTempVariable(NPC,"Speed2_Set", "1")
    end
    local Speed1 = GetTempVariable(NPC,"Speed1_Set")
    local Speed2 = GetTempVariable(NPC,"Speed2_Set")
	MovementLoopAddLocation(NPC, -40.34, 2.85, 109.71, Speed1, MakeRandomInt(10,20))
	MovementLoopAddLocation(NPC, -40.34, 2.85, 109.71, Speed1, 0)
	MovementLoopAddLocation(NPC, -39.29, 2.83, 111.9, Speed1, 0)
	MovementLoopAddLocation(NPC, -35.56, 2.86, 112.69, Speed1, 0)
	MovementLoopAddLocation(NPC, -32.78, 3, 111.84, Speed1, 0)
	MovementLoopAddLocation(NPC, -24.57, 2.95, 103.39, Speed2, MakeRandomInt(10,20))
	MovementLoopAddLocation(NPC, -14.75, 3, 105.05, Speed2, 0)
	MovementLoopAddLocation(NPC, -6.7, 3, 101.13, Speed2, 0)
	MovementLoopAddLocation(NPC, -5.31, 3, 99.57, Speed2, 0)
	MovementLoopAddLocation(NPC, -5.88, 3, 95.16, Speed2, 0)
	MovementLoopAddLocation(NPC, -6.67, 3, 91.92, Speed1, 0)
	MovementLoopAddLocation(NPC, -2.53, 3, 86.87, Speed1, MakeRandomInt(10,20))
	MovementLoopAddLocation(NPC, 6.97, 3, 85.46, Speed2, 0)
	MovementLoopAddLocation(NPC, 12.42, 3, 82.94, Speed2, 0)
	MovementLoopAddLocation(NPC, 13.67, 3, 82.38, Speed1, 0)
	MovementLoopAddLocation(NPC, 18.89, 3, 82.26, Speed1, 0)
	MovementLoopAddLocation(NPC, 20.96, 3.01, 85.75, Speed1, 0)
	MovementLoopAddLocation(NPC, 22.52, 3, 93.18, Speed2, 0)
	MovementLoopAddLocation(NPC, 28.35, 3, 98.92, Speed2, 0)
	MovementLoopAddLocation(NPC, 33.44, 3, 107.7, Speed1, 0)
	MovementLoopAddLocation(NPC, 35.22, 3, 108.91, Speed1, 0)
	MovementLoopAddLocation(NPC, 42.42, 3, 104.99, Speed2, MakeRandomInt(10,20))
	MovementLoopAddLocation(NPC, 45.43, 3, 106.06, Speed1, 0)
	MovementLoopAddLocation(NPC, 47.23, 3, 104.46, Speed1, 0)
	MovementLoopAddLocation(NPC, 52.91, 3, 97.03, Speed2, 0)
	MovementLoopAddLocation(NPC, 51.36, 3, 93.29, Speed2, 0)
	MovementLoopAddLocation(NPC, 47.05, 3, 91.65, Speed2, 0)
	MovementLoopAddLocation(NPC, 45.07, 3, 87.42, Speed1, 0)
	MovementLoopAddLocation(NPC, 45.77, 3, 84.02, Speed2, 0)
	MovementLoopAddLocation(NPC, 43.63, 3, 79.92, Speed1, 0)
	MovementLoopAddLocation(NPC, 42.39, 3, 76.24, Speed1, 0)
	MovementLoopAddLocation(NPC, 43.08, 3, 73.6, Speed1, 0)
	MovementLoopAddLocation(NPC, 46.37, 3, 70.84, Speed1, 0)
	MovementLoopAddLocation(NPC, 51.05, 3, 67.69, Speed2, 0)
	MovementLoopAddLocation(NPC, 52.91, 3, 66.66, Speed1, 0)
	MovementLoopAddLocation(NPC, 51.32, 3, 61.04, Speed1, 0)
	MovementLoopAddLocation(NPC, 49.44, 3, 53.32, Speed2, MakeRandomInt(10,20))
	MovementLoopAddLocation(NPC, 49.22, 3, 54.19, Speed2, 0)
	MovementLoopAddLocation(NPC, 46.34, 3, 54.15, Speed2, 0)
	MovementLoopAddLocation(NPC, 44.25, 3, 51.21, Speed1, 0)
	MovementLoopAddLocation(NPC, 43.59, 3, 50.29, Speed1, 0)
	MovementLoopAddLocation(NPC, 37.61, 3, 50.02, Speed2, 0)
	MovementLoopAddLocation(NPC, 35.14, 3, 48.26, Speed2, 0)
	MovementLoopAddLocation(NPC, 29.54, 2.92, 40.43, Speed1, 0)
	MovementLoopAddLocation(NPC, 20.89, 2.92, 37.17, Speed1, 0)
	MovementLoopAddLocation(NPC, 20.86, 2.92, 33.7, Speed2, 0)
	MovementLoopAddLocation(NPC, 22.07, 2.92, 31.26, Speed1, 0)
	MovementLoopAddLocation(NPC, 25.56, 2.92, 18.56, Speed2, MakeRandomInt(10,20))
	MovementLoopAddLocation(NPC, 25.65, 2.92, 28.88, Speed2, 0)
	MovementLoopAddLocation(NPC, 28.68, 2.92, 36.04, Speed2, 0)
	MovementLoopAddLocation(NPC, 32.98, 2.96, 45.45, Speed2, 0)
	MovementLoopAddLocation(NPC, 35.64, 3, 50.86, Speed1, 0)
	MovementLoopAddLocation(NPC, 31.76, 3, 57.23, Speed1, 0)
	MovementLoopAddLocation(NPC, 29.22, 3, 60.28, Speed1, 0)
	MovementLoopAddLocation(NPC, 32.33, 3, 70.17, Speed1, 0)
	MovementLoopAddLocation(NPC, 34.91, 3, 76.39, Speed2, 0)
	MovementLoopAddLocation(NPC, 35.88, 3, 81.96, Speed2, 0)
	MovementLoopAddLocation(NPC, 33.94, 3, 83.37, Speed2, MakeRandomInt(10,20))
	MovementLoopAddLocation(NPC, 32, 3, 82.55, Speed1, 0)
	MovementLoopAddLocation(NPC, 25.46, 3, 78.68, Speed1, 0)
	MovementLoopAddLocation(NPC, 10.6, 3, 68.32, Speed1, 0)
	MovementLoopAddLocation(NPC, 4.46, 3, 66.63, Speed1, 0)
	MovementLoopAddLocation(NPC, 0.33, 3, 63.68, Speed2, 0)
	MovementLoopAddLocation(NPC, -2.91, 3, 57.43, Speed2, 0)
	MovementLoopAddLocation(NPC, 1.2, 3, 57.36, Speed2, MakeRandomInt(10,20))
	MovementLoopAddLocation(NPC, 1.1, 3, 63.22, Speed1, 0)
	MovementLoopAddLocation(NPC, 1.68, 3, 64.72, Speed1, 0)
	MovementLoopAddLocation(NPC, 11.43, 3, 68.74, Speed2, 0)
	MovementLoopAddLocation(NPC, 15.45, 3, 78.29, Speed1, 0)
	MovementLoopAddLocation(NPC, 13.9, 3, 82.29, Speed2, 0)
	MovementLoopAddLocation(NPC, 6.56, 3, 86.1, Speed1, 0)
	MovementLoopAddLocation(NPC, 3.54, 3, 86.31, Speed1, 0)
	MovementLoopAddLocation(NPC, -6.38, 3, 92.01, Speed2, 0)
	MovementLoopAddLocation(NPC, -6.26, 3, 93.36, Speed1, 0)
	MovementLoopAddLocation(NPC, -4.45, 3, 99.69, Speed2, 0)
	MovementLoopAddLocation(NPC, 0.69, 3, 107.84, Speed1, 0)
	MovementLoopAddLocation(NPC, 3.3, 3, 109.38, Speed2, 0)
	MovementLoopAddLocation(NPC, 12.44, 3, 105.52, Speed2, MakeRandomInt(10,20))
	MovementLoopAddLocation(NPC, 6.9, 3, 109.4, Speed1, 0)
	MovementLoopAddLocation(NPC, 2.71, 3, 109.76, Speed1, 0)
	MovementLoopAddLocation(NPC, -1.77, 3, 105.77, Speed1, 0)
	MovementLoopAddLocation(NPC, -4.29, 3, 101.88, Speed2, 0)
	MovementLoopAddLocation(NPC, -12.07, 3, 104.58, Speed2, 0)
	MovementLoopAddLocation(NPC, -17.08, 2.95, 105.62, Speed1, 0)
	MovementLoopAddLocation(NPC, -34.72, 2.81, 113.72, Speed1, 0)
	MovementLoopAddLocation(NPC, -35.34, 2.84, 116.06, Speed2, 0)
	MovementLoopAddLocation(NPC, -62.29, 2.85, 130.63, Speed2, MakeRandomInt(10,20))
	MovementLoopAddLocation(NPC, -55.3, 2.83, 124.78, Speed1, 0)
	MovementLoopAddLocation(NPC, -42.09, 2.84, 119.14, Speed1, 0)
	MovementLoopAddLocation(NPC, -41.07, 2.83, 106.76, Speed1, MakeRandomInt(10,20))
end



