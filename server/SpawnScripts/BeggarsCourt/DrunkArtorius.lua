--[[
    Script Name    : SpawnScripts/BeggarsCourt/DrunkArtorius.lua
    Script Author  : Dorbin
    Script Date    : 2023.11.27 04:11:56
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/GenericEcologyVoiceOvers.lua")

function spawn(NPC)
	waypoints(NPC)
SetPlayerProximityFunction(NPC, 5, "InRange", "LeaveRange")	
end

function InRange(NPC, Spawn) 
--    GenericDrunkCallout(NPC, Spawn, faction)    
    end


function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
GenericDrunkHail(NPC, Spawn, faction)
end

function respawn(NPC)
		spawn(NPC)
	end

function Drink(NPC)
        PlayFlavor(NPC,"","","drinking_idle",0,0)
    AddTimer(NPC,8000, "Drink2")
end

function Drink2(NPC)
  choice = math.random(1,4)   
        if choice == 1 then    
        PlayFlavor(NPC,"","","yawn",0,0)
        elseif choice == 2 then    
        PlayFlavor(NPC,"","","drinking_idle",0,0)
        elseif choice == 3 then    
        PlayFlavor(NPC,"","","hungry",0,0)
        else
        PlayFlavor(NPC,"","","happy",0,0)
        end            
    AddTimer(NPC,6000, "Drink3")
end

function Drink3(NPC) -- Checks if the guard is near
    local zone = GetZone(NPC)
    local Guard = GetSpawnByLocationID(zone, 403010)
    local Distance = GetDistance(NPC,Guard)
    if Distance>5 then
    PlayFlavor(NPC,"","","drinking_idle",0,0)
    else
    PlayFlavor(NPC,"","","sniff",0,0)
    end
end


function waypoints(NPC)
	MovementLoopAddLocation(NPC, 82.03, -7.08, 102.12, 2, 0)
	MovementLoopAddLocation(NPC, 81.23, -7.08, 100.5, 2, MakeRandomInt(7,13))
	MovementLoopAddLocation(NPC, 81.23, -7.08, 100.5, 2, 0)
	MovementLoopAddLocation(NPC, 80.05, -7.08, 103.32, 2, 1)
	MovementLoopAddLocation(NPC, 80.05, -7.08, 103.32, 2, MakeRandomInt(10,13),"Drink3")
	MovementLoopAddLocation(NPC, 82.53, -7.08, 103.57, 2, 1)
	MovementLoopAddLocation(NPC, 82.53, -7.08, 103.57, 2, MakeRandomInt(7,13),"Drink3")
	MovementLoopAddLocation(NPC, 80.79, -7.08, 102.37, 2, MakeRandomInt(7,13))
	MovementLoopAddLocation(NPC, 80.79, -7.08, 102.37, 2, 1)
	MovementLoopAddLocation(NPC, 80.62, -7.08, 99.52, 2, MakeRandomInt(10,13),"Drink3")
	MovementLoopAddLocation(NPC, 80.29, -7.08, 104.09, 2, 1)
	MovementLoopAddLocation(NPC, 80.29, -7.08, 104.09, 2, MakeRandomInt(10,13),"Drink3")
	MovementLoopAddLocation(NPC, 78.36, -7.08, 106.45, 2, 0)
	MovementLoopAddLocation(NPC, 76.59, -7.08, 106.76, 2, MakeRandomInt(7,13))
	MovementLoopAddLocation(NPC, 76.76, -7.08, 104.63, 2, MakeRandomInt(7,13))
	MovementLoopAddLocation(NPC, 81.06, -7.08, 102.97, 2, 1)
	MovementLoopAddLocation(NPC, 81.06, -7.08, 102.97, 2, MakeRandomInt(10,13),"Drink3")
	MovementLoopAddLocation(NPC, 77.14, -7.08, 104, 2, MakeRandomInt(7,13))
	MovementLoopAddLocation(NPC, 75.78, -7.08, 106.22, 2, 1)
	MovementLoopAddLocation(NPC, 75.78, -7.08, 106.22, 2, MakeRandomInt(10,13),"Drink3")

--[[
	MovementLoopAddLocation(NPC, 56.11, 3.75, 3.2, 2, 0)
	MovementLoopAddLocation(NPC, 57.67, 3.75, 2.29, 2, 1)
	MovementLoopAddLocation(NPC, 57.67, 3.75, 2.29, 2, 30,"Drink")
	MovementLoopAddLocation(NPC, 57.67, 3.75, 2.29, 2, 0)
	MovementLoopAddLocation(NPC, 55.42, 3.5, 6.09, 2, 0)
	MovementLoopAddLocation(NPC, 53.94, 3.25, 7.23, 2, 1)
	MovementLoopAddLocation(NPC, 53.94, 3.25, 7.23, 2, 30,"Drink")
	MovementLoopAddLocation(NPC, 53.94, 3.25, 7.23, 2, 0)
	MovementLoopAddLocation(NPC, 51.7, 3, 6.61, 2, 4)
	MovementLoopAddLocation(NPC, 53.21, 3.25, 5.09, 2, 0)
	MovementLoopAddLocation(NPC, 54.95, 3.5, 4.58, 2, 0)
	MovementLoopAddLocation(NPC, 57.96, 3.75, 2.31, 2, 0)
	MovementLoopAddLocation(NPC, 61.03, 4.03, -0.82, 2, 1)
	MovementLoopAddLocation(NPC, 61.03, 4.03, -0.82, 2, 30,"Drink")
	MovementLoopAddLocation(NPC, 59.2, 3.75, 1.12, 2, 0)
	MovementLoopAddLocation(NPC, 57.38, 4, -0.45, 2, 0)
	MovementLoopAddLocation(NPC, 58.03, 4, -2.76, 2, 0)
	MovementLoopAddLocation(NPC, 56.89, 4.25, -6.52, 2, 0)
	MovementLoopAddLocation(NPC, 60.23, 5, -13.88, 2, 1)
	MovementLoopAddLocation(NPC, 61.85, 5, -23.46, 2, 30,"Drink")
	MovementLoopAddLocation(NPC, 61.74, 5, -23.56, 2, 0)
	MovementLoopAddLocation(NPC, 62.2, 5, -22.15, 2, 0)
	MovementLoopAddLocation(NPC, 58.93, 5, -15.42, 2, 0)
	MovementLoopAddLocation(NPC, 54.5, 4.38, -7.86, 2, 0)
	MovementLoopAddLocation(NPC, 53.25, 4, -4.82, 2, 0)
	MovementLoopAddLocation(NPC, 53.16, 4, -3.62, 2, 1)
	MovementLoopAddLocation(NPC, 53.16, 4, -3.62, 2, 30,"Drink")
	MovementLoopAddLocation(NPC, 53.16, 4, -3.62, 2, 0)
	MovementLoopAddLocation(NPC, 52.99, 4, -1.23, 2, 0)
	MovementLoopAddLocation(NPC, 57.73, 3.75, 4.32, 2, 1)
	MovementLoopAddLocation(NPC, 57.73, 3.75, 4.32, 2, 30,"Drink")]]--
end


