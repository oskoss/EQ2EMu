--[[
    Script Name    : SpawnScripts/TempleSt/Methos.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.23 08:10:25
    Script Purpose : 
                   : 
--]]

require "SpawnScripts/Generic/CombatModule"

function spawn(NPC)
AddTimer(NPC,MakeRandomInt(3000,6000),"ChefCheck")
waypoints(NPC)
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
    elseif Choice == 2 then
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

function Rat_1(NPC,Spawn)
    local zone = GetZone(NPC)
    local Rat1 = GetSpawnByLocationID(zone,420362)
    SetTempVariable(NPC,"HissTimer", "1")
    if Rat1 == nil or not IsAlive(Rat1) then
        SpawnByLocationID(zone,420362)
    end
    SetTempVariable(NPC,"HissTimer", "1")
end

function Rat_1_Run(NPC,Spawn)
    local zone = GetZone(NPC)
    local Rat1 = GetSpawnByLocationID(zone,420362)
    if Rat1 ~= nil then
        waypoints2(Rat1)
    end
end

function Rat_2(NPC,Spawn)
    local zone = GetZone(NPC)
    local Rat1 = GetSpawnByLocationID(zone,420349)
    if Rat1 == nil or not IsAlive(Rat1) then
        SpawnByLocationID(zone,420349)
    end
    SetTempVariable(NPC,"HissTimer", "1")
end

function Rat_2_Run(NPC,Spawn)
    local zone = GetZone(NPC)
    local Rat1 = GetSpawnByLocationID(zone,420349)
    if Rat1 ~= nil then
        waypoints2(Rat1)
    end
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, 20.33, 2.97, 66.86, 1, 10,"Rat_1")
	MovementLoopAddLocation(NPC, 25.7, 3, 60.61, 1, 1,"Rat_1_Attack")
	MovementLoopAddLocation(NPC, 25.7, 3, 60.61, 1, 1,"Rat_1_Target")
	MovementLoopAddLocation(NPC, 25.7, 3, 60.61, 1, 1,"Rat_1_Run")
	MovementLoopAddLocation(NPC, 33.51, 3, 54.06, 6, 0)
	MovementLoopAddLocation(NPC, 43.49, 3, 50.18, 6, 0)
	MovementLoopAddLocation(NPC, 49.45, 3, 59.19, 6, 0)
	MovementLoopAddLocation(NPC, 54.14, 3, 65.87, 6, 0)
	MovementLoopAddLocation(NPC, 54.13, 3, 67.46, 2, 2,"ResetTarget")
	MovementLoopAddLocation(NPC, 55.9, 3, 70.62, 1, 10,"HissReset")
	MovementLoopAddLocation(NPC, 54.97, 3, 68.39, 1, 0)
	MovementLoopAddLocation(NPC, 50.84, 3, 69.56, 1, 0)
	MovementLoopAddLocation(NPC, 30.72, 3, 80.32, 1, 0)
	MovementLoopAddLocation(NPC, 17.47, 3, 83.09, 1, 0)
	MovementLoopAddLocation(NPC, 5.62, 3, 85.79, 1, 0)
	MovementLoopAddLocation(NPC, -8.84, 3, 90.24, 1, 10)
	MovementLoopAddLocation(NPC, -4.75, 3, 97.83, 1, 0)
	MovementLoopAddLocation(NPC, -8.6, 3, 103.47, 1, 0)
	MovementLoopAddLocation(NPC, -13.18, 3, 105.48, 1, 0)
	MovementLoopAddLocation(NPC, -16.99, 2.95, 105.93, 1, 0)
	MovementLoopAddLocation(NPC, -23.67, 2.86, 109.81, 1, 10)
	MovementLoopAddLocation(NPC, -32.72, 3, 112.67, 1, 0)
	MovementLoopAddLocation(NPC, -38.92, 2.82, 118.37, 1, 0)
	MovementLoopAddLocation(NPC, -46.56, 2.85, 122.92, 1, 10)
	MovementLoopAddLocation(NPC, -46.05, 2.83, 123.62, 1, 0)
	MovementLoopAddLocation(NPC, -45.97, 2.84, 121.85, 1, 0)
	MovementLoopAddLocation(NPC, -43.41, 2.83, 116.29, 1, 0)
	MovementLoopAddLocation(NPC, -33.61, 3.05, 112.1, 1, 0)
	MovementLoopAddLocation(NPC, -20, 2.93, 101.64, 1, 0)
	MovementLoopAddLocation(NPC, -14.33, 3, 103.85, 1, 0)
	MovementLoopAddLocation(NPC, -9.9, 3, 102.08, 1, 0)
	MovementLoopAddLocation(NPC, -1.38, 3, 101.98, 1, 10)
	MovementLoopAddLocation(NPC, -4.73, 3, 100.74, 1, 0)
	MovementLoopAddLocation(NPC, -7.38, 3, 90.48, 1, 0)
	MovementLoopAddLocation(NPC, -11.83, 3, 80.74, 1, 0)
	MovementLoopAddLocation(NPC, -7.38, 3, 74.43, 1, 10)
	MovementLoopAddLocation(NPC, -4.46, 3, 75.04, 1, 0)
	MovementLoopAddLocation(NPC, 7.12, 3.00, 70.82, 1, 0)
	MovementLoopAddLocation(NPC, 21.02, 2.92, 68.72, 1, 0)
	MovementLoopAddLocation(NPC, 37.33, 3, 50.02, 1, 0)
	MovementLoopAddLocation(NPC, 48.79, 3, 47.82, 1, 10)
	MovementLoopAddLocation(NPC, 46.46, 3, 49.22, 1, 0)
	MovementLoopAddLocation(NPC, 49.76, 3, 60.07, 1, 0)
	MovementLoopAddLocation(NPC, 52.88, 3, 65.32, 1, 0)
	MovementLoopAddLocation(NPC, 53.27, 3, 68.01, 1, 0)
	MovementLoopAddLocation(NPC, 47.97, 3, 72.59, 1, 0)
	MovementLoopAddLocation(NPC, 30.27, 3, 80.25, 1, 1,"Rat_2")
	MovementLoopAddLocation(NPC, 29.25, 3, 79.81, 1, 1)--Rat2
	MovementLoopAddLocation(NPC, 29.25, 3, 79.81, 1, 3,"Rat_2_Target")--Rat2
	MovementLoopAddLocation(NPC, 29.25, 3, 79.81, 1, 3,"Rat_2_Attack")--Rat2
	MovementLoopAddLocation(NPC, 29.25, 3, 79.81, 1, 1,"Rat_2_Run")--Rat2
	MovementLoopAddLocation(NPC, 30.93, 3, 69.23, 6, 0)
	MovementLoopAddLocation(NPC, 28.76, 3, 61.79, 6, 0)
	MovementLoopAddLocation(NPC, 24.7, 3, 61.78, 6, 0)
	MovementLoopAddLocation(NPC, 21.63, 2.93, 66.95, 6, 0)
	MovementLoopAddLocation(NPC, 17.96, 3.01, 72.13, 6, 0)
	MovementLoopAddLocation(NPC, 5.76, 3, 67.83, 6, 0)
	MovementLoopAddLocation(NPC, -2.09, 3, 61.88, 6, 0)
	MovementLoopAddLocation(NPC, -1.3, 3, 57.67, 6, 0)
	MovementLoopAddLocation(NPC, -5.37, 3, 56.58, 6, 0)
	MovementLoopAddLocation(NPC, -6.35, 3, 58.17, 6, 0)
	MovementLoopAddLocation(NPC, -6.35, 3, 58.17, 6, 1)
	MovementLoopAddLocation(NPC, -6.35, 3, 58.17, 6, 12,"Rat2_Kill")
	MovementLoopAddLocation(NPC, 0.26, 3, 63.21, 1, 0,"ResetTarget")
	MovementLoopAddLocation(NPC, 2.94, 3, 66.56, 1, 0)
	MovementLoopAddLocation(NPC, 12.27, 3, 70.02, 1, 0)
	MovementLoopAddLocation(NPC, 20.24, 2.99, 69.4, 1, 0)
