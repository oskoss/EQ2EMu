--[[
    Script Name    : SpawnScripts/BeggarsCourt/CalindraLongshadow.lua
    Script Author  : Dorbin
    Script Date    : 2023.11.28 05:11:17
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/GenericEcologyVoiceOvers.lua")

function spawn(NPC)
waypoints(NPC)
SetPlayerProximityFunction(NPC, 7, "InRange", "LeaveRange")		
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
	MovementLoopAddLocation(NPC, 22.82, 5.25, -35.1, 2, 0)
	MovementLoopAddLocation(NPC, 21.32, 5.25, -33.85, 2, 0)
	MovementLoopAddLocation(NPC, 21.66, 5.25, -32.47, 2, 1)
	MovementLoopAddLocation(NPC, 21.66, 5.25, -32.47, 2, 22,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 21.66, 5.25, -32.47, 2, 0)
	MovementLoopAddLocation(NPC, 20.2, 5.25, -31.38, 2, 0)
	MovementLoopAddLocation(NPC, 18.76, 5, -29.3, 2, 0)
	MovementLoopAddLocation(NPC, 13.98, 4.75, -20.78, 2, 0)
	MovementLoopAddLocation(NPC, 9.49, 3.5, -13.22, 2, 0)
	MovementLoopAddLocation(NPC, 5.62, 3.5, -8.63, 2, 1)
	MovementLoopAddLocation(NPC, 5.62, 3.5, -8.63, 2, 22,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 4.64, 3.5, -6.74, 2, 0)
	MovementLoopAddLocation(NPC, 4.64, 3.5, -6.74, 2, 1)
	MovementLoopAddLocation(NPC, 4.64, 3.5, -6.74, 2, 22,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 5.11, 3.5, -8.48, 2, 1)
	MovementLoopAddLocation(NPC, 5.11, 3.5, -8.48, 2, 22,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 4.02, 3.5, -7.06, 2, 1)
	MovementLoopAddLocation(NPC, 4.02, 3.5, -7.06, 2, 22,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 6.5, 3.5, -10.09, 2, 0)
	MovementLoopAddLocation(NPC, 9.82, 3.75, -16, 2, 0)
	MovementLoopAddLocation(NPC, 13.19, 4.75, -21.21, 2, 0)
	MovementLoopAddLocation(NPC, 15.67, 5, -29.56, 2, 0)
	MovementLoopAddLocation(NPC, 15.5, 5, -36.5, 2, 1)
	MovementLoopAddLocation(NPC, 15.5, 5, -36.5, 2, 22,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 16.52, 5, -34.64, 2, 0)
	MovementLoopAddLocation(NPC, 18.3, 5, -34.67, 2, 0)
	MovementLoopAddLocation(NPC, 26.62, 5.25, -37.93, 2, 1)
	MovementLoopAddLocation(NPC, 26.62, 5.25, -37.93, 2, 22,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 24.53, 5.25, -37.49, 2, 0)
end


