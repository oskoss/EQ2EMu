--[[
    Script Name    : SpawnScripts/TempleSt/Lexhin.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.28 04:10:40
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
	MovementLoopAddLocation(NPC, -8.14, 3, 116.58, 1, 1)
	MovementLoopAddLocation(NPC, -8.14, 3, 116.58, 1, MakeRandomInt(20,35),"Dig")
	MovementLoopAddLocation(NPC, -8.14, 3, 116.58, 1, 0)
	MovementLoopAddLocation(NPC, -4.47, 3, 114.29, 1, 0)
	MovementLoopAddLocation(NPC, 7.44, 3, 106.62, 1, 1)
	MovementLoopAddLocation(NPC, 7.44, 3, 106.62, 1, 30,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 8.53, 3, 111.42, 1, 1)
	MovementLoopAddLocation(NPC, 8.53, 3, 111.42, 1, 30,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 12.62, 3, 105.88, 1, 0)
	MovementLoopAddLocation(NPC, 13.12, 3, 105.84, 1, 1)
	MovementLoopAddLocation(NPC, 13.12, 3, 105.84, 1, MakeRandomInt(20,35),"Dig")
	MovementLoopAddLocation(NPC, 13.12, 3, 105.84, 1, 0)
	MovementLoopAddLocation(NPC, 10.88, 3, 106.13, 1, 0)
	MovementLoopAddLocation(NPC, 6.87, 3, 107.69, 1, 0)
	MovementLoopAddLocation(NPC, -4.56, 3, 114.4, 1, 1)
	MovementLoopAddLocation(NPC, -4.56, 3, 114.4, 1, 30,"EcologyEmotes")
	MovementLoopAddLocation(NPC, -5.92, 3, 117.5, 1, 1)
	MovementLoopAddLocation(NPC, -5.92, 3, 117.5, 1, 30,"EcologyEmotes")
end

function Dig(NPC, Spawn)
    PlayFlavor(NPC, "","","gathering_search",0,0)
end
