--[[
    Script Name    : SpawnScripts/TempleSt/DrobbixWangleport.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.28 03:10:04
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/GenericEcologyVoiceOvers.lua")
dofile("SpawnScripts/Generic/UnknownLanguage.lua")

function spawn(NPC)
SetPlayerProximityFunction(NPC, 6, "InRange", "LeaveRange")		
waypoints(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
    if not HasLanguage(Spawn,6)then
    Garbled(NPC,Spawn)
    else
    GenericEcology2Hail(NPC, Spawn, faction)
end
end

function InRange(NPC,Spawn)
if GetFactionAmount(Spawn,12)<0 then
    FactionCheckCallout(NPC,Spawn,faction)
    else
    if not HasLanguage(Spawn,6)then
        if math.random(0,100)<40 then
     	FaceTarget(NPC, Spawn)
        Garbled(NPC,Spawn)
        end
    else
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
	MovementLoopAddLocation(NPC, -0.13, 3, 69.75, 2, 1)
	MovementLoopAddLocation(NPC, -0.13, 3, 69.75, 2, 9,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 1.49, 3, 69.67, 2, 0)
	MovementLoopAddLocation(NPC, 6.01, 3, 66.28, 2, 0)
	MovementLoopAddLocation(NPC, 8.08, 3, 64.2, 2, 0)
	MovementLoopAddLocation(NPC, 8.84, 3.1, 62.79, 2, 0)
	MovementLoopAddLocation(NPC, 8.45, 3.05, 61.79, 2, 0)
	MovementLoopAddLocation(NPC, 6.68, 3.05, 60.22, 2, 1)
	MovementLoopAddLocation(NPC, 6.68, 3.05, 60.22, 2, 20,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 8.27, 3.05, 60.36, 2, 0)
	MovementLoopAddLocation(NPC, 9.19, 3.1, 62.83, 2, 0)
	MovementLoopAddLocation(NPC, 8.4, 3, 65.43, 2, 0)
	MovementLoopAddLocation(NPC, 9.88, 3, 72.99, 2, 1)
	MovementLoopAddLocation(NPC, 9.88, 3, 72.99, 2, 20,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 9.87, 3, 71.39, 2, 0)
	MovementLoopAddLocation(NPC, 7.55, 3, 69.95, 2, 0)
	MovementLoopAddLocation(NPC, -1.04, 3, 74.89, 2, 0)
	MovementLoopAddLocation(NPC, -4.14, 3, 71.86, 2, 2,"Door")
	MovementLoopAddLocation(NPC, -6.55, 3, 66.59, 2, 1,"Door")
	MovementLoopAddLocation(NPC, -6.55, 3, 66.59, 2, 30,"EcologyEmotes")
	MovementLoopAddLocation(NPC, -7.63, 3, 68.17, 2, 1)
	MovementLoopAddLocation(NPC, -7.63, 3, 68.17, 2, 30,"EcologyEmotes")
	MovementLoopAddLocation(NPC, -6.22, 3, 68.95, 2, 2,"Door")
	MovementLoopAddLocation(NPC, -3.9, 3, 72.09, 2, 0,"Door")
	MovementLoopAddLocation(NPC, -1.1, 3, 70.3, 2, 0)
	MovementLoopAddLocation(NPC, 16.13, 3.01, 69.46, 2, 0)
	MovementLoopAddLocation(NPC, 17.6, 3.01, 69.63, 2, 0)
	MovementLoopAddLocation(NPC, 19.61, 3.02, 67.38, 2, 0)
	MovementLoopAddLocation(NPC, 21.14, 2.9, 63.64, 2, 0)
	MovementLoopAddLocation(NPC, 20.21, 2.93, 58.37, 2, 1)
	MovementLoopAddLocation(NPC, 20.21, 2.93, 58.37, 2, 30,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 21.16, 2.89, 58.96, 2, 0)
	MovementLoopAddLocation(NPC, 22.71, 2.96, 61.57, 2, 0)
	MovementLoopAddLocation(NPC, 22.18, 2.95, 65.19, 2, 0)
	MovementLoopAddLocation(NPC, 20.63, 2.95, 68.28, 2, 0)
	MovementLoopAddLocation(NPC, 16.65, 3.01, 69.91, 2, 0)
	MovementLoopAddLocation(NPC, 10.05, 3, 71.04, 2, 0)
	MovementLoopAddLocation(NPC, 7.41, 3, 70.44, 2, 0)
	MovementLoopAddLocation(NPC, 2.1, 3, 72.41, 2, 0)
end


function Door(NPC,Spawn)
    local door = GetSpawn(NPC, 1360080)
    UseWidget(door)
end
