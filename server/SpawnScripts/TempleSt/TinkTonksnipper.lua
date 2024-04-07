--[[
    Script Name    : SpawnScripts/TempleSt/TinkTonksnipper.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.28 03:10:17
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
GenericRaceCheckHail(NPC, Spawn, faction)
end

function InRange(NPC,Spawn)
GenericRaceCheckCallout(NPC, Spawn, faction)
end
    
function respawn(NPC)
		spawn(NPC)
	end


function waypoints(NPC)
	MovementLoopAddLocation(NPC, 15.82, 3, 78.54, 2, 0)
	MovementLoopAddLocation(NPC, 15.06, 3, 80.53, 2, 0)
	MovementLoopAddLocation(NPC, 12.75, 3, 82.45, 2, 0)
	MovementLoopAddLocation(NPC, 3.96, 3, 86.64, 2, 0)
	MovementLoopAddLocation(NPC, -6.12, 3, 92.35, 2, 0)
	MovementLoopAddLocation(NPC, -5.71, 3, 94.1, 2, 0)
	MovementLoopAddLocation(NPC, -3.96, 3, 96.94, 2, 0)
	MovementLoopAddLocation(NPC, -6.72, 3, 102.07, 2, 0)
	MovementLoopAddLocation(NPC, -13.37, 3, 105.11, 2, 0)
	MovementLoopAddLocation(NPC, -17.99, 2.75, 105.42, 2, 0)
	MovementLoopAddLocation(NPC, -33.91, 2.83, 113.82, 2, 0)
	MovementLoopAddLocation(NPC, -35.11, 2.83, 117.53, 2, 0)
	MovementLoopAddLocation(NPC, -33.36, 2.82, 122.34, 2, 1)
	MovementLoopAddLocation(NPC, -33.36, 2.82, 122.34, 2, MakeRandomInt(20,33),"EcologyEmotes")
	MovementLoopAddLocation(NPC, -33.36, 2.82, 122.34, 2, 0)
	MovementLoopAddLocation(NPC, -37.43, 2.84, 120.85, 2, 1)
	MovementLoopAddLocation(NPC, -37.43, 2.84, 120.85, 2, MakeRandomInt(20,33),"EcologyEmotes")
	MovementLoopAddLocation(NPC, -37.43, 2.84, 120.85, 2, 0)
	MovementLoopAddLocation(NPC, -37.43, 2.85, 118.14, 2, 0)
	MovementLoopAddLocation(NPC, -35.93, 2.85, 112.96, 2, 0)
	MovementLoopAddLocation(NPC, -31.07, 2.79, 110.23, 2, 0)
	MovementLoopAddLocation(NPC, -26.75, 2.84, 106.56, 2, 0)
	MovementLoopAddLocation(NPC, -17.15, 3, 102.03, 2, 0)
	MovementLoopAddLocation(NPC, -14.07, 3, 104.13, 2, 0)
	MovementLoopAddLocation(NPC, -6.86, 3, 100.57, 2, 0)
	MovementLoopAddLocation(NPC, -6.05, 3, 98.24, 2, 0)
	MovementLoopAddLocation(NPC, -7.04, 3, 93.38, 2, 0)
	MovementLoopAddLocation(NPC, -4.36, 3, 89.01, 2, 0)
	MovementLoopAddLocation(NPC, 1.39, 3, 86.32, 2, 0)
	MovementLoopAddLocation(NPC, 7.47, 3, 84.59, 2, 0)
	MovementLoopAddLocation(NPC, 12.98, 3, 82.01, 2, 0)
	MovementLoopAddLocation(NPC, 15.05, 3, 79.38, 2, 0)
	MovementLoopAddLocation(NPC, 18.84, 3.01, 78.23, 2, 0)
	MovementLoopAddLocation(NPC, 27.41, 3, 72.98, 2, 1)
	MovementLoopAddLocation(NPC, 27.41, 3, 72.98, 2, MakeRandomInt(20,33),"EcologyEmotes")
	MovementLoopAddLocation(NPC, 26.54, 3, 74, 2, 0)
	MovementLoopAddLocation(NPC, 33.89, 3, 79.3, 2, 0)
	MovementLoopAddLocation(NPC, 35.1, 3.14, 80.71, 2, 1)
	MovementLoopAddLocation(NPC, 35.1, 3.14, 80.71, 2, MakeRandomInt(20,33),"EcologyEmotes")
	MovementLoopAddLocation(NPC, 35.95, 3, 79.79, 2, 0)
	MovementLoopAddLocation(NPC, 34.75, 3, 78.57, 2, 0)
	MovementLoopAddLocation(NPC, 31.89, 3, 79.47, 2, 0)
	MovementLoopAddLocation(NPC, 25.06, 3, 83.17, 2, 0)
	MovementLoopAddLocation(NPC, 18.72, 3, 82.92, 2, 0)
	MovementLoopAddLocation(NPC, 14.91, 3, 80.02, 2, 0)
	MovementLoopAddLocation(NPC, 12.51, 3.00, 77.51, 2, 1)
	MovementLoopAddLocation(NPC, 12.51, 3.00, 77.51, 2, MakeRandomInt(20,33),"EcologyEmotes")
end


