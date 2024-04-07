--[[
    Script Name    : SpawnScripts/TempleSt/GiggiFoppdomler.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.28 04:10:09
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
	MovementLoopAddLocation(NPC, 59.4, 4.13, 48.06, 2, 1)
	MovementLoopAddLocation(NPC, 59.4, 4.13, 48.06, 2, 20,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 59.4, 4.13, 48.06, 2, 0)
	MovementLoopAddLocation(NPC, 60.24, 4.13, 49.21, 2, 0)
	MovementLoopAddLocation(NPC, 57.64, 4.13, 50.61, 2, 0)
	MovementLoopAddLocation(NPC, 53.4, 3.27, 50.28, 2, 1)
	MovementLoopAddLocation(NPC, 53.4, 3.27, 50.28, 2, 20,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 54.04, 3.47, 50.55, 2, 0)
	MovementLoopAddLocation(NPC, 54.13, 3.06, 52.79, 2, 2,"Door")
	MovementLoopAddLocation(NPC, 49.8, 3, 54.59, 2, 0)
	MovementLoopAddLocation(NPC, 49.72, 3, 57.15, 2, 0)
	MovementLoopAddLocation(NPC, 52.85, 3, 62.69, 2, 0)
	MovementLoopAddLocation(NPC, 54.78, 3, 65.71, 2, 0)
	MovementLoopAddLocation(NPC, 57.76, 2.98, 68.7, 2, 0)
	MovementLoopAddLocation(NPC, 61.46, 2.94, 70.49, 2, 0)
	MovementLoopAddLocation(NPC, 63.69, 3, 72.93, 2, 1)
	MovementLoopAddLocation(NPC, 63.69, 3, 72.93, 2, 20,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 62.9, 2.99, 71.36, 2, 0)
	MovementLoopAddLocation(NPC, 64.86, 2.71, 69.15, 2, 0)
	MovementLoopAddLocation(NPC, 70.96, 1.37, 70.9, 2, 0)
	MovementLoopAddLocation(NPC, 72.27, 0.87, 72.74, 2, 0)
	MovementLoopAddLocation(NPC, 72.73, -0.69, 79.36, 2, 0)
	MovementLoopAddLocation(NPC, 76.86, -2.78, 83.54, 2, 0)
	MovementLoopAddLocation(NPC, 84.57, -4.57, 97.64, 2, 0)
	MovementLoopAddLocation(NPC, 81.59, -4.57, 108.12, 2, 1)
	MovementLoopAddLocation(NPC, 81.59, -4.57, 108.12, 2, 20,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 81.59, -4.57, 108.12, 2, 0)
	MovementLoopAddLocation(NPC, 81.8, -4.57, 103.79, 2, 0)
	MovementLoopAddLocation(NPC, 77.29, -4.56, 94.52, 2, 0)
	MovementLoopAddLocation(NPC, 76.45, -4.53, 92.87, 2, 1)
	MovementLoopAddLocation(NPC, 76.45, -4.53, 92.87, 2, 20,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 76.65, -4.51, 91.76, 2, 0)
	MovementLoopAddLocation(NPC, 73.23, -2.33, 83.77, 2, 0)
	MovementLoopAddLocation(NPC, 71.23, -0.66, 79.64, 2, 0)
	MovementLoopAddLocation(NPC, 71.73, 0.31, 75.46, 2, 0)
	MovementLoopAddLocation(NPC, 71.11, 0.86, 73.37, 2, 0)
	MovementLoopAddLocation(NPC, 68.41, 1.83, 70.75, 2, 0)
	MovementLoopAddLocation(NPC, 64.26, 2.82, 70.07, 2, 0)
	MovementLoopAddLocation(NPC, 57.21, 2.99, 68.18, 2, 0)
	MovementLoopAddLocation(NPC, 50.47, 3, 62.85, 2, 0)
	MovementLoopAddLocation(NPC, 46.84, 3, 56.32, 2, 0)
	MovementLoopAddLocation(NPC, 50.26, 3, 54.47, 2, 2,"Door")
	MovementLoopAddLocation(NPC, 53.7, 3.06, 52.34, 2, 0)
	MovementLoopAddLocation(NPC, 55.65, 4.13, 48.95, 2, 0)
	MovementLoopAddLocation(NPC, 57.93, 4.13, 47.17, 2, 0)
end


function Door(NPC,Spawn)
    local door = GetSpawn(NPC, 1360070)
    UseWidget(door)
end	