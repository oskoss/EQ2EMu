--[[
    Script Name    : SpawnScripts/Longshadow/ValinaDMizrel.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.14 08:10:24
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
	FaceTarget(NPC, Spawn)
    GenericEcologyCallout(NPC, Spawn, faction)
end
    
function respawn(NPC)
	spawn(NPC)
end

function Door1(NPC,Spawn)
    local door = GetSpawn(NPC, 1380088)
    UseWidget(door)
end

function waypoints(NPC)
	MovementLoopAddLocation(NPC, -22.3, 0.05, -18.99, 2, 1)
	MovementLoopAddLocation(NPC, -22.3, 0.05, -18.99, 2, MakeRandomInt(15,25),"EcologyEmotes")
	MovementLoopAddLocation(NPC, -22.3, 0.05, -18.99, 2, 0)
	MovementLoopAddLocation(NPC, -26.77, 0.06, -19.34, 2, 0)
	MovementLoopAddLocation(NPC, -30.66, -0.03, -21.61, 2, 0)
	MovementLoopAddLocation(NPC, -33.14, -0.66, -25.2, 2, 0)
	MovementLoopAddLocation(NPC, -33.74, -1.58, -32.93, 2, 0)
	MovementLoopAddLocation(NPC, -34.3, -2.67, -37.11, 2, 0)
	MovementLoopAddLocation(NPC, -35.99, -3.58, -45.25, 2, 0)
	MovementLoopAddLocation(NPC, -40.38, -4.26, -53.42, 2, 0)
	MovementLoopAddLocation(NPC, -41.94, -4.5, -54.9, 2, 0)
	MovementLoopAddLocation(NPC, -42.99, -4.5, -56.45, 2, 0)
	MovementLoopAddLocation(NPC, -45.31, -4.64, -62.81, 2, 0)
	MovementLoopAddLocation(NPC, -49.5, -4.67, -63.72, 2, 0)
	MovementLoopAddLocation(NPC, -55.4, -4.67, -64.45, 2, 1)
	MovementLoopAddLocation(NPC, -55.4, -4.67, -64.45, 2, 1,"FishHead")
	MovementLoopAddLocation(NPC, -55.4, -4.67, -64.45, 2, MakeRandomInt(25,35),"EcologyEmotes")
	MovementLoopAddLocation(NPC, -55.4, -4.67, -64.45, 2, 0)
	MovementLoopAddLocation(NPC, -50.93, -4.67, -65.45, 2, 0)
	MovementLoopAddLocation(NPC, -47.61, -4.69, -65, 2, 0)
	MovementLoopAddLocation(NPC, -44.13, -4.68, -63.74, 2, 0)
	MovementLoopAddLocation(NPC, -41.83, -4.5, -57.19, 2, 0)
	MovementLoopAddLocation(NPC, -39.77, -4.2, -54.18, 2, 0)
	MovementLoopAddLocation(NPC, -35.18, -4.27, -52.15, 2, 2,"Door1")
	MovementLoopAddLocation(NPC, -32.36, -3.96, -54.26, 2, 0,"Door1")
	MovementLoopAddLocation(NPC, -29.27, -3.98, -54.85, 2, 0)
	MovementLoopAddLocation(NPC, -29.27, -3.98, -54.85, 2, 1)
	MovementLoopAddLocation(NPC, -29.27, -3.98, -54.85, 2, MakeRandomInt(25,35),"EcologyEmotes")
	MovementLoopAddLocation(NPC, -30.21, -4, -55.79, 2, 0)
	MovementLoopAddLocation(NPC, -31.06, -4, -56.07, 2, 1)
	MovementLoopAddLocation(NPC, -31.06, -4, -56.07, 2, 35,"EcologyEmotes")
	MovementLoopAddLocation(NPC, -31.4, -4, -55.7, 2, 2,"Door1")
	MovementLoopAddLocation(NPC, -35.61, -4.33, -51.88, 2, 0,"Door1")
	MovementLoopAddLocation(NPC, -34.56, -3.67, -47.97, 2, 0)
	MovementLoopAddLocation(NPC, -32.93, -3.07, -40.75, 2, 0)
	MovementLoopAddLocation(NPC, -31.16, -1.7, -32.92, 2, 0)
	MovementLoopAddLocation(NPC, -31.89, -1.15, -28.64, 2, 0)
	MovementLoopAddLocation(NPC, -32.01, -0.6, -25.92, 2, 0)
	MovementLoopAddLocation(NPC, -28.24, 0, -21.21, 2, 0)
	MovementLoopAddLocation(NPC, -26.01, 0, -19.59, 2, 0)
	MovementLoopAddLocation(NPC, -18.45, 0, -11.97, 2, 1)
	MovementLoopAddLocation(NPC, -18.45, 0, -11.97, 2, MakeRandomInt(25,35),"EcologyEmotes")
	MovementLoopAddLocation(NPC, -18.45, 0, -11.97, 2, 0)
	MovementLoopAddLocation(NPC, -21.01, 0.09, -15.92, 2, 0)
	MovementLoopAddLocation(NPC, -22.24, 0.07, -17.82, 2, 0)
end

function FishHead(NPC)
    SetHeading(NPC,155)
end
