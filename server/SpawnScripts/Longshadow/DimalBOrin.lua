--[[
    Script Name    : SpawnScripts/Longshadow/DimalBOrin.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.14 07:10:02
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/GenericEcologyVoiceOvers.lua")
dofile("SpawnScripts/Generic/UnknownLanguage.lua")

function spawn(NPC)
SetPlayerProximityFunction(NPC, 7, "InRange", "LeaveRange")		
waypoints(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
    if not HasLanguage(Spawn,2)then
    Garbled(NPC,Spawn)
    --PlayFlavor(NPC,"","","shrug",0,0,Spawn)
    else
    GenericEcologyHail(NPC, Spawn, faction)
end
end

function InRange(NPC,Spawn)
if GetFactionAmount(Spawn,12)<0 then
    FactionCheckCallout(NPC,Spawn,faction)
    else
    if not HasLanguage(Spawn,2)then
        if math.random(0,100)<40 then
     	FaceTarget(NPC, Spawn)
        Garbled(NPC,Spawn)
        end
    else
        GenericEcologyHail(NPC, Spawn, faction)
end
end
end
    
function respawn(NPC)
		spawn(NPC)
	end
	
function Door(NPC,Spawn)
    local door = GetSpawn(NPC, 1380083)
    UseWidget(door)
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

function waypoints(NPC)
	MovementLoopAddLocation(NPC, -5.64, 3, 71.95, 2, 1)
	MovementLoopAddLocation(NPC, -5.64, 3, 71.95, 2, MakeRandomInt(20,30),"Action")
	MovementLoopAddLocation(NPC, -3.33, 3, 66.71, 2, 0)
	MovementLoopAddLocation(NPC, -0.33, 3, 57.94, 2, 0)
	MovementLoopAddLocation(NPC, 6.91, 3, 53.28, 2, 0)
	MovementLoopAddLocation(NPC, 6.97, 3, 51.69, 2, 0)
	MovementLoopAddLocation(NPC, 3.44, 3, 37.48, 2, 0)
	MovementLoopAddLocation(NPC, 2.75, 2.98, 33.01, 2, 0)
	MovementLoopAddLocation(NPC, 1.73, 2.98, 32.97, 2, 0)
	MovementLoopAddLocation(NPC, -7.37, 3, 33.77, 2, 0)
	MovementLoopAddLocation(NPC, -26.37, 4.21, 27.5, 2, 0)
	MovementLoopAddLocation(NPC, -43.72, 4.09, 20.05, 2, 0)
	MovementLoopAddLocation(NPC, -52.25, 4.16, 15.67, 2, 0)
	MovementLoopAddLocation(NPC, -55.56, 4, 15.67, 2, 1)
	MovementLoopAddLocation(NPC, -55.56, 4, 15.67, 2, MakeRandomInt(15,30),"Action")
	MovementLoopAddLocation(NPC, -54.98, 3.8, 13.49, 2, 0)
	MovementLoopAddLocation(NPC, -56.13, 3.02, 7.88, 2, 0)
	MovementLoopAddLocation(NPC, -57.44, 2.32, 1.96, 2, 2,"Door")
	MovementLoopAddLocation(NPC, -62.04, 2.5, 1.3, 2, 0)
	MovementLoopAddLocation(NPC, -62.88, 2.5, -0.25, 2, 1,"Door")
	MovementLoopAddLocation(NPC, -62.88, 2.5, -0.25, 2, MakeRandomInt(15,30),"Action")
	MovementLoopAddLocation(NPC, -62.79, 2.5, 2, 2, 1)
	MovementLoopAddLocation(NPC, -62.79, 2.5, 2, 2, 20,"Action")
	MovementLoopAddLocation(NPC, -61.01, 2.5, 1.46, 2, 2,"Door")
	MovementLoopAddLocation(NPC, -57.9, 2.4, 1.61, 2, 0,"Door")
	MovementLoopAddLocation(NPC, -57.38, 2.31, 1.6, 2, 0)
	MovementLoopAddLocation(NPC, -52.25, 3.58, 10.09, 2, 0)
	MovementLoopAddLocation(NPC, -50.49, 4.19, 14.02, 2, 0)
	MovementLoopAddLocation(NPC, -42.15, 4.05, 18.54, 2, 0)
	MovementLoopAddLocation(NPC, -34.44, 4.42, 22.51, 2, 0)
	MovementLoopAddLocation(NPC, -19.58, 3.92, 27.71, 2, 0)
	MovementLoopAddLocation(NPC, -12.95, 3.4, 30.12, 2, 0)
	MovementLoopAddLocation(NPC, -3.44, 2.97, 30.88, 2, 0)
	MovementLoopAddLocation(NPC, 7.15, 2.82, 28.05, 2, 0)
	MovementLoopAddLocation(NPC, 13.93, 2.16, 24.98, 2, 0)
	MovementLoopAddLocation(NPC, 15.64, 1.86, 24.19, 2, 0)
	MovementLoopAddLocation(NPC, 15.13, 1.94, 22.4, 2, 0)
	MovementLoopAddLocation(NPC, 9.65, 0.67, 15.41, 2, 0)
	MovementLoopAddLocation(NPC, 8.12, 0, 11.94, 2, 0)
	MovementLoopAddLocation(NPC, 7.18, 0, 8.8, 2, 0)
	MovementLoopAddLocation(NPC, 9.55, 0, 4.49, 2, 0)
	MovementLoopAddLocation(NPC, 10.14, 0, -0.9, 2, 0)
	MovementLoopAddLocation(NPC, 7.17, 0.04, -21.59, 2, 1)
	MovementLoopAddLocation(NPC, 7.17, 0.04, -21.59, 2, 30,"Action")
	MovementLoopAddLocation(NPC, 5.5, 0.04, -19.47, 2, 0)
	MovementLoopAddLocation(NPC, -0.28, 0, -14.19, 2, 0)
	MovementLoopAddLocation(NPC, -6.51, 0.09, -11.75, 2, 0)
	MovementLoopAddLocation(NPC, -17.94, 0.08, -14.58, 2, 0)
	MovementLoopAddLocation(NPC, -25.99, 0.02, -18.93, 2, 0)
	MovementLoopAddLocation(NPC, -31.88, -0.08, -22.43, 2, 0)
	MovementLoopAddLocation(NPC, -35.26, -1, -27.91, 2, 1)
	MovementLoopAddLocation(NPC, -35.26, -1, -27.91, 2, MakeRandomInt(10,20),"Action")
	MovementLoopAddLocation(NPC, -34.13, -1.02, -26.75, 2, 0)
	MovementLoopAddLocation(NPC, -32.93, -1.73, -30.89, 2, 0)
	MovementLoopAddLocation(NPC, -33.52, -2.14, -35.16, 2, 0)
	MovementLoopAddLocation(NPC, -37.78, -1.63, -32.35, 2, 0)
	MovementLoopAddLocation(NPC, -39.73, -1.15, -31.44, 2, 0)
	MovementLoopAddLocation(NPC, -43.56, -0.39, -27.35, 2, 0)
	MovementLoopAddLocation(NPC, -49.45, 0.24, -11.32, 2, 0)
	MovementLoopAddLocation(NPC, -51.79, 1.71, -0.98, 2, 0)
	MovementLoopAddLocation(NPC, -53.79, 2.48, 5.75, 2, 0)
	MovementLoopAddLocation(NPC, -51.87, 3.73, 12.09, 2, 0)
	MovementLoopAddLocation(NPC, -48.9, 4.06, 15.16, 2, 0)
	MovementLoopAddLocation(NPC, -38.9, 4.37, 20.72, 2, 0)
	MovementLoopAddLocation(NPC, -24.29, 4.31, 25.98, 2, 0)
	MovementLoopAddLocation(NPC, -14.9, 3.45, 29.35, 2, 0)
	MovementLoopAddLocation(NPC, -8.13, 3, 31.19, 2, 0)
	MovementLoopAddLocation(NPC, -1.41, 2.94, 30.52, 2, 0)
	MovementLoopAddLocation(NPC, 3.33, 3, 34.36, 2, 0)
	MovementLoopAddLocation(NPC, 7.72, 3, 39.72, 2, 0)
	MovementLoopAddLocation(NPC, 10.75, 3, 48.38, 2, 0)
	MovementLoopAddLocation(NPC, 7.87, 3, 52.45, 2, 0)
	MovementLoopAddLocation(NPC, 4.14, 3, 54.61, 2, 0)
	MovementLoopAddLocation(NPC, 0.18, 3, 56.98, 2, 0)
	MovementLoopAddLocation(NPC, -4.11, 3, 70.72, 2, 0)
end


	