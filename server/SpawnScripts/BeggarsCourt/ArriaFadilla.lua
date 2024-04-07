--[[
    Script Name    : SpawnScripts/BeggarsCourt/ArriaFadilla.lua
    Script Author  : Dorbin
    Script Date    : 2023.11.28 04:11:38
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
	MovementLoopAddLocation(NPC, 50.91, -7.08, 101.7, 2, 1)
	MovementLoopAddLocation(NPC, 50.91, -7.08, 101.7, 2, MakeRandomInt(15,25),"EcologyEmotes")
	MovementLoopAddLocation(NPC, 54.62, -7.08, 97.3, 2, 0)
	MovementLoopAddLocation(NPC, 57.77, -7.08, 92.14, 2, 0)
	MovementLoopAddLocation(NPC, 57.36, -7.07, 86.32, 2, 0)
	MovementLoopAddLocation(NPC, 57.09, -6.61, 84.09, 2, 0)
	MovementLoopAddLocation(NPC, 53.26, -6.31, 72.98, 2, 0)
	MovementLoopAddLocation(NPC, 52.59, -7, 69.04, 2, 0)
	MovementLoopAddLocation(NPC, 50.76, -6.94, 65.11, 2, 0)
	MovementLoopAddLocation(NPC, 51.52, -7, 54.1, 2, 0)
	MovementLoopAddLocation(NPC, 54.14, -6.5, 49.72, 2, 1)
	MovementLoopAddLocation(NPC, 54.14, -6.5, 49.72, 2, MakeRandomInt(15,25),"EcologyEmotes")
	MovementLoopAddLocation(NPC, 42.7, -7, 53.16, 2, 0)
	MovementLoopAddLocation(NPC, 35.28, -7, 54.34, 2, 0)
	MovementLoopAddLocation(NPC, 16.55, -7, 55.2, 2, 0)
	MovementLoopAddLocation(NPC, 8.12, -7, 54.22, 2, 0)
	MovementLoopAddLocation(NPC, 2.35, -7, 50.98, 2, 0)
	MovementLoopAddLocation(NPC, 1, -6.64, 42.35, 2, 0)
	MovementLoopAddLocation(NPC, -0.23, -6, 37.28, 2, 0)
	MovementLoopAddLocation(NPC, -1.03, -6, 33.48, 2, 1)
	MovementLoopAddLocation(NPC, -1.03, -6, 33.48, 2, MakeRandomInt(15,25),"EcologyEmotes")
	MovementLoopAddLocation(NPC, 2.07, -6, 32.62, 2, 0)
	MovementLoopAddLocation(NPC, 9.72, -5.5, 31.18, 2, 0)
	MovementLoopAddLocation(NPC, 12.37, -5.5, 32.28, 2, 0)
	MovementLoopAddLocation(NPC, 15.99, -5.5, 32.38, 2, 0)
	MovementLoopAddLocation(NPC, 20.59, -5.5, 31.66, 2, 0)
	MovementLoopAddLocation(NPC, 25.68, -6, 33.46, 2, 0)
	MovementLoopAddLocation(NPC, 29.49, -5.75, 37.28, 2, 0)
	MovementLoopAddLocation(NPC, 31.92, -5.5, 37.82, 2, 0)
	MovementLoopAddLocation(NPC, 33.54, -5.25, 37.01, 2, 0)
	MovementLoopAddLocation(NPC, 36.7, -5, 35.4, 2, 15)
	MovementLoopAddLocation(NPC, 38.99, -5, 35.31, 2, 0)
	MovementLoopAddLocation(NPC, 40.23, -5, 37.18, 2, 0)
	MovementLoopAddLocation(NPC, 39.25, -5.25, 40.31, 2, 0)
	MovementLoopAddLocation(NPC, 34.49, -6, 45.11, 2, 0)
	MovementLoopAddLocation(NPC, 26.32, -7, 56.09, 2, 0)
	MovementLoopAddLocation(NPC, 20.85, -7, 64.2, 2, MakeRandomInt(15,25),"EcologyEmotes")
	MovementLoopAddLocation(NPC, 23.57, -7, 57.06, 2, 0)
	MovementLoopAddLocation(NPC, 28.69, -7, 53.53, 2, 0)
	MovementLoopAddLocation(NPC, 39.23, -7, 52.23, 2, 0)
	MovementLoopAddLocation(NPC, 47.18, -7, 57.08, 2, 0)
	MovementLoopAddLocation(NPC, 56.63, -6.97, 68.98, 2, 1)
	MovementLoopAddLocation(NPC, 56.63, -6.97, 68.98, 2, MakeRandomInt(15,25),"EcologyEmotes")
	MovementLoopAddLocation(NPC, 55.31, -7, 67.76, 2, 0)
	MovementLoopAddLocation(NPC, 52.97, -7, 68.62, 2, 0)
	MovementLoopAddLocation(NPC, 55.09, -6.47, 76.1, 2, 0)
	MovementLoopAddLocation(NPC, 57.57, -6.53, 82.93, 2, 0)
	MovementLoopAddLocation(NPC, 58.63, -7.05, 86.71, 2, 0)
	MovementLoopAddLocation(NPC, 60.11, -7.08, 90.9, 2, 0)
	MovementLoopAddLocation(NPC, 56.54, -7.08, 95, 2, 0)
	MovementLoopAddLocation(NPC, 48.89, -7.08, 102.31, 2, 0)
	MovementLoopAddLocation(NPC, 46.63, -7.08, 111.38, 2, 1)
	MovementLoopAddLocation(NPC, 46.63, -7.08, 111.38, 2, MakeRandomInt(15,20),"EcologyEmotes")
end