end

function Rat_1_Attack(NPC)
    local zone = GetZone(NPC)
    local Rat1 = GetSpawnByLocationID(zone,420362)
    if Rat1 ~= nil then
    PlayFlavor(Rat1,"","","attack",0,0)
   end 
end

function Rat_1_Target(NPC)
    local zone = GetZone(NPC)
    local Rat1 = GetSpawnByLocationID(zone,420362)
    if Rat1 ~= nil then
    SetTarget(NPC,Rat1)
    FaceTarget(NPC,Rat1)
    PlayFlavor(NPC,"","","attack",0,0)
   end 
end

function Rat_2_Attack(NPC)
    local zone = GetZone(NPC)
    local Rat2 = GetSpawnByLocationID(zone,420349)
    if Rat2 ~= nil then
    PlayFlavor(Rat2,"","","attack",0,0)
   end 
end

function Rat_2_Target(NPC)
    local zone = GetZone(NPC)
    local Rat2 = GetSpawnByLocationID(zone,420349)
    if Rat2 ~= nil then
    SetTarget(NPC,Rat2)
    FaceTarget(NPC,Rat2)
    PlayFlavor(NPC,"","","attack",0,0)
   end 
end

function Rat2_Kill(NPC)
    local zone = GetZone(NPC)
    local Rat2 = GetSpawnByLocationID(zone,420349)
    if Rat2 ~= nil then
    PlayFlavor(NPC,"","","attack",0,0)
    KillSpawn(Rat2)
    end 
    SetTempVariable(NPC,"HissTimer", "0")
end

function ResetTarget(NPC)
    SetTarget(NPC,nil)
end

