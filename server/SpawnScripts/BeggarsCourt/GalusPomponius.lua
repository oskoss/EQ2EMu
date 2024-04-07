--[[
    Script Name    : SpawnScripts/BeggarsCourt/GalusPomponius.lua
    Script Author  : Dorbin
    Script Date    : 2023.11.27 07:11:11
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/GenericEcologyVoiceOvers.lua")

function spawn(NPC)
SetPlayerProximityFunction(NPC, 7, "InRange", "LeaveRange")		
waypoints(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
GenericEcologyHail(NPC, Spawn, faction)
end

function InRange(NPC,Spawn)
GenericEcologyCallout(NPC, Spawn, faction)
end
    
function respawn(NPC)
		spawn(NPC)
	end
	

function waypoints(NPC)
	MovementLoopAddLocation(NPC, 56.59, 5, -23.36, 2, 1)
	MovementLoopAddLocation(NPC, 56.59, 5, -23.36, 2, 30,"Drink")
	MovementLoopAddLocation(NPC, 56.59, 5, -23.36, 2, 0)
	MovementLoopAddLocation(NPC, 56.37, 5, -20.98, 2, 0)
	MovementLoopAddLocation(NPC, 51.86, 5, -15.47, 2, 0)
	MovementLoopAddLocation(NPC, 50.42, 4.75, -11.99, 2, 0)
	MovementLoopAddLocation(NPC, 49.27, 4, -7.35, 2, 0)
	MovementLoopAddLocation(NPC, 50.53, 4, -5.35, 2, 0)
	MovementLoopAddLocation(NPC, 52.94, 4, -0.98, 2, 0)
	MovementLoopAddLocation(NPC, 55.05, 3.66, 1.8, 2, 0)
	MovementLoopAddLocation(NPC, 53.02, 3.25, 2.46, 2, 0)
	MovementLoopAddLocation(NPC, 50.09, 3, 4.2, 2, 0)
	MovementLoopAddLocation(NPC, 49.25, 3, 7.27, 2, 0)
	MovementLoopAddLocation(NPC, 47.2, 2.5, 10.27, 2, 0)
	MovementLoopAddLocation(NPC, 42.6, 2.25, 11.24, 2, 0)
	MovementLoopAddLocation(NPC, 37.84, 2, 12.6, 2, 0)
	MovementLoopAddLocation(NPC, 32.01, 2, 15.65, 2, 20)
	MovementLoopAddLocation(NPC, 32.01, 2, 15.65, 2, 0)
	MovementLoopAddLocation(NPC, 31.48, 2.01, 13.85, 2, 0)
	MovementLoopAddLocation(NPC, 29.98, 2.29, 13.02, 2, 0)
	MovementLoopAddLocation(NPC, 26.95, 2.25, 13.33, 2, 0)
	MovementLoopAddLocation(NPC, 24.33, 2.25, 14.13, 2, 0)
	MovementLoopAddLocation(NPC, 20.31, 2.25, 16.43, 2, 0)
	MovementLoopAddLocation(NPC, 14.54, 2.25, 16.41, 2, 0)
	MovementLoopAddLocation(NPC, 10.67, 2, 16.13, 2, 0)
	MovementLoopAddLocation(NPC, 4.29, 2, 12.77, 2, 0)
	MovementLoopAddLocation(NPC, 1.93, 2, 11.25, 2, 0)
	MovementLoopAddLocation(NPC, 0.6, 2.02, 13.01, 2, 0)
	MovementLoopAddLocation(NPC, -0.22, 1.95, 14.61, 2, 0)
	MovementLoopAddLocation(NPC, -1.92, 1.91, 15.18, 2, 0)
	MovementLoopAddLocation(NPC, -3.78, 1.45, 14.96, 2, 0)
	MovementLoopAddLocation(NPC, -9.02, -1.38, 12.73, 2, 0)
	MovementLoopAddLocation(NPC, -11.49, -2.89, 11.07, 2, 0)
	MovementLoopAddLocation(NPC, -14.49, -4.99, 8.03, 2, 0)
	MovementLoopAddLocation(NPC, -15.17, -5, 8.98, 2, 0)
	MovementLoopAddLocation(NPC, -15.11, -5, 10.15, 2, 0)
	MovementLoopAddLocation(NPC, -13.29, -5, 12.61, 2, 0)
	MovementLoopAddLocation(NPC, -10.74, -5, 15.16, 2, 0)
	MovementLoopAddLocation(NPC, -5.99, -5.25, 19.61, 2, 0)
	MovementLoopAddLocation(NPC, -5.08, -5.5, 21.54, 2, 0)
	MovementLoopAddLocation(NPC, 0.69, -5.5, 22.23, 2, 0)
	MovementLoopAddLocation(NPC, 2.69, -5.5, 22.91, 2, 0)
	MovementLoopAddLocation(NPC, 4.32, -5.5, 27.3, 2, 0)
	MovementLoopAddLocation(NPC, 8.87, -5.5, 30.72, 2, 0)
	MovementLoopAddLocation(NPC, 13.89, -5.5, 32.62, 2, 0)
	MovementLoopAddLocation(NPC, 14.2, -5.75, 34.73, 2, 0)
	MovementLoopAddLocation(NPC, 12.99, -6, 36.26, 2, 30)
	MovementLoopAddLocation(NPC, 12.99, -6, 36.26, 2, 0)
	MovementLoopAddLocation(NPC, 14.43, -6, 35.89, 2, 0)
	MovementLoopAddLocation(NPC, 18.78, -6, 35.17, 2, 0)
	MovementLoopAddLocation(NPC, 22.34, -6, 35.64, 2, 0)
	MovementLoopAddLocation(NPC, 24.65, -6, 33.8, 2, 0)
	MovementLoopAddLocation(NPC, 27.91, -5.25, 30.13, 2, 0)
	MovementLoopAddLocation(NPC, 35.48, -5, 31.14, 2, 0)
	MovementLoopAddLocation(NPC, 37.5, -5, 31.83, 2, 0)
	MovementLoopAddLocation(NPC, 46.63, -5, 33.93, 2, 0)
	MovementLoopAddLocation(NPC, 51.05, -5, 35.28, 2, 0)
	MovementLoopAddLocation(NPC, 51.79, -5, 38.03, 2, 0)
	MovementLoopAddLocation(NPC, 52.3, -6.25, 48.1, 2, 0)
	MovementLoopAddLocation(NPC, 51.35, -6.53, 51.57, 2, 0)
	MovementLoopAddLocation(NPC, 46.15, -6.91, 64.68, 2, 20)
	MovementLoopAddLocation(NPC, 46.92, -6.92, 62.68, 2, 0)
	MovementLoopAddLocation(NPC, 45.14, -6.94, 60, 2, 0)
	MovementLoopAddLocation(NPC, 41.27, -7, 55.16, 2, 0)
	MovementLoopAddLocation(NPC, 38.05, -7, 53.58, 2, 0)
	MovementLoopAddLocation(NPC, 16.08, -7, 51.23, 2, 0)
	MovementLoopAddLocation(NPC, 3.03, -7, 46.82, 2, 0)
	MovementLoopAddLocation(NPC, 3.64, -6.5, 42.06, 2, 0)
	MovementLoopAddLocation(NPC, 5.09, -6, 37.23, 2, 0)
	MovementLoopAddLocation(NPC, 6.94, -5.75, 32.12, 2, 0)
	MovementLoopAddLocation(NPC, 13.22, -5, 28.38, 2, 0)
	MovementLoopAddLocation(NPC, 17.25, -5, 26.51, 2, 0)
	MovementLoopAddLocation(NPC, 24.06, -5, 24.71, 2, 0)
	MovementLoopAddLocation(NPC, 31.39, -5, 23.08, 2, 0)
	MovementLoopAddLocation(NPC, 35.45, -4.37, 22.8, 2, 0)
	MovementLoopAddLocation(NPC, 39.69, -2.26, 23.72, 2, 0)
	MovementLoopAddLocation(NPC, 45.16, 0.45, 24.74, 2, 0)
	MovementLoopAddLocation(NPC, 49.07, 1.89, 24.7, 2, 0)
	MovementLoopAddLocation(NPC, 49.51, 2, 23.65, 2, 0)
	MovementLoopAddLocation(NPC, 48.63, 2, 19.79, 2, 0)
	MovementLoopAddLocation(NPC, 47.8, 2, 15.42, 2, 0)
	MovementLoopAddLocation(NPC, 36.86, 2, 11.68, 2, 0)
	MovementLoopAddLocation(NPC, 33.37, 2.5, 10.68, 2, 0)
	MovementLoopAddLocation(NPC, 29.42, 3.5, 5.52, 2, 0)
	MovementLoopAddLocation(NPC, 28.22, 3.5, -0.55, 2, 0)
	MovementLoopAddLocation(NPC, 30.71, 5.25, -8.57, 2, 0)
	MovementLoopAddLocation(NPC, 33.05, 5.25, -11.71, 2, 0)
	MovementLoopAddLocation(NPC, 36.01, 5.25, -14.42, 2, 0)
	MovementLoopAddLocation(NPC, 42.85, 5.25, -16.72, 2, 0)
	MovementLoopAddLocation(NPC, 51.05, 5, -21.04, 2, 0)
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
        PlayFlavor(NPC,"","","sniff",0,0)
        else
        PlayFlavor(NPC,"","","happy",0,0)
        end            
    AddTimer(NPC,6000, "Drink3")
end

function Drink3(NPC)
        PlayFlavor(NPC,"","","drinking_idle",0,0)
end
