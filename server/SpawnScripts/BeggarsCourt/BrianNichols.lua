--[[
    Script Name    : SpawnScripts/BeggarsCourt/BrianNichols.lua
    Script Author  : Dorbin
    Script Date    : 2023.11.27 02:11:04
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
    GenericEcology2Hail(NPC, Spawn, faction)
end

function InRange(NPC,Spawn)
    GenericEcology2Callout(NPC, Spawn, faction)
    end

function respawn(NPC)
	spawn(NPC)
end


function waypoints(NPC)
	MovementLoopAddLocation(NPC, -21.91, -7, 36.27, 2, 0)
	MovementLoopAddLocation(NPC, -17.66, -7, 40.14, 2, 1)
	MovementLoopAddLocation(NPC, -17.66, -7, 40.14, 2, 20,"EcologyEmotes")
	MovementLoopAddLocation(NPC, -17.66, -7, 40.14, 2, 0)
	MovementLoopAddLocation(NPC, -17.81, -7, 37.76, 2, 0)
	MovementLoopAddLocation(NPC, -23.68, -7, 34.95, 2, 0)
	MovementLoopAddLocation(NPC, -25.69, -7, 36.16, 2, 1)
	MovementLoopAddLocation(NPC, -25.69, -7, 36.16, 2, 20,"EcologyEmotes")
	MovementLoopAddLocation(NPC, -24.04, -7, 35.42, 2, 0)
	MovementLoopAddLocation(NPC, -18.52, -7, 35.83, 2, 0)
	MovementLoopAddLocation(NPC, -8.57, -6.5, 37.23, 2, 0)
	MovementLoopAddLocation(NPC, -5.11, -6.5, 39.77, 2, 0)
	MovementLoopAddLocation(NPC, 0.21, -6.5, 40.79, 2, 0)
	MovementLoopAddLocation(NPC, 3.73, -6.5, 41.46, 2, 0)
	MovementLoopAddLocation(NPC, 10.73, -6.5, 44.33, 2, 0)
	MovementLoopAddLocation(NPC, 14.77, -6.5, 46.21, 2, 0)
	MovementLoopAddLocation(NPC, 21.25, -6.5, 47.51, 2, 0)
	MovementLoopAddLocation(NPC, 27.54, -6, 44.17, 2, 0)
	MovementLoopAddLocation(NPC, 34.2, -6, 44.02, 2, 0)
	MovementLoopAddLocation(NPC, 37.47, -6, 43.92, 2, 0)
	MovementLoopAddLocation(NPC, 42.27, -5.75, 44.38, 2, 0)
	MovementLoopAddLocation(NPC, 47.59, -5.75, 46.05, 2, 0)
	MovementLoopAddLocation(NPC, 50.95, -5, 40.86, 2, 0)
	MovementLoopAddLocation(NPC, 49.41, -5, 39.42, 2, 1)
	MovementLoopAddLocation(NPC, 49.41, -5, 39.42, 2, 20,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 49.41, -5, 39.42, 2, 0)
	MovementLoopAddLocation(NPC, 50.1, -5, 38.1, 2, 0)
	MovementLoopAddLocation(NPC, 49.53, -5, 35.61, 2, 0)
	MovementLoopAddLocation(NPC, 43.83, -5, 35.43, 2, 0)
	MovementLoopAddLocation(NPC, 41.2, -5, 36.34, 2, 0)
	MovementLoopAddLocation(NPC, 34.98, -6, 43.89, 2, 0)
	MovementLoopAddLocation(NPC, 32.52, -6, 45.05, 2, 0)
	MovementLoopAddLocation(NPC, 27.86, -6.5, 47.69, 2, 0)
	MovementLoopAddLocation(NPC, 20.32, -6.5, 47.54, 2, 0)
	MovementLoopAddLocation(NPC, 14.05, -6.5, 46.02, 2, 0)
	MovementLoopAddLocation(NPC, 8.42, -6.5, 43.37, 2, 0)
	MovementLoopAddLocation(NPC, 1.87, -7, 47.97, 2, 0)
	MovementLoopAddLocation(NPC, -12.12, -7, 53.83, 2, 0)
	MovementLoopAddLocation(NPC, -17.15, -7, 59.64, 2, 0)
	MovementLoopAddLocation(NPC, -26.04, -7, 68.46, 2, 1)
	MovementLoopAddLocation(NPC, -26.04, -7, 68.46, 2, 20,"EcologyEmotes")
	MovementLoopAddLocation(NPC, -24.89, -7, 68.15, 2, 0)
	MovementLoopAddLocation(NPC, -22.57, -7, 64.93, 2, 0)
	MovementLoopAddLocation(NPC, -19.27, -7, 58.33, 2, 0)
	MovementLoopAddLocation(NPC, -10.07, -7, 52.52, 2, 0)
	MovementLoopAddLocation(NPC, -9.6, -7, 42.67, 2, 0)
	MovementLoopAddLocation(NPC, -15.71, -7, 37.29, 2, 0)
	MovementLoopAddLocation(NPC, -23.2, -7, 32.79, 2, 0)
	MovementLoopAddLocation(NPC, -32.98, -5.75, 26.07, 2, 2,"Door1")
	MovementLoopAddLocation(NPC, -36.92, -5.77, 24.82, 2, 0,"Door1")
	MovementLoopAddLocation(NPC, -41.75, -5.77, 26.16, 2, 0)
	MovementLoopAddLocation(NPC, -49.91, -5.77, 21.51, 2, 0)
	MovementLoopAddLocation(NPC, -52, -5.77, 16.43, 2, 1)
	MovementLoopAddLocation(NPC, -52, -5.77, 16.43, 2, 30,"EcologyEmotes")
	MovementLoopAddLocation(NPC, -47.09, -5.77, 16.75, 2, 1)
	MovementLoopAddLocation(NPC, -47.09, -5.77, 16.75, 2, 30,"EcologyEmotes")
	MovementLoopAddLocation(NPC, -48.28, -5.77, 18.94, 2, 0)
	MovementLoopAddLocation(NPC, -47.61, -5.77, 21.34, 2, 0)
	MovementLoopAddLocation(NPC, -43.56, -5.77, 24.06, 2, 0)
	MovementLoopAddLocation(NPC, -38.6, -5.77, 24.61, 2, 2,"Door1")
	MovementLoopAddLocation(NPC, -31.46, -5.75, 24.87, 2, 0,"Door1")
	MovementLoopAddLocation(NPC, -29.64, -5.75, 27.05, 2, 0)
	MovementLoopAddLocation(NPC, -24.18, -7, 34.87, 2, 0)
end


function Door1(NPC,Spawn)
    local door = GetSpawn(NPC, 1370080)
    UseWidget(door)
end
