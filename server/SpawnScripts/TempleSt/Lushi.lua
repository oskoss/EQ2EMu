--[[
    Script Name    : SpawnScripts/TempleSt/Lushi.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.28 04:10:19
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
	MovementLoopAddLocation(NPC, -0.09, 3, 61.19, 2, 0)
	MovementLoopAddLocation(NPC, 1.77, 3, 65.01, 2, 0)
	MovementLoopAddLocation(NPC, 4.25, 3, 66.12, 2, 0)
	MovementLoopAddLocation(NPC, 10.98, 3, 68.77, 2, 0)
	MovementLoopAddLocation(NPC, 16.4, 3.01, 70.9, 2, 0)
	MovementLoopAddLocation(NPC, 28.12, 3, 71.15, 2, 0)
	MovementLoopAddLocation(NPC, 28.12, 3, 71.15, 2, 1)
	MovementLoopAddLocation(NPC, 28.12, 3, 71.15, 2, 20,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 28.12, 3, 71.15, 2, 20,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 27.73, 3, 70.1, 2, 0)
	MovementLoopAddLocation(NPC, 30.09, 3, 69.58, 2, 0)
	MovementLoopAddLocation(NPC, 35.19, 3, 70.16, 2, 0)
	MovementLoopAddLocation(NPC, 36.93, 3, 67.6, 2, 1)
	MovementLoopAddLocation(NPC, 36.93, 3, 67.6, 2, 25,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 38.26, 3, 71.4, 2, 0)
	MovementLoopAddLocation(NPC, 39.62, 3, 73.96, 2, 0)
	MovementLoopAddLocation(NPC, 41.61, 3, 73.41, 2, 0)
	MovementLoopAddLocation(NPC, 53.02, 3, 66.59, 2, 0)
	MovementLoopAddLocation(NPC, 43.5, 3, 50.75, 2, 0)
	MovementLoopAddLocation(NPC, 42.75, 3, 49.63, 2, 0)
	MovementLoopAddLocation(NPC, 32.66, 3, 56.09, 2, 0)
	MovementLoopAddLocation(NPC, 29.14, 3, 60.11, 2, 0)
	MovementLoopAddLocation(NPC, 23.55, 3, 61.79, 2, 0)
	MovementLoopAddLocation(NPC, 20.09, 3, 69.23, 2, 0)
	MovementLoopAddLocation(NPC, 15.69, 3.01, 72.02, 2, 0)
	MovementLoopAddLocation(NPC, 7.54, 3, 69.92, 2, 0)
	MovementLoopAddLocation(NPC, 2.07, 3, 66.84, 2, 0)
	MovementLoopAddLocation(NPC, -0.61, 3, 65.25, 2, 0)
	MovementLoopAddLocation(NPC, -1.31, 3, 52.73, 2, 1)
	MovementLoopAddLocation(NPC, -1.31, 3, 52.73, 2, 20,"EcologyEmotes")
	MovementLoopAddLocation(NPC, -1.31, 3, 52.73, 2, 20,"EcologyEmotes")
	MovementLoopAddLocation(NPC, -0.59, 3.00, 55.49, 2, 0)
	MovementLoopAddLocation(NPC, 2, 3, 57.22, 2, 1)
	MovementLoopAddLocation(NPC, 2, 3, 57.22, 2, 20,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 2, 3, 57.22, 2, 20,"EcologyEmotes")
end


