--[[
    Script Name    : SpawnScripts/TempleSt/Pockets.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.24 08:10:54
    Script Purpose : 
                   : 
--]]

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
         SetTempVariable(NPC,"Speed2_Set", "4")
    else    
         SetTempVariable(NPC,"Speed1_Set", "4")
         SetTempVariable(NPC,"Speed2_Set", "1")
    end
    local Speed1 = GetTempVariable(NPC,"Speed1_Set")
    local Speed2 = GetTempVariable(NPC,"Speed2_Set")
       
    MovementLoopAddLocation(NPC, -61.41, 2.85, 128.83, Speed1, 11)
	MovementLoopAddLocation(NPC, -62.02, 2.84, 130.9, Speed1, 0)
	MovementLoopAddLocation(NPC, -58.28, 2.84, 128.57, Speed2, 0)
	MovementLoopAddLocation(NPC, -34.35, 2.83, 116.34, Speed1, 11)
	MovementLoopAddLocation(NPC, -34.07, 2.82, 112.86, Speed2, 0)
	MovementLoopAddLocation(NPC, -31.12, 2.8, 109.17, Speed2, 0)
	MovementLoopAddLocation(NPC, -21.38, 2.74, 104.08, Speed2, 0)
	MovementLoopAddLocation(NPC, -13.46, 3, 103.88, Speed2, 0)
	MovementLoopAddLocation(NPC, -6.45, 3, 100.2, Speed2, 0)
	MovementLoopAddLocation(NPC, -0.39, 3, 106.7, Speed2, 0)
	MovementLoopAddLocation(NPC, 3.51, 3, 109.95, Speed2, 0)
	MovementLoopAddLocation(NPC, 10.76, 3, 106.88, Speed2, 0)
	MovementLoopAddLocation(NPC, 13.12, 3, 103.9, Speed2, 11)
	MovementLoopAddLocation(NPC, 11.46, 3, 107.51, Speed1, 0)
	MovementLoopAddLocation(NPC, 2.61, 3, 111.09, Speed1, 0)
	MovementLoopAddLocation(NPC, -2.04, 3, 102.97, Speed1, 0)
	MovementLoopAddLocation(NPC, -6.05, 3, 98.32, Speed1, 0)
	MovementLoopAddLocation(NPC, -6.89, 3, 91.65, Speed1, 0)
	MovementLoopAddLocation(NPC, -5.91, 3, 88.59, Speed2, 0)
	MovementLoopAddLocation(NPC, -10.87, 3, 82.13, Speed2, 0)
	MovementLoopAddLocation(NPC, -8.98, 3, 79.39, Speed2, 0)
	MovementLoopAddLocation(NPC, -1.98, 3, 71.53, Speed1, 0)
	MovementLoopAddLocation(NPC, -0.55, 3, 70.39, Speed1, 0)
	MovementLoopAddLocation(NPC, 8.78, 3, 68.85, Speed1, 0)
	MovementLoopAddLocation(NPC, 17.25, 3.01, 70.19, Speed1, 0)
	MovementLoopAddLocation(NPC, 26.64, 3, 71.57, Speed1, 4)
	MovementLoopAddLocation(NPC, 27.99, 3, 62.05, Speed2, 0)
	MovementLoopAddLocation(NPC, 32.29, 3, 51.47, Speed2, 0)
	MovementLoopAddLocation(NPC, 29.68, 3, 49.47, Speed2, 0)
	MovementLoopAddLocation(NPC, 25.59, 2.92, 41.69, Speed2, 0)
	MovementLoopAddLocation(NPC, 21.24, 2.92, 35.89, Speed1, 0)
	MovementLoopAddLocation(NPC, 13.67, 2.92, 33.38, Speed1, 0)
	MovementLoopAddLocation(NPC, 5, 2.92, 39.08, Speed1, 11)
	MovementLoopAddLocation(NPC, 11.29, 2.92, 36.82, Speed1, 0)
	MovementLoopAddLocation(NPC, 14.53, 2.92, 39.66, Speed2, 0)
	MovementLoopAddLocation(NPC, 15.98, 2.92, 41.06, Speed2, 0)
	MovementLoopAddLocation(NPC, 21.53, 2.92, 39.83, Speed2, 0)
	MovementLoopAddLocation(NPC, 24.28, 2.92, 38.63, Speed2, 0)
	MovementLoopAddLocation(NPC, 33.49, 2.99, 46.77, Speed2, 0)
	MovementLoopAddLocation(NPC, 37.69, 3, 50.56, Speed1, 0)
	MovementLoopAddLocation(NPC, 43.68, 3, 49.92, Speed1, 0)
	MovementLoopAddLocation(NPC, 50.72, 3, 60.3, Speed1, 0)
	MovementLoopAddLocation(NPC, 54.45, 3, 63.38, Speed1, 0)
	MovementLoopAddLocation(NPC, 63.11, 2.79, 67.74, Speed1, 0)
	MovementLoopAddLocation(NPC, 70.85, 1.28, 71.33, Speed2, 0)
	MovementLoopAddLocation(NPC, 72.42, 0.01, 76.44, Speed2, 0)
	MovementLoopAddLocation(NPC, 72.92, -1.51, 81.33, Speed2, 0)
	MovementLoopAddLocation(NPC, 77.34, -3.88, 86.47, Speed2, 0)
	MovementLoopAddLocation(NPC, 84.48, -4.57, 95.07, Speed2, 0)
	MovementLoopAddLocation(NPC, 86.81, -4.57, 99.49, Speed1, 0)
	MovementLoopAddLocation(NPC, 92.37, -4.57, 101.07, Speed1, 0)
	MovementLoopAddLocation(NPC, 101.18, -4.57, 103.36, Speed1, 0)
	MovementLoopAddLocation(NPC, 105.98, -4.57, 98.41, Speed1, 11)
	MovementLoopAddLocation(NPC, 98.05, -4.57, 101.28, Speed2, 0)
	MovementLoopAddLocation(NPC, 90.17, -4.57, 101.22, Speed2, 0)
	MovementLoopAddLocation(NPC, 78.03, -4.57, 105.5, Speed2, 11)
	MovementLoopAddLocation(NPC, 80.47, -4.57, 102.26, Speed1, 0)
	MovementLoopAddLocation(NPC, 80.19, -4.57, 97.13, Speed1, 0)
	MovementLoopAddLocation(NPC, 73.24, -1.86, 82.39, Speed1, 0)
	MovementLoopAddLocation(NPC, 71.94, 0.24, 76.21, Speed1, 0)
	MovementLoopAddLocation(NPC, 68.5, 1.81, 70.66, Speed2, 0)
	MovementLoopAddLocation(NPC, 65.39, 2.7, 69.96, Speed2, 0)
	MovementLoopAddLocation(NPC, 54.85, 3, 66.9, Speed2, 0)
	MovementLoopAddLocation(NPC, 44.08, 3, 50.5, Speed1, 0)
	MovementLoopAddLocation(NPC, 43.21, 3, 49.47, Speed1, 0)
	MovementLoopAddLocation(NPC, 30.81, 3, 56.06, Speed1, 0)
	MovementLoopAddLocation(NPC, 25.8, 3, 62.48, Speed2, 0)
	MovementLoopAddLocation(NPC, 15.21, 3, 83.94, Speed2, 0)
	MovementLoopAddLocation(NPC, 10.84, 3, 85.49, Speed2, 0)
	MovementLoopAddLocation(NPC, 4.46, 3, 84.47, Speed2, 11)
	MovementLoopAddLocation(NPC, -3.77, 3, 90.83, Speed2, 0)
	MovementLoopAddLocation(NPC, -6.1, 3, 93.04, Speed1, 0)
	MovementLoopAddLocation(NPC, -5.06, 3, 98.95, Speed1, 0)
	MovementLoopAddLocation(NPC, -6.67, 3, 102.04, Speed2, 0)
	MovementLoopAddLocation(NPC, -15.04, 3, 106.09, Speed1, 0)
	MovementLoopAddLocation(NPC, -17.55, 2.9, 106.09, Speed2, 0)
	MovementLoopAddLocation(NPC, -35.95, 2.82, 113.86, Speed1, 0)
	MovementLoopAddLocation(NPC, -49.54, 2.83, 123.09, Speed2, 0)
	MovementLoopAddLocation(NPC, -58.43, 2.84, 124.19, Speed1, 11)
	MovementLoopAddLocation(NPC, -59.49, 2.84, 123.88, Speed1, 0)
end


