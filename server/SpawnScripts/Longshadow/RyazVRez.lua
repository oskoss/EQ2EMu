--[[
    Script Name    : SpawnScripts/Longshadow/RyazVRez.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.14 07:10:39
    Script Purpose : 
                   : 
--]]

dofile("SpawnScripts/Generic/GenericEcologyVoiceOvers.lua")

function spawn(NPC)
waypoints(NPC)
SetPlayerProximityFunction(NPC, 6, "InRange", "LeaveRange")		
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
    GenericRaceCheckHail(NPC, Spawn)
end

function InRange(NPC,Spawn)
    GenericRaceCheckCallout(NPC, Spawn)
    end

function respawn(NPC)
	spawn(NPC)
end


function waypoints(NPC)
	MovementLoopAddLocation(NPC, -34.4, 1.12, 8.4, 2, 1)
	MovementLoopAddLocation(NPC, -34.4, 1.12, 8.4, 2, 25,"EcologyEmotes")
	MovementLoopAddLocation(NPC, -33.54, 1.12, 9.26, 2, 0)
	MovementLoopAddLocation(NPC, -32.92, 1.12, 8.61, 2, 0)
	MovementLoopAddLocation(NPC, -34.96, 1.12, 7.71, 2, 0)
	MovementLoopAddLocation(NPC, -35.52, 1.12, 5.23, 2, 0)
	MovementLoopAddLocation(NPC, -31.78, 1.12, 4.75, 2, 0)
	MovementLoopAddLocation(NPC, -29.12, 0.91, 4.45, 2, 2,"Door1")
	MovementLoopAddLocation(NPC, -22.8, 0, 5.13, 2, 0)
	MovementLoopAddLocation(NPC, -17.83, 0, 5.87, 2, 0)
	MovementLoopAddLocation(NPC, -16.44, 0, 15.79, 2, 0)
	MovementLoopAddLocation(NPC, -16.44, 0, 15.79, 2, 0)
	MovementLoopAddLocation(NPC, -17.33, 0, 18.72, 2, 2,"Door2")
	MovementLoopAddLocation(NPC, -18.26, -0.01, 22.46, 2, 0,"Door2")
	MovementLoopAddLocation(NPC, -18.18, 0.05, 24.75, 2, 1)
	MovementLoopAddLocation(NPC, -18.18, 0.05, 24.75, 2, 30,"EcologyEmotes")
	MovementLoopAddLocation(NPC, -19.32, -0.01, 23.11, 2, 0)
	MovementLoopAddLocation(NPC, -19.32, -0.01, 23.11, 2, 1)
	MovementLoopAddLocation(NPC, -19.32, -0.01, 23.11, 2, 30,"EcologyEmotes")
	MovementLoopAddLocation(NPC, -18.7, -0.01, 22.48, 2, 2,"Door2")
	MovementLoopAddLocation(NPC, -17.48, 0, 18.09, 2, 0,"Door2")
	MovementLoopAddLocation(NPC, -14.74, 0, 9.74, 2, 0)
	MovementLoopAddLocation(NPC, -14.47, 0, 1.64, 2, 0)
	MovementLoopAddLocation(NPC, -9.82, 0, -8.97, 2, 0)
	MovementLoopAddLocation(NPC, -1.07, 0, -16.3, 2, 0)
	MovementLoopAddLocation(NPC, 0, 0, -18.88, 2, 0)
	MovementLoopAddLocation(NPC, -0.03, 0, -21.61, 2, 0)
	MovementLoopAddLocation(NPC, -1.44, 0.04, -23.23, 2, 1)
	MovementLoopAddLocation(NPC, -1.44, 0.04, -23.23, 2, 30,"Drink")
	MovementLoopAddLocation(NPC, -1.44, 0.04, -23.23, 2, 30,"Drink")
	MovementLoopAddLocation(NPC, 0.2, 0, -21.73, 2, 0)
	MovementLoopAddLocation(NPC, 2.57, 0, -17.84, 2, 0)
	MovementLoopAddLocation(NPC, 4.97, 0, -8.75, 2, 1)
	MovementLoopAddLocation(NPC, 4.97, 0, -8.75, 2, 25,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 6.07, 0, -10.42, 2, 0)
	MovementLoopAddLocation(NPC, 5.6, 0.01, -12.98, 2, 0)
	MovementLoopAddLocation(NPC, -0.4, 0, -12.2, 2, 0)
	MovementLoopAddLocation(NPC, -8.56, 0, -8.8, 2, 0)
	MovementLoopAddLocation(NPC, -14.06, 0, -0.04, 2, 0)
	MovementLoopAddLocation(NPC, -23.25, 0, 4.63, 2, 2,"Door1")
	MovementLoopAddLocation(NPC, -26.87, -0.01, 5.05, 2, 0)
	MovementLoopAddLocation(NPC, -34.59, 1.12, 4.76, 2, 0)
	MovementLoopAddLocation(NPC, -35.47, 1.12, 6.23, 2, 0)
end

function Door1(NPC,Spawn)
    local door = GetSpawn(NPC, 1380079)
    UseWidget(door)
end

function Door2(NPC,Spawn)
    local door = GetSpawn(NPC, 1380078)
    UseWidget(door)
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