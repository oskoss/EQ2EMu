--[[
    Script Name    : SpawnScripts/Longshadow/VelaMRev.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.14 07:10:58
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
	MovementLoopAddLocation(NPC, 12.43, 0, -8.14, 2, 1)
	MovementLoopAddLocation(NPC, 12.43, 0, -8.14, 2, 30,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 10.41, 0, -8.72, 2, 0)
	MovementLoopAddLocation(NPC, 9.42, 0, -11.26, 2, 0)
	MovementLoopAddLocation(NPC, 11.8, 0, -16.48, 2, 0)
	MovementLoopAddLocation(NPC, 18.99, -0.22, -21.2, 2, 0)
	MovementLoopAddLocation(NPC, 24.03, -0.81, -22.76, 2, 0)
	MovementLoopAddLocation(NPC, 30.74, -1.39, -22.92, 2, 0)
	MovementLoopAddLocation(NPC, 36.59, -1.48, -21.92, 2, 0)
	MovementLoopAddLocation(NPC, 39.62, -1.38, -16.36, 2, 0)
	MovementLoopAddLocation(NPC, 40.63, -1.45, -5.15, 2, 0)
	MovementLoopAddLocation(NPC, 36.57, -0.31, 7.03, 2, 0)
	MovementLoopAddLocation(NPC, 29.77, 0.74, 13.76, 2, 0)
	MovementLoopAddLocation(NPC, 24.08, 1.37, 19.58, 2, 0)
	MovementLoopAddLocation(NPC, 13.63, 2.22, 27.07, 2, 0)
	MovementLoopAddLocation(NPC, 6.36, 2.87, 31.15, 2, 0)
	MovementLoopAddLocation(NPC, 4.75, 3, 34.07, 2, 0)
	MovementLoopAddLocation(NPC, 9.06, 3, 39.71, 2, 1)
	MovementLoopAddLocation(NPC, 9.06, 3, 39.71, 2, 20,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 8.87, 3, 41.31, 2, 0)
	MovementLoopAddLocation(NPC, 11.1, 3, 47.96, 2, 0)
	MovementLoopAddLocation(NPC, 12.2, 3, 49.77, 2, 0)
	MovementLoopAddLocation(NPC, 15.69, 3, 51.01, 2, 0)
	MovementLoopAddLocation(NPC, 22.75, 3, 53.09, 2, 0)
	MovementLoopAddLocation(NPC, 30.46, 3, 59.64, 2, 1)
	MovementLoopAddLocation(NPC, 30.46, 3, 59.64, 2, 20,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 26.71, 3, 58.61, 2, 0)
	MovementLoopAddLocation(NPC, 22.74, 3, 55.11, 2, 0)
	MovementLoopAddLocation(NPC, 19.3, 3, 52, 2, 0)
	MovementLoopAddLocation(NPC, 12.96, 3, 51.65, 2, 0)
	MovementLoopAddLocation(NPC, 6.14, 2.99, 44.79, 2, 0)
	MovementLoopAddLocation(NPC, 3.73, 3, 37.84, 2, 0)
	MovementLoopAddLocation(NPC, 2.85, 3, 35.26, 2, 0)
	MovementLoopAddLocation(NPC, 7.51, 2.83, 27.62, 2, 0)
	MovementLoopAddLocation(NPC, 16.48, 1.84, 23.54, 2, 0)
	MovementLoopAddLocation(NPC, 21.5, 1.41, 18.96, 2, 0)
	MovementLoopAddLocation(NPC, 27.08, 0.78, 11.81, 2, 0)
	MovementLoopAddLocation(NPC, 33.63, -0.57, 3.57, 2, 0)
	MovementLoopAddLocation(NPC, 36.27, -1.28, -3.52, 2, 0)
	MovementLoopAddLocation(NPC, 36.58, -1.4, -13.16, 2, 2)
	MovementLoopAddLocation(NPC, 34.03, -1.13, -14.1, 2, 0)
	MovementLoopAddLocation(NPC, 30.98, -1.15, -15.54, 2, 1)
	MovementLoopAddLocation(NPC, 30.98, -1.15, -15.54, 2, 30,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 31.42, -1.23, -13.45, 2, 1)
	MovementLoopAddLocation(NPC, 31.42, -1.23, -13.45, 2, 10,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 32.95, -1.23, -14.21, 2, 2)
	MovementLoopAddLocation(NPC, 36.46, -1.38, -13.73, 2, 0)
	MovementLoopAddLocation(NPC, 37.17, -1.37, -15.76, 2, 0)
	MovementLoopAddLocation(NPC, 35.62, -1.25, -20.12, 2, 0)
	MovementLoopAddLocation(NPC, 29.31, -1.25, -20.83, 2, 0)
	MovementLoopAddLocation(NPC, 23.7, -0.67, -20.18, 2, 0)
	MovementLoopAddLocation(NPC, 16.84, 0, -17.25, 2, 0)
	MovementLoopAddLocation(NPC, 12.35, 0, -3.4, 2, 0)
	MovementLoopAddLocation(NPC, 13.6, 0, -2.11, 2, 1)
	MovementLoopAddLocation(NPC, 13.6, 0, -2.11, 2, 12,"EcologyEmotes")
end


function Door1(NPC,Spawn)
    local door = GetSpawn(NPC, 1380080)
    UseWidget(door)
end