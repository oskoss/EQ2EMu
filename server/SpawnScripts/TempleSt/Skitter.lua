--[[
    Script Name    : SpawnScripts/TempleSt/Skitter.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.24 08:10:17
    Script Purpose : 
                   : 
--]]
local Speed1 = nil
local Speed2 = nil
require "SpawnScripts/Generic/CombatModule"

function spawn(NPC)
AddTimer(NPC,MakeRandomInt(3000,6000),"ChefCheck")
AddTimer(NPC,MakeRandomInt(3000,6000),"waypoints")
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
    SetTarget(NPC,nil)
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
         SetTempVariable(NPC,"Speed2_Set", "6")
    else    
         SetTempVariable(NPC,"Speed1_Set", "6")
         SetTempVariable(NPC,"Speed2_Set", "1")
    end
    local Speed1 = GetTempVariable(NPC,"Speed1_Set")
    local Speed2 = GetTempVariable(NPC,"Speed2_Set")
    
	MovementLoopAddLocation(NPC, -4.01, 3, 114.66, 1, 0)
	MovementLoopAddLocation(NPC, -4.01, 3, 114.66, Speed1, 0)
	MovementLoopAddLocation(NPC, 0.54, 3.00, 110.66, 1, 0)
	MovementLoopAddLocation(NPC, 0.63, 3, 110.73, Speed1, 0)
	MovementLoopAddLocation(NPC, -4.22, 3, 100.21, Speed1, 0)
	MovementLoopAddLocation(NPC, -7, 3, 91.34, Speed1, 0)
	MovementLoopAddLocation(NPC, -10.22, 3, 82.31, Speed1, 0)
	MovementLoopAddLocation(NPC, -10.22, 3, 82.31, Speed2, 0)
	MovementLoopAddLocation(NPC, -8.57, 3, 77.81, Speed1, 0)
	MovementLoopAddLocation(NPC, 0.25, 3, 72.69, Speed2, 0)
	MovementLoopAddLocation(NPC, 7.1, 3, 69.48, Speed2, 0)
	MovementLoopAddLocation(NPC, 7.1, 3, 69.48, Speed2, 0)
	MovementLoopAddLocation(NPC, 13.57, 3, 71.59, Speed1, 0)
	MovementLoopAddLocation(NPC, 21.57, 2.96, 76.43, Speed1, 0)
	MovementLoopAddLocation(NPC, 19.41, 3, 86.01, Speed1, 12)
	MovementLoopAddLocation(NPC, 25.5, 2.99, 57, Speed1, 0)
	MovementLoopAddLocation(NPC, 25.5, 2.99, 57, Speed2, 0)
	MovementLoopAddLocation(NPC, 25.5, 2.99, 57, Speed2, 10)
	MovementLoopAddLocation(NPC, 32.82, 3, 73.14, Speed2, 0)
	MovementLoopAddLocation(NPC, 45.29, 3, 81.61, Speed2, 0)
	MovementLoopAddLocation(NPC, 49.39, 3, 92.25, Speed2, 0)
	MovementLoopAddLocation(NPC, 51.92, 3, 99.67, Speed1, 0)
	MovementLoopAddLocation(NPC, 51.92, 3, 99.67, Speed2, 0)
	MovementLoopAddLocation(NPC, 46.89, 3, 105.05, Speed2, 0)
	MovementLoopAddLocation(NPC, 35.42, 3, 109.79, Speed2, 0)
	MovementLoopAddLocation(NPC, 33.42, 3, 107.62, Speed2, 0)
	MovementLoopAddLocation(NPC, 25.28, 3, 94.82, Speed2, 0)
	MovementLoopAddLocation(NPC, 21.82, 3, 92.27, Speed2, 10)
	MovementLoopAddLocation(NPC, 21.79, 3, 91.48, Speed1, 0)
	MovementLoopAddLocation(NPC, 21.79, 3, 91.48, Speed1, 0)
	MovementLoopAddLocation(NPC, 16.18, 3, 83.15, Speed2, 0)
	MovementLoopAddLocation(NPC, 5.03, 3, 85.76, Speed2, 0)
	MovementLoopAddLocation(NPC, -3.76, 3, 89.72, Speed1, 0)
	MovementLoopAddLocation(NPC, -7, 3, 92.01, Speed1, 0)
	MovementLoopAddLocation(NPC, -8.2, 3, 89.87, Speed1, 4)
	MovementLoopAddLocation(NPC, -8.2, 3, 89.87, Speed2, 0)
	MovementLoopAddLocation(NPC, -7.59, 3, 89.21, 6, 0)
	MovementLoopAddLocation(NPC, -12.05, 3, 79.9, Speed1, 0,"Rat_1")
	MovementLoopAddLocation(NPC, -12.38, 3, 79.3, Speed2, 1)
	MovementLoopAddLocation(NPC, -12.38, 3, 79.3, Speed2, 1,"Rat_1_Target")
	MovementLoopAddLocation(NPC, -12.38, 3, 79.3, Speed2, 1,"Rat_1_Attack")
	MovementLoopAddLocation(NPC, -12.38, 3, 79.3, Speed2, 1)
	MovementLoopAddLocation(NPC, -22.81, 3, 83.91, 6, 1,"Rat_1_Run")
	MovementLoopAddLocation(NPC, -12.18, 3, 79.22, 6, 0)
	MovementLoopAddLocation(NPC, -6.65, 3, 89.24, 6, 0)
	MovementLoopAddLocation(NPC, -4.77, 3, 99.87, 6, 0)
	MovementLoopAddLocation(NPC, -12.57, 3, 104.86, 6, 0)
	MovementLoopAddLocation(NPC, -17.18, 2.97, 105.37, 6, 0)
	MovementLoopAddLocation(NPC, -32.7, 3, 112.34, 6, 0)
	MovementLoopAddLocation(NPC, -35.23, 2.84, 114.18, 6, 0)
	MovementLoopAddLocation(NPC, -60.02, 2.84, 128.2, 6, 0)
	MovementLoopAddLocation(NPC, -47.68, 2.84, 120.5, 6, 0)
	MovementLoopAddLocation(NPC, -39.01, 2.83, 116.71, 6, 0)
	MovementLoopAddLocation(NPC, -34.13, 2.84, 121.18, 6, 0)
	MovementLoopAddLocation(NPC, -36.74, 2.83, 119.12, 6, 0)
	MovementLoopAddLocation(NPC, -44.02, 2.83, 105.2, 6, 0)
	MovementLoopAddLocation(NPC, -44.02, 2.83, 105.2, 6, 0)
	MovementLoopAddLocation(NPC, -44.02, 2.83, 105.2, 6, 1)
	MovementLoopAddLocation(NPC, -44.02, 2.83, 105.2, 6, 7,"Rat1_Kill")
	MovementLoopAddLocation(NPC, -39.18, 2.81, 112.46, 1, 0)
	MovementLoopAddLocation(NPC, -33.88, 2.93, 112.57, 1, 0)
	MovementLoopAddLocation(NPC, -23.41, 2.81, 103.94, 1, 0)
	MovementLoopAddLocation(NPC, -18.63, 3, 101.25, 1, 0)
	MovementLoopAddLocation(NPC, -17.31, 3, 99.16, 1, 10)
	MovementLoopAddLocation(NPC, -17.48, 3, 100.27, 1, 0)
	MovementLoopAddLocation(NPC, -14.73, 3, 104.05, Speed1, 0)
	MovementLoopAddLocation(NPC, -13.85, 3, 104.15, Speed1, 0)
	MovementLoopAddLocation(NPC, -4.4, 3, 100.16, Speed1, 0)
	MovementLoopAddLocation(NPC, -1.56, 3, 103.09, Speed2, 0)
	MovementLoopAddLocation(NPC, 0.56, 3, 107.36, Speed2, 0)
	MovementLoopAddLocation(NPC, 1.58, 3, 110.59, Speed1, 0)
	MovementLoopAddLocation(NPC, -3.78, 3, 114.94, Speed2, 0)
	MovementLoopAddLocation(NPC, -3.78, 3, 114.94, Speed2, 6)
