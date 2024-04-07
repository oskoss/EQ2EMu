--[[
    Script Name    : SpawnScripts/Longshadow/VerinaGYul.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.14 07:10:21
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
    GenericEcology2Hail(NPC, Spawn, faction)
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
        --PlayFlavor(NPC,"","","",0,0,Spawn)
        end
    else
    GenericEcology2Hail(NPC, Spawn, faction)
end
end
end
 
    
function respawn(NPC)
		spawn(NPC)
	end

function Forge(NPC)
    SetHeading(NPC,235)
end


function waypoints(NPC)
	MovementLoopAddLocation(NPC, -11.85, 0, 17.41, 2, 1)
	MovementLoopAddLocation(NPC, -11.85, 0, 17.41, 2, 20,"Action")
	MovementLoopAddLocation(NPC, -11.85, 0, 17.41, 2, 0)
	MovementLoopAddLocation(NPC, -14.04, 0, 11.82, 2, 0)
	MovementLoopAddLocation(NPC, -15.24, 0, 3.05, 2, 0)
	MovementLoopAddLocation(NPC, -10.72, 0, -7.44, 2, 0)
	MovementLoopAddLocation(NPC, -7.79, 0.08, -12.29, 2, 0)
	MovementLoopAddLocation(NPC, -0.02, 0, -14.69, 2, 0)
	MovementLoopAddLocation(NPC, 7.15, 0, -13.02, 2, 0)
	MovementLoopAddLocation(NPC, 11.95, 0, -11.39, 2, 0)
	MovementLoopAddLocation(NPC, 19.32, -0.01, -12.65, 2, 0)
	MovementLoopAddLocation(NPC, 19.92, -0.01, -15.37, 2, 1,"Forge")
	MovementLoopAddLocation(NPC, 19.92, -0.01, -15.37, 2, 30,"Action")
	MovementLoopAddLocation(NPC, 20.15, -0.01, -15.09, 2, 0)
	MovementLoopAddLocation(NPC, 20.13, -0.01, -13.18, 2, 0)
	MovementLoopAddLocation(NPC, 18.56, 0.11, -12.06, 2, 0)
	MovementLoopAddLocation(NPC, 15.06, 0, -11.69, 2, 0)
	MovementLoopAddLocation(NPC, 16.34, 0, -19, 2, 0)
	MovementLoopAddLocation(NPC, 20.45, -0.31, -21.46, 2, 0)
	MovementLoopAddLocation(NPC, 31.95, -1.41, -23.31, 2, 0)
	MovementLoopAddLocation(NPC, 38.68, -1.33, -20.08, 2, 0)
	MovementLoopAddLocation(NPC, 39.94, -1.58, -10.09, 2, 0)
	MovementLoopAddLocation(NPC, 40.16, -1.22, -0.38, 2, 2,"Door")
	MovementLoopAddLocation(NPC, 47.39, -1.02, 1.42, 2, 0,"Door")
	MovementLoopAddLocation(NPC, 52.01, -1.02, 6.16, 2, 0)
	MovementLoopAddLocation(NPC, 55.11, -1.02, 12.28, 2, 1)
	MovementLoopAddLocation(NPC, 55.11, -1.02, 12.28, 2, 40,"Action")
	MovementLoopAddLocation(NPC, 51.16, -1.02, 5.38, 2, 0)
	MovementLoopAddLocation(NPC, 45.43, -1.02, 1.5, 2, 2,"Door")
	MovementLoopAddLocation(NPC, 39.12, -1.26, -0.42, 2, 0,"Door")
	MovementLoopAddLocation(NPC, 35.37, -0.2, 8.62, 2, 0)
	MovementLoopAddLocation(NPC, 28.26, 0.84, 15.61, 2, 0)
	MovementLoopAddLocation(NPC, 20.7, 1.87, 23.56, 2, 0)
	MovementLoopAddLocation(NPC, 12.77, 2.36, 28.43, 2, 0)
	MovementLoopAddLocation(NPC, 5.44, 2.9, 31.5, 2, 0)
	MovementLoopAddLocation(NPC, -3.18, 2.98, 33.59, 2, 0)
	MovementLoopAddLocation(NPC, -19.51, 3.89, 30.97, 2, 0)
	MovementLoopAddLocation(NPC, -26.83, 4.32, 28.36, 2, 0)
	MovementLoopAddLocation(NPC, -42.03, 4.19, 20.98, 2, 0)
	MovementLoopAddLocation(NPC, -54.29, 3.75, 13.73, 2, 0)
	MovementLoopAddLocation(NPC, -55.57, 2.04, -0.34, 2, 0)
	MovementLoopAddLocation(NPC, -51.23, 0.27, -12.31, 2, 0)
	MovementLoopAddLocation(NPC, -43.92, 0, -13.95, 2, 0)
	MovementLoopAddLocation(NPC, -40.01, 0.07, -12.29, 2, 0)
	MovementLoopAddLocation(NPC, -33.9, 0, -11.07, 2, 0)
	MovementLoopAddLocation(NPC, -24.54, 0.08, -8.37, 2, 0)
	MovementLoopAddLocation(NPC, -21.42, 0, -6.68, 2, 0)
	MovementLoopAddLocation(NPC, -18.34, 0, -1.79, 2, 0)
	MovementLoopAddLocation(NPC, -18.32, 0, 3.61, 2, 1)
	MovementLoopAddLocation(NPC, -18.32, 0, 3.61, 2, 11,"Action")
	MovementLoopAddLocation(NPC, -15.16, 0, 8.3, 2, 0)
	MovementLoopAddLocation(NPC, -14.23, 0, 16.4, 2, 0)
end

function Door(NPC,Spawn)
    local door = GetSpawn(NPC, 1380081)
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