--[[
    Script Name    : SpawnScripts/TempleSt/ThignatzDustinia.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.28 03:10:00
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
	MovementLoopAddLocation(NPC, 21.06, 2.9, 64.87, 2, 0)
	MovementLoopAddLocation(NPC, 25, 3, 64.48, 2, 0)
	MovementLoopAddLocation(NPC, 27.25, 3, 58.49, 2, 0)
	MovementLoopAddLocation(NPC, 29.66, 3, 56.87, 2, 0)
	MovementLoopAddLocation(NPC, 29.02, 3, 55.16, 2, 0)
	MovementLoopAddLocation(NPC, 29.02, 3, 55.16, 2, 1)
	MovementLoopAddLocation(NPC, 29.02, 3, 55.16, 2, 20,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 30.6, 3, 54.2, 2, 0)
	MovementLoopAddLocation(NPC, 38.07, 3, 49.89, 2, 0)
	MovementLoopAddLocation(NPC, 41.56, 3, 48.95, 2, 0)
	MovementLoopAddLocation(NPC, 47.87, 3, 51.5, 2, 1)
	MovementLoopAddLocation(NPC, 47.87, 3, 51.5, 2, 20,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 45.29, 3, 50.59, 2, 0)
	MovementLoopAddLocation(NPC, 43.79, 3, 50.07, 2, 0)
	MovementLoopAddLocation(NPC, 40.87, 3, 51.42, 2, 0)
	MovementLoopAddLocation(NPC, 36.78, 3, 53.58, 2, 0)
	MovementLoopAddLocation(NPC, 30.85, 2.98, 48.01, 2, 0)
	MovementLoopAddLocation(NPC, 25.42, 2.92, 40.54, 2, 0)
	MovementLoopAddLocation(NPC, 22.99, 2.92, 37.18, 2, 0)
	MovementLoopAddLocation(NPC, 19.47, 2.92, 35.29, 2, 0)
	MovementLoopAddLocation(NPC, 12.7, 2.92, 38.17, 2, 0)
	MovementLoopAddLocation(NPC, 12.21, 2.92, 39.74, 2, 1)
	MovementLoopAddLocation(NPC, 12.21, 2.92, 39.74, 2, 20,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 13.13, 2.92, 37.51, 2, 0)
	MovementLoopAddLocation(NPC, 17.09, 2.92, 35.14, 2, 0)
	MovementLoopAddLocation(NPC, 21.7, 2.92, 36.63, 2, 0)
	MovementLoopAddLocation(NPC, 29.06, 2.92, 39.17, 2, 0)
	MovementLoopAddLocation(NPC, 33.6, 2.97, 45.64, 2, 0)
	MovementLoopAddLocation(NPC, 33.94, 3, 51.12, 2, 0)
	MovementLoopAddLocation(NPC, 32.73, 3, 55.95, 2, 0)
	MovementLoopAddLocation(NPC, 31.65, 3, 57.14, 2, 0)
	MovementLoopAddLocation(NPC, 34.03, 3, 60.78, 2, 0)
	MovementLoopAddLocation(NPC, 34.39, 3, 59.24, 2, 1)
	MovementLoopAddLocation(NPC, 34.39, 3, 59.24, 2, 20,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 33.84, 3, 60.46, 2, 0)
	MovementLoopAddLocation(NPC, 30.61, 3, 61.49, 2, 0)
	MovementLoopAddLocation(NPC, 24.29, 3, 61.02, 2, 0)
	MovementLoopAddLocation(NPC, 19.21, 3.02, 65.83, 2, 1)
	MovementLoopAddLocation(NPC, 19.21, 3.02, 65.83, 2, 30,"EcologyEmotes")
end


