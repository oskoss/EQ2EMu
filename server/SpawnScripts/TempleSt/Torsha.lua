--[[
    Script Name    : SpawnScripts/TempleSt/Torsha.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.28 04:10:51
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
	MovementLoopAddLocation(NPC, 42.33, 3, 83.5, 2, 1)
	MovementLoopAddLocation(NPC, 42.33, 3, 83.5, 2, 29,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 44.35, 3, 84.45, 2, 0)
	MovementLoopAddLocation(NPC, 49.66, 3, 92.49, 2, 0)
	MovementLoopAddLocation(NPC, 51.82, 3, 92.96, 2, 1)
	MovementLoopAddLocation(NPC, 51.82, 3, 92.96, 2, 24,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 48.4, 3, 90.19, 2, 0)
	MovementLoopAddLocation(NPC, 48.23, 3, 84.92, 2, 1)
	MovementLoopAddLocation(NPC, 48.23, 3, 84.92, 2, 29,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 47.86, 3, 85.96, 2, 0)
	MovementLoopAddLocation(NPC, 46.17, 3, 86.04, 2, 0)
end