end

function Rat_1(NPC,Spawn)
    local zone = GetZone(NPC)
    local Rat1 = GetSpawnByLocationID(zone,420316)
    if Rat1 == nil or not IsAlive(Rat1) then
        SpawnByLocationID(zone,420316)
    end
SetTempVariable(NPC,"HissTimer", "1")
end

function Rat_1_Run(NPC,Spawn)
    local zone = GetZone(NPC)
    local Rat1 = GetSpawnByLocationID(zone,420316)
    if Rat1 ~= nil then
        waypoints2(Rat1)
    end
end


function Rat_1_Target(NPC)
    local zone = GetZone(NPC)
    local Rat1 = GetSpawnByLocationID(zone,420316)
    if Rat1 ~= nil then
    SetTarget(NPC,Rat1)
    FaceTarget(NPC,Rat1)
    PlayFlavor(NPC,"","","attack",0,0)
   end 
end

function Rat_1_Attack(NPC)
    local zone = GetZone(NPC)
    local Rat1 = GetSpawnByLocationID(zone,420316)
    if Rat1 ~= nil then
    PlayFlavor(Rat1,"","","attack",0,0)
   end 
end

function Rat1_Kill(NPC)
    local zone = GetZone(NPC)
    local Rat1 = GetSpawnByLocationID(zone,420316)
    if Rat1 ~= nil then
    PlayFlavor(NPC,"","","attack",0,0)
    KillSpawn(Rat1)
    SetTempVariable(NPC,"HissTimer", "0")
    end 
