--[[
    Script Name    : SpawnScripts/Longshadow/OlakUSom.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.14 07:10:17
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
GenericEcology2Hail(NPC, Spawn, faction)
end

function InRange(NPC,Spawn)
GenericEcology2Callout(NPC, Spawn, faction)
end
    
function respawn(NPC)
		spawn(NPC)
	end


function waypoints(NPC)
	MovementLoopAddLocation(NPC, -15.77, 0, -7.45, 2, 1)
	MovementLoopAddLocation(NPC, -15.77, 0, -7.45, 2, MakeRandomInt(20,26),"EcologyEmotes")
	MovementLoopAddLocation(NPC, -15.77, 0, -7.45, 2, 0)
	MovementLoopAddLocation(NPC, -15.96, 0, -4.97, 2, 0)
	MovementLoopAddLocation(NPC, -17.96, 0, -5.2, 2, 0)
	MovementLoopAddLocation(NPC, -21.07, 0, -5.9, 2, 0)
	MovementLoopAddLocation(NPC, -23.78, 0.08, -7.25, 2, 0)
	MovementLoopAddLocation(NPC, -31.26, 0, -12.25, 2, 1)
	MovementLoopAddLocation(NPC, -31.26, 0, -12.25, 2, MakeRandomInt(15,25),"EcologyEmotes")
	MovementLoopAddLocation(NPC, -35.52, 0.05, -12.02, 2, 0)
	MovementLoopAddLocation(NPC, -39.33, 0.2, -10.93, 2, 0)
	MovementLoopAddLocation(NPC, -44.5, 0, -13.48, 2, 0)
	MovementLoopAddLocation(NPC, -46.24, -0.64, -15.85, 2, 0)
	MovementLoopAddLocation(NPC, -46.96, -0.93, -20.44, 2, 0)
	MovementLoopAddLocation(NPC, -47.48, -0.21, -28.54, 2, 1)
	MovementLoopAddLocation(NPC, -47.48, -0.21, -28.54, 2, MakeRandomInt(15,25),"EcologyEmotes")
	MovementLoopAddLocation(NPC, -44.14, -0.57, -30.69, 2, 0)
	MovementLoopAddLocation(NPC, -39.76, -1.21, -33.11, 2, 0)
	MovementLoopAddLocation(NPC, -34.21, -2.07, -34.4, 2, 0)
	MovementLoopAddLocation(NPC, -31.17, -3, -42.45, 2, 1)
	MovementLoopAddLocation(NPC, -31.17, -3, -42.45, 2, MakeRandomInt(15,25),"EcologyEmotes")
	MovementLoopAddLocation(NPC, -32.31, -3, -40.65, 2, 0)
	MovementLoopAddLocation(NPC, -33.06, -2.76, -39.24, 2, 0)
	MovementLoopAddLocation(NPC, -31.78, -2.14, -35.15, 2, 0)
	MovementLoopAddLocation(NPC, -31.96, -1.17, -28.79, 2, 0)
	MovementLoopAddLocation(NPC, -31.58, -0.55, -25.58, 2, 0)
	MovementLoopAddLocation(NPC, -29.57, -0.05, -23.33, 2, 0)
	MovementLoopAddLocation(NPC, -28.34, 0, -21.35, 2, 0)
	MovementLoopAddLocation(NPC, -23.8, 0.09, -17.63, 2, 0)
	MovementLoopAddLocation(NPC, -19.14, 0.06, -15.57, 2, 0)
	MovementLoopAddLocation(NPC, -12.06, 0, -11.36, 2, 0)
	MovementLoopAddLocation(NPC, -11.38, 0, -6.1, 2, 0)
	MovementLoopAddLocation(NPC, -9.27, 0, 4.63, 2, 1)
	MovementLoopAddLocation(NPC, -9.27, 0, 4.63, 2, MakeRandomInt(15,25),"EcologyEmotes")
	MovementLoopAddLocation(NPC, -13.31, 0, -1.98, 2, 0)
end


