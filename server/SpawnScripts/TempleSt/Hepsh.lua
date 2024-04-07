--[[
    Script Name    : SpawnScripts/TempleSt/Hepsh.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.28 04:10:26
    Script Purpose : 
                   : 
--]]

dofile("SpawnScripts/Generic/GenericEcologyVoiceOvers.lua")

function spawn(NPC)
SetPlayerProximityFunction(NPC, 6, "InRange", "LeaveRange")		
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
	MovementLoopAddLocation(NPC, -26.88, 3, 86.99, 1, 1)
	MovementLoopAddLocation(NPC, -26.88, 3, 86.99, 1, MakeRandomInt(25,40),"Action")
	MovementLoopAddLocation(NPC, -30.89, 3, 78.42, 1, 1)
	MovementLoopAddLocation(NPC, -30.89, 3, 78.42, 1, MakeRandomInt(25,40),"Action")
	MovementLoopAddLocation(NPC, -30.16, 3, 77.61, 1, 0)
	MovementLoopAddLocation(NPC, -29.12, 3, 79.07, 1, 0)
	MovementLoopAddLocation(NPC, -27.03, 3, 83, 1, 0)
	MovementLoopAddLocation(NPC, -26.94, 3, 86.61, 1, 1)
	MovementLoopAddLocation(NPC, -26.94, 3, 86.61, 1, MakeRandomInt(25,40),"EcologyEmote")
	MovementLoopAddLocation(NPC, -22.16, 3, 83.11, 1, 0)
	MovementLoopAddLocation(NPC, -18.3, 3, 80.7, 1, 0)
	MovementLoopAddLocation(NPC, -10.17, 3, 75.98, 1, 2,"Door")
	MovementLoopAddLocation(NPC, -12.6, 3.03, 71.36, 1, 0,"Door")
	MovementLoopAddLocation(NPC, -14.69, 3.03, 70.56, 1, 1)
	MovementLoopAddLocation(NPC, -14.69, 3.03, 70.56, 1, MakeRandomInt(25,40),"EcologyEmote")
	MovementLoopAddLocation(NPC, -14.02, 3.03, 69.37, 1, 1)
	MovementLoopAddLocation(NPC, -14.02, 3.03, 69.37, 1, MakeRandomInt(25,40),"EcologyEmote")
	MovementLoopAddLocation(NPC, -14.34, 3.03, 71.38, 1, 0)
	MovementLoopAddLocation(NPC, -12.94, 3.03, 71.49, 1, 2,"Door")
	MovementLoopAddLocation(NPC, -9.63, 3, 76.24, 1, 0,"Door")
	MovementLoopAddLocation(NPC, -6.65, 3, 74.89, 1, 0)
	MovementLoopAddLocation(NPC, -6.23, 3, 74.2, 1, 1)
	MovementLoopAddLocation(NPC, -6.23, 3, 74.2, 1, MakeRandomInt(25,40),"EcologyEmote")
	MovementLoopAddLocation(NPC, -8.12, 3, 76.54, 1, 0)
	MovementLoopAddLocation(NPC, -11.67, 3, 77.2, 1, 0)
	MovementLoopAddLocation(NPC, -16.8, 3, 81.5, 1, 0)
	MovementLoopAddLocation(NPC, -20.81, 3, 83.83, 1, 0)
	MovementLoopAddLocation(NPC, -23.52, 3.04, 84.69, 1, 0)
end

function Action(NPC)
    local choice = MakeRandomInt(1, 4)
    if choice == 1 then
        PlayFlavor(NPC, "", "", "peer", 0, 0)
    elseif choice == 2 then
        PlayFlavor(NPC, "", "", "ponder", 0, 0)
    elseif choice == 3 then
        PlayFlavor(NPC, "", "", "stare", 0, 0)
    elseif choice == 4 then
        PlayFlavor(NPC, "", "", "tapfoot", 0, 0)
    end
end 

function Door(NPC,Spawn)
    local door = GetSpawn(NPC, 1360079)
    UseWidget(door)
end


