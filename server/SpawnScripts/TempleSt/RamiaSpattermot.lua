--[[
    Script Name    : SpawnScripts/TempleSt/RamiaSpattermot.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.28 04:10:22
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/GenericEcologyVoiceOvers.lua")
dofile("SpawnScripts/Generic/UnknownLanguage.lua")

function spawn(NPC)
SetPlayerProximityFunction(NPC, 6, "InRange", "LeaveRange")		
waypoints(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
    if not HasLanguage(Spawn,6)then
    Garbled(NPC,Spawn)
    else
    GenericEcologyHail(NPC, Spawn, faction)
end
end

function InRange(NPC,Spawn)
if GetFactionAmount(Spawn,12)<0 then
    FactionCheckCallout(NPC,Spawn,faction)
    else
    if not HasLanguage(Spawn,6)then
        if math.random(0,100)<40 then
     	FaceTarget(NPC, Spawn)
        Garbled(NPC,Spawn)
        end
    else
end
end
end
    
function respawn(NPC)
		spawn(NPC)
	end
	

function waypoints(NPC)
	MovementLoopAddLocation(NPC, -2.31, 3, 106.54, 2, 1)
	MovementLoopAddLocation(NPC, -2.31, 3, 106.54, 2, MakeRandomInt(15,20),"EcologyEmotes")
	MovementLoopAddLocation(NPC, -2.31, 3, 106.54, 2, 0)
	MovementLoopAddLocation(NPC, -4.15, 3, 100.8, 2, 0)
	MovementLoopAddLocation(NPC, -5.71, 3, 97.41, 2, 0)
	MovementLoopAddLocation(NPC, -6.16, 3, 94.76, 2, 0)
	MovementLoopAddLocation(NPC, -8.59, 3, 90.17, 2, 1)
	MovementLoopAddLocation(NPC, -8.59, 3, 90.17, 2, MakeRandomInt(15,20),"EcologyEmotes")
	MovementLoopAddLocation(NPC, -0.85, 3, 89.43, 2, 1)
	MovementLoopAddLocation(NPC, -0.85, 3, 89.43, 2, MakeRandomInt(15,20),"EcologyEmotes")
	MovementLoopAddLocation(NPC, -2.72, 3, 89.42, 2, 0)
	MovementLoopAddLocation(NPC, -6.41, 3, 92.07, 2, 0)
	MovementLoopAddLocation(NPC, -6.47, 3, 92.96, 2, 0)
	MovementLoopAddLocation(NPC, -3.17, 3, 98.54, 2, 1)
	MovementLoopAddLocation(NPC, -3.17, 3, 98.54, 2, MakeRandomInt(15,20),"EcologyEmotes")
	MovementLoopAddLocation(NPC, -4.59, 3, 99.36, 2, 0)
	MovementLoopAddLocation(NPC, -9.93, 3, 103.61, 2, 0)
	MovementLoopAddLocation(NPC, -15.54, 3, 107.86, 2, 1)
	MovementLoopAddLocation(NPC, -15.54, 3, 107.86, 2, MakeRandomInt(15,20),"EcologyEmotes")
	MovementLoopAddLocation(NPC, -14.73, 3, 106.13, 2, 0)
	MovementLoopAddLocation(NPC, -21.6, 2.89, 102.27, 2, 0)
	MovementLoopAddLocation(NPC, -21.95, 2.88, 102.32, 2, 1)
	MovementLoopAddLocation(NPC, -21.95, 2.88, 102.32, 2, MakeRandomInt(15,20),"EcologyEmotes")
	MovementLoopAddLocation(NPC, -22.71, 2.79, 104, 2, 0)
	MovementLoopAddLocation(NPC, -22.67, 2.74, 105.12, 2, 0)
	MovementLoopAddLocation(NPC, -16.26, 3, 104.32, 2, 0)
	MovementLoopAddLocation(NPC, -14.9, 3, 104.3, 2, 0)
	MovementLoopAddLocation(NPC, -9.46, 3, 102.15, 2, 0)
	MovementLoopAddLocation(NPC, -6.75, 3, 100.82, 2, 0)
	MovementLoopAddLocation(NPC, -2.21, 3, 101.87, 2, 0)
	MovementLoopAddLocation(NPC, 0.15, 3, 106.11, 2, 0)
	MovementLoopAddLocation(NPC, -0.94, 3, 104.78, 2, 2,"Door")
	MovementLoopAddLocation(NPC, -5.53, 3.02, 108.11, 2, 0,"Door")
	MovementLoopAddLocation(NPC, -6.48, 3.02, 109.98, 2, 1)
	MovementLoopAddLocation(NPC, -6.48, 3.02, 109.98, 2, MakeRandomInt(25,30),"EcologyEmotes")
	MovementLoopAddLocation(NPC, -7.28, 3.02, 107.64, 2, 0)
	MovementLoopAddLocation(NPC, -7.28, 3.02, 107.64, 2, MakeRandomInt(25,30),"EcologyEmotes")
	MovementLoopAddLocation(NPC, -6.48, 3.02, 109.98, 2, 1)
	MovementLoopAddLocation(NPC, -6.48, 3.02, 109.98, 2, MakeRandomInt(25,30),"EcologyEmotes")
	MovementLoopAddLocation(NPC, -5.53, 3.02, 108.11, 2, 2,"Door")
	MovementLoopAddLocation(NPC, -0.94, 3, 104.78, 2, 0,"Door")
	MovementLoopAddLocation(NPC, 0.15, 3, 106.11, 2, 0)
	MovementLoopAddLocation(NPC, -2.21, 3, 101.87, 2, 0)
	MovementLoopAddLocation(NPC, -6.75, 3, 100.82, 2, 0)
	MovementLoopAddLocation(NPC, -9.46, 3, 102.15, 2, 0)
	MovementLoopAddLocation(NPC, -14.9, 3, 104.3, 2, 0)
	MovementLoopAddLocation(NPC, -16.26, 3, 104.32, 2, 0)
	MovementLoopAddLocation(NPC, -22.67, 2.74, 105.12, 2, 0)
	MovementLoopAddLocation(NPC, -22.71, 2.79, 104, 2, 0)
	MovementLoopAddLocation(NPC, -21.95, 2.88, 102.32, 2, 1)
	MovementLoopAddLocation(NPC, -21.95, 2.88, 102.32, 2, 20,"EcologyEmotes")
	MovementLoopAddLocation(NPC, -14.73, 3, 106.13, 2, 0)
	MovementLoopAddLocation(NPC, -15.54, 3, 107.86, 2, 1)
	MovementLoopAddLocation(NPC, -15.54, 3, 107.86, 2, 20,"EcologyEmotes")
	MovementLoopAddLocation(NPC, -9.93, 3, 103.61, 2, 0)
	MovementLoopAddLocation(NPC, -4.59, 3, 99.36, 2, 0)
	MovementLoopAddLocation(NPC, -3.17, 3, 98.54, 2, 1)
	MovementLoopAddLocation(NPC, -3.17, 3, 98.54, 2, 20,"EcologyEmotes")
	MovementLoopAddLocation(NPC, -6.47, 3, 92.96, 2, 0)
	MovementLoopAddLocation(NPC, -6.41, 3, 92.07, 2, 0)
	MovementLoopAddLocation(NPC, -2.72, 3, 89.42, 2, 0)
	MovementLoopAddLocation(NPC, -0.85, 3, 89.43, 2, 1)
	MovementLoopAddLocation(NPC, -0.85, 3, 89.43, 2, 20,"EcologyEmotes")
	MovementLoopAddLocation(NPC, -7.49, 3, 90.08, 2, 0)
	MovementLoopAddLocation(NPC, -8.59, 3, 90.17, 2, 20,"EcologyEmotes")
	MovementLoopAddLocation(NPC, -6.16, 3, 94.76, 2, 0)
	MovementLoopAddLocation(NPC, -5.71, 3, 97.41, 2, 0)
	MovementLoopAddLocation(NPC, -4.15, 3, 100.8, 2, 0)
	MovementLoopAddLocation(NPC, -1.18, 3, 103.39, 2, 0)
	MovementLoopAddLocation(NPC, -2.31, 3, 106.54, 2, 0)
end



	
function Door(NPC,Spawn)
    local door = GetSpawn(NPC, 1360081)
    UseWidget(door)
end
	