end

function waypoints2(NPC)
    if GetSpawnLocationID(NPC) ==420316 then
    local zone = GetZone(NPC)
    local Rat1 = GetSpawnByLocationID(zone,420316)
	MovementLoopAddLocation(Rat1, -22.81, 3, 83.91, 6, 0)
	MovementLoopAddLocation(Rat1, -12.18, 3, 79.22, 6, 0)
	MovementLoopAddLocation(Rat1, -6.65, 3, 89.24, 6, 0)
	MovementLoopAddLocation(Rat1, -4.77, 3, 99.87, 6, 0)
	MovementLoopAddLocation(Rat1, -12.57, 3, 104.86, 6, 0)
	MovementLoopAddLocation(Rat1, -17.18, 2.97, 105.37, 6, 0)
	MovementLoopAddLocation(Rat1, -32.7, 3, 112.34, 6, 0)
	MovementLoopAddLocation(Rat1, -35.23, 2.84, 114.18, 6, 0)
	MovementLoopAddLocation(Rat1, -60.02, 2.84, 128.2, 6, 0)
	MovementLoopAddLocation(Rat1, -47.68, 2.84, 120.5, 6, 0)
	MovementLoopAddLocation(Rat1, -39.01, 2.83, 116.71, 6, 0)
	MovementLoopAddLocation(Rat1, -34.13, 2.84, 121.18, 6, 0)
	MovementLoopAddLocation(Rat1, -36.74, 2.83, 119.12, 6, 0)
	MovementLoopAddLocation(Rat1, -44.02, 2.83, 105.2, 6, 0)
	MovementLoopAddLocation(Rat1, -44.02, 2.83, 105.2, 6, 1)
	MovementLoopAddLocation(Rat1, -44.02, 2.83, 105.2, 6, 1)
	MovementLoopAddLocation(Rat1, -44.02, 2.83, 105.2, 6, 12)
	MovementLoopAddLocation(Rat1, -39.18, 2.81, 112.46, 1, 0)
	end
end