function waypoints2(NPC)
    if GetSpawnLocationID(NPC) ==420362 then
    local zone = GetZone(NPC)
    local Rat1 = GetSpawnByLocationID(zone,420362)
    MovementLoopAddLocation(Rat1, 31.95, 3, 55.2, 6, 0)
	MovementLoopAddLocation(Rat1, 39.86, 3, 50.85, 6, 0)
	MovementLoopAddLocation(Rat1, 44.76, 3, 52.29, 6, 0)
	MovementLoopAddLocation(Rat1, 50.85, 3, 60.83, 6, 0)
	MovementLoopAddLocation(Rat1, 54.89, 3, 64.29, 6, 0)
	MovementLoopAddLocation(Rat1, 63.8, 2.77, 67.88, 6, 0)
	MovementLoopAddLocation(Rat1, 70.13, 1.63, 70.44, 6, 0)
	MovementLoopAddLocation(Rat1, 72.76, 0.37, 74.76, 4, 0)
	MovementLoopAddLocation(Rat1, 75.94, -2.87, 84.52, 4, 0)
	MovementLoopAddLocation(Rat1, 81.62, -4.57, 92.12, 4, 0)
	MovementLoopAddLocation(Rat1, 81.83, -4.57, 101.89, 4, 0)
	MovementLoopAddLocation(Rat1, 76.4, -4.57, 109.38, 4, 0)
	MovementLoopAddLocation(Rat1, 74.74, -4.57, 119.51, 4, 0)
	MovementLoopAddLocation(Rat1, 79.26, -4.57, 129.48, 4, 0)
	MovementLoopAddLocation(Rat1, 81.52, -4.57, 129.65, 4, 0)
	MovementLoopAddLocation(Rat1, 80.34, -4.57, 127.54, 4, 30)
	MovementLoopAddLocation(Rat1, 76.3, -4.57, 119.97, 1, 0)
	MovementLoopAddLocation(Rat1, 75.12, -4.57, 112.32, 1, 0)
	MovementLoopAddLocation(Rat1, 75.38, -4.57, 108.35, 1, 10)
	MovementLoopAddLocation(Rat1, 79.18, -4.57, 103.91, 1, 0)
	MovementLoopAddLocation(Rat1, 80.15, -4.57, 100.38, 1, 0)
	MovementLoopAddLocation(Rat1, 77.45, -4.56, 94.18, 1, 0)
	MovementLoopAddLocation(Rat1, 73.76, -3.52, 87.56, 1, 0)
	MovementLoopAddLocation(Rat1, 73.33, -3.11, 86.74, 1, 5)
	MovementLoopAddLocation(Rat1, 71.66, -0.27, 77.96, 4, 0)
	MovementLoopAddLocation(Rat1, 71.52, 0.81, 73.98, 4, 0)
	MovementLoopAddLocation(Rat1, 70.47, 1.33, 72.3, 4, 0)
	MovementLoopAddLocation(Rat1, 64.81, 2.71, 69.86, 4, 0)
	MovementLoopAddLocation(Rat1, 63.46, 3, 61.49, 4, 10)
	MovementLoopAddLocation(Rat1, 59.5, 3, 60.81, 1, 0)
	MovementLoopAddLocation(Rat1, 53, 3, 66.82, 4, 0)
	MovementLoopAddLocation(Rat1, 47.39, 3, 72.82, 4, 0)
	MovementLoopAddLocation(Rat1, 38.52, 3, 76.35, 4, 0)
	MovementLoopAddLocation(Rat1, 34.5, 3, 68.86, 4, 0)
	MovementLoopAddLocation(Rat1, 36.18, 3, 64.02, 1, 0,"Despawning_1")
	MovementLoopAddLocation(Rat1, 36.18, 3, 64.02, 1, 8,"Despawning_1")
    elseif GetSpawnLocationID(NPC) ==420349 then
    local zone = GetZone(NPC)
    local Rat2 = GetSpawnByLocationID(zone,420349)
    MovementLoopAddLocation(Rat2, 30.93, 3, 69.23, 3, 1)
	MovementLoopAddLocation(Rat2, 28.76, 3, 61.79, 3, 0)
	MovementLoopAddLocation(Rat2, 24.7, 3, 61.78, 6, 0)
	MovementLoopAddLocation(Rat2, 21.63, 2.93, 66.95, 6, 0)
	MovementLoopAddLocation(Rat2, 17.96, 3.01, 72.13, 6, 0)
	MovementLoopAddLocation(Rat2, 5.76, 3, 67.83, 6, 0)
	MovementLoopAddLocation(Rat2, -2.09, 3, 61.88, 6, 0)
	MovementLoopAddLocation(Rat2, -1.3, 3, 57.67, 6, 0)
	MovementLoopAddLocation(Rat2, -5.37, 3, 56.58, 6, 0)
	MovementLoopAddLocation(Rat2, -6.35, 3, 58.17, 6, 0)
	MovementLoopAddLocation(Rat2, -6.35, 3, 58.17, 6, 10)	
	MovementLoopAddLocation(Rat2, -0.77, 3.00, 57.48, 1, 0)	
	MovementLoopAddLocation(Rat2, 4.15, 3.00, 52.91, 6, 999)	
	end
end

function Despawning_1(NPC)
--     local zone = GetZone(NPC)
--    local Rat1 = GetSpawnByLocationID(zone,420362)
--    if Rat1 ~= nil then
--        Despawn(Rat1)
        Despawn(NPC)
--   end
end
