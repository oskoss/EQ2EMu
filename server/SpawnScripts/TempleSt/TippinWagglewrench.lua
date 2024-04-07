--[[
    Script Name    : SpawnScripts/TempleSt/TippinWagglewrench.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.28 03:10:33
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
GenericEcology2Hail(NPC, Spawn, faction)
end

function InRange(NPC,Spawn)
GenericEcology2Callout(NPC, Spawn, faction)
end
    
function respawn(NPC)
		spawn(NPC)
	end


function waypoints(NPC)
	MovementLoopAddLocation(NPC, 28.13, 3, 84.94, 2, 1)
	MovementLoopAddLocation(NPC, 28.13, 3, 84.94, 2, 20,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 25.42, 3, 83.57, 2, 0)
	MovementLoopAddLocation(NPC, 17.89, 3, 85.41, 2, 1)
	MovementLoopAddLocation(NPC, 17.89, 3, 85.41, 2, 20,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 18.78, 3, 84.38, 2, 0)
	MovementLoopAddLocation(NPC, 23.16, 3, 90.93, 2, 0)
	MovementLoopAddLocation(NPC, 28.29, 3, 100.17, 2, 0)
	MovementLoopAddLocation(NPC, 29.34, 3, 103.79, 2, 0)
	MovementLoopAddLocation(NPC, 33.86, 3, 110.37, 2, 0)
	MovementLoopAddLocation(NPC, 34.68, 3, 111.14, 2, 1)
	MovementLoopAddLocation(NPC, 34.68, 3, 111.14, 2, 20,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 37.48, 3, 108.35, 2, 0)
	MovementLoopAddLocation(NPC, 40.17, 3, 108.85, 2, 0)
	MovementLoopAddLocation(NPC, 34.92, 3, 109.59, 2, 0)
	MovementLoopAddLocation(NPC, 29.94, 3, 103.69, 2, 0)
	MovementLoopAddLocation(NPC, 27.36, 3, 98.82, 2, 0)
	MovementLoopAddLocation(NPC, 21.73, 3, 93.37, 2, 0)
	MovementLoopAddLocation(NPC, 19.64, 3, 87.48, 2, 0)
	MovementLoopAddLocation(NPC, 20.47, 3.01, 83.03, 2, 0)
	MovementLoopAddLocation(NPC, 20.81, 3, 80.26, 2, 0)
	MovementLoopAddLocation(NPC, 18.32, 3.01, 70.82, 2, 0)
	MovementLoopAddLocation(NPC, 21.11, 2.91, 65.83, 2, 0)
	MovementLoopAddLocation(NPC, 23.28, 2.97, 57.21, 2, 1)
	MovementLoopAddLocation(NPC, 23.28, 2.97, 57.21, 2, 20,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 23.57, 2.99, 58.79, 2, 0)
	MovementLoopAddLocation(NPC, 25.79, 3, 59.44, 2, 0)
	MovementLoopAddLocation(NPC, 27.94, 3, 58.35, 2, 0)
	MovementLoopAddLocation(NPC, 29.98, 3, 56.56, 2, 0)
	MovementLoopAddLocation(NPC, 31.69, 3, 52.63, 2, 0)
	MovementLoopAddLocation(NPC, 28.79, 2.99, 46.6, 2, 0)
	MovementLoopAddLocation(NPC, 25.92, 2.92, 38.63, 2, 0)
	MovementLoopAddLocation(NPC, 29.25, 2.92, 25.61, 2, 0)
	MovementLoopAddLocation(NPC, 30.62, 2.92, 26.17, 2, 1)
	MovementLoopAddLocation(NPC, 30.62, 2.92, 26.17, 2, 20,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 30, 3, 26.1, 2, 1)
	MovementLoopAddLocation(NPC, 30, 3, 26.1, 2, 20)
	MovementLoopAddLocation(NPC, 29.07, 2.92, 29.97, 2, 0)
	MovementLoopAddLocation(NPC, 28.14, 2.92, 33.84, 2, 0)
	MovementLoopAddLocation(NPC, 33.03, 2.99, 47.44, 2, 0)
	MovementLoopAddLocation(NPC, 34.11, 3, 52.7, 2, 0)
	MovementLoopAddLocation(NPC, 30.37, 3, 57.38, 2, 0)
	MovementLoopAddLocation(NPC, 25.84, 3, 60.13, 2, 0)
	MovementLoopAddLocation(NPC, 20.36, 3.09, 62.66, 2, 1)
	MovementLoopAddLocation(NPC, 20.36, 3.09, 62.66, 2, 20,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 22.3, 2.95, 62.58, 2, 0)
	MovementLoopAddLocation(NPC, 21.58, 2.93, 66.26, 2, 0)
	MovementLoopAddLocation(NPC, 19.38, 3.01, 77.73, 2, 0)
end


