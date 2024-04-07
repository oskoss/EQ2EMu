--[[
    Script Name    : SpawnScripts/BeggarsCourt/JuniaCalvina.lua
    Script Author  : Dorbin
    Script Date    : 2023.11.28 05:11:10
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



function waypoints(NPC)
	MovementLoopAddLocation(NPC, -13.6, 4, -43, 2, 0)
	MovementLoopAddLocation(NPC, -17.5, 4, -45.15, 2, 0)
	MovementLoopAddLocation(NPC, -20.06, 4, -42.64, 2, 0)
	MovementLoopAddLocation(NPC, -22.21, 4, -39.74, 2, 1)
	MovementLoopAddLocation(NPC, -22.21, 4, -39.74, 2, 10,"Action")
	MovementLoopAddLocation(NPC, -21.46, 4, -38.12, 2, 0)
	MovementLoopAddLocation(NPC, -18.87, 4, -35.27, 2, 0)
	MovementLoopAddLocation(NPC, -19.17, 3.75, -32.9, 2, 0)
	MovementLoopAddLocation(NPC, -22.19, 3, -31.23, 2, 0)
	MovementLoopAddLocation(NPC, -25.31, 2.5, -27.22, 2, 0)
	MovementLoopAddLocation(NPC, -23.61, 2.5, -20.45, 2, 0)
	MovementLoopAddLocation(NPC, -19.28, 2.5, -16.28, 2, 0)
	MovementLoopAddLocation(NPC, -13.81, 3, -13.86, 2, 0)
	MovementLoopAddLocation(NPC, -9.56, 3, -14.45, 2, 0)
	MovementLoopAddLocation(NPC, -7.88, 3, -15.75, 2, 0)
	MovementLoopAddLocation(NPC, -8.7, 3, -18.45, 2, 0)
	MovementLoopAddLocation(NPC, -12.29, 3, -17.9, 2, 1)
	MovementLoopAddLocation(NPC, -12.29, 3, -17.9, 2, 30,"Action")
	MovementLoopAddLocation(NPC, -12.29, 3, -17.9, 2, 0)
	MovementLoopAddLocation(NPC, -11.32, 3, -20.1, 2, 0)
	MovementLoopAddLocation(NPC, -16.54, 3, -21.25, 2, 0)
	MovementLoopAddLocation(NPC, -17.88, 3, -20.04, 2, 0)
	MovementLoopAddLocation(NPC, -17.96, 2.75, -15.76, 2, 0)
	MovementLoopAddLocation(NPC, -16.67, 2.5, -10.4, 2, 0)
	MovementLoopAddLocation(NPC, -15.58, 2, -4.67, 2, 0)
	MovementLoopAddLocation(NPC, -17.52, 2.04, 1.75, 2, 0)
	MovementLoopAddLocation(NPC, -19.4, 1.92, 5.66, 2, 0)
	MovementLoopAddLocation(NPC, -20.84, 1.88, 5.26, 2, 0)
	MovementLoopAddLocation(NPC, -23.52, 0.82, 3.94, 2, 0)
	MovementLoopAddLocation(NPC, -26.6, -0.75, 2.91, 2, 0)
	MovementLoopAddLocation(NPC, -27.16, -0.75, 4.86, 2, 0)
	MovementLoopAddLocation(NPC, -26.06, -0.86, 5.82, 2, 0)
	MovementLoopAddLocation(NPC, -24.88, -1.38, 6.04, 2, 0)
	MovementLoopAddLocation(NPC, -19.29, -4.51, 8.76, 2, 0)
	MovementLoopAddLocation(NPC, -18.05, -5.04, 9.61, 2, 0)
	MovementLoopAddLocation(NPC, -14, -5, 13.48, 2, 0)
	MovementLoopAddLocation(NPC, -12.85, -5.25, 15.89, 2, 0)
	MovementLoopAddLocation(NPC, -10.25, -5.5, 20.95, 2, 0)
	MovementLoopAddLocation(NPC, -9.5, -6, 25.22, 2, 0)
	MovementLoopAddLocation(NPC, -6.97, -6, 28.64, 2, 1)
	MovementLoopAddLocation(NPC, -6.97, -6, 28.64, 2, 30,"Action")
	MovementLoopAddLocation(NPC, -6.97, -6, 28.64, 2, 0)
	MovementLoopAddLocation(NPC, -10.74, -6, 27.61, 2, 0)
	MovementLoopAddLocation(NPC, -20.47, -6.8, 27.46, 2, 0)
	MovementLoopAddLocation(NPC, -26.93, -5.75, 24.54, 2, 0)
	MovementLoopAddLocation(NPC, -28.51, -5.5, 20.83, 2, 0)
	MovementLoopAddLocation(NPC, -28.02, -5.21, 18.75, 2, 0)
	MovementLoopAddLocation(NPC, -25.75, -5, 17.26, 2, 0)
	MovementLoopAddLocation(NPC, -22.16, -5, 15.75, 2, 0)
	MovementLoopAddLocation(NPC, -21.54, -5, 14.68, 2, 1)
	MovementLoopAddLocation(NPC, -21.54, -5, 14.68, 2, 10,"Action")
	MovementLoopAddLocation(NPC, -18.92, -5, 11.18, 2, 0)
	MovementLoopAddLocation(NPC, -19.54, -4.72, 10.22, 2, 0)
	MovementLoopAddLocation(NPC, -22.18, -3.33, 9.17, 2, 0)
	MovementLoopAddLocation(NPC, -27.88, -0.75, 6.76, 2, 0)
	MovementLoopAddLocation(NPC, -28.03, -0.75, 4.63, 2, 0)
	MovementLoopAddLocation(NPC, -27.35, -0.75, 2.02, 2, 0)
	MovementLoopAddLocation(NPC, -24.68, -0.11, 1.93, 2, 0)
	MovementLoopAddLocation(NPC, -20.03, 1.83, 3.85, 2, 0)
	MovementLoopAddLocation(NPC, -18.65, 2.04, 1.71, 2, 0)
	MovementLoopAddLocation(NPC, -16.5, 2, -3.57, 2, 0)
	MovementLoopAddLocation(NPC, -16.95, 2, -5.81, 2, 0)
	MovementLoopAddLocation(NPC, -20.7, 2.5, -13.77, 2, 0)
	MovementLoopAddLocation(NPC, -22.29, 2.5, -21.23, 2, 0)
	MovementLoopAddLocation(NPC, -24.58, 2.5, -25.95, 2, 0)
	MovementLoopAddLocation(NPC, -21.01, 3, -28.74, 2, 0)
	MovementLoopAddLocation(NPC, -18.07, 3.75, -32.73, 2, 0)
	MovementLoopAddLocation(NPC, -20.68, 4, -38.3, 2, 0)
	MovementLoopAddLocation(NPC, -18.64, 4, -43.86, 2, 0)
	MovementLoopAddLocation(NPC, -17.16, 4, -44.9, 2, 1)
	MovementLoopAddLocation(NPC, -17.16, 4, -44.9, 2, 10,"Action")
	MovementLoopAddLocation(NPC, -15.36, 4, -44.36, 2, 0)
	MovementLoopAddLocation(NPC, -13.5, 4, -44.04, 2, 0)
	MovementLoopAddLocation(NPC, -1.68, 4.75, -46.14, 2, 0)
	MovementLoopAddLocation(NPC, 0.42, 4.75, -48.58, 2, 1)
	MovementLoopAddLocation(NPC, 0.42, 4.75, -48.58, 2, 30,"Drink")
	MovementLoopAddLocation(NPC, 0.42, 4.75, -48.58, 2, 30,"Drink")
	MovementLoopAddLocation(NPC, 0.42, 4.75, -48.58, 2, 0)
	MovementLoopAddLocation(NPC, -0.69, 4.75, -46.76, 2, 0)
	MovementLoopAddLocation(NPC, -6.93, 4, -43.67, 2, 0)
	MovementLoopAddLocation(NPC, -10.95, 4, -41.51, 2, 0)
end

function Action(NPC)
    local choice = MakeRandomInt(1, 4)
    if choice == 1 then
        PlayFlavor(NPC, "", "", "mood_angry", 0, 0)
    elseif choice == 2 then
        PlayFlavor(NPC, "", "", "ponder", 0, 0)
    elseif choice == 3 then
        PlayFlavor(NPC, "", "", "sniff", 0, 0)
    elseif choice == 4 then
        PlayFlavor(NPC, "", "", "tapfoot", 0, 0)
    end
end 
