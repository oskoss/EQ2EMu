--[[
    Script Name    : SpawnScripts/TempleSt/Rhast.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.28 04:10:58
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
	MovementLoopAddLocation(NPC, 93.23, -4.57, 100.4, 2, 1)
	MovementLoopAddLocation(NPC, 93.23, -4.57, 100.4, 2, 30,"Drink")
	MovementLoopAddLocation(NPC, 93.23, -4.57, 100.4, 2, 30,"Drink")
	MovementLoopAddLocation(NPC, 93.23, -4.57, 100.4, 2, 0)
	MovementLoopAddLocation(NPC, 94.22, -4.57, 101.35, 2, 0)
	MovementLoopAddLocation(NPC, 92.92, -4.57, 102.22, 2, 0)
	MovementLoopAddLocation(NPC, 86.16, -4.57, 103.94, 2, 0)
	MovementLoopAddLocation(NPC, 83.65, -4.57, 109.76, 2, 0)
	MovementLoopAddLocation(NPC, 81.93, -4.57, 112.9, 2, 0)
	MovementLoopAddLocation(NPC, 78.67, -4.57, 115, 2, 1)
	MovementLoopAddLocation(NPC, 78.67, -4.57, 115, 2, 20,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 81.34, -4.57, 113.59, 2, 0)
	MovementLoopAddLocation(NPC, 80.99, -4.57, 111.82, 2, 1)
	MovementLoopAddLocation(NPC, 80.99, -4.57, 111.82, 2, 20,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 80.99, -4.57, 111.82, 2, 0)
	MovementLoopAddLocation(NPC, 82.59, -4.57, 111.99, 2, 0)
	MovementLoopAddLocation(NPC, 83.83, -4.57, 110.25, 2, 0)
	MovementLoopAddLocation(NPC, 88.09, -4.57, 104.42, 2, 0)
	MovementLoopAddLocation(NPC, 97.45, -4.57, 101.72, 2, 0)
	MovementLoopAddLocation(NPC, 101.39, -4.57, 100.11, 2, 0)
	MovementLoopAddLocation(NPC, 101.39, -4.57, 100.11, 2, 1)
	MovementLoopAddLocation(NPC, 101.39, -4.57, 100.11, 2, 30,"Drink")
	MovementLoopAddLocation(NPC, 101.04, -4.57, 100.48, 2, 0)
	MovementLoopAddLocation(NPC, 99.76, -4.57, 100.93, 2, 0)
	MovementLoopAddLocation(NPC, 95.38, -4.57, 102.42, 2, 0)
end

function Drink(NPC)
    PlayFlavor(NPC,"","","drinking_idle",0,0)
    AddTimer(NPC,8000, "Drink2")
end

function Drink2(NPC)
  choice = math.random(1,2)   
         if choice == 1 then    
            PlayFlavor(NPC,"","","yawn",0,0)
        else
             PlayFlavor(NPC,"","","happy",0,0)
        end            
    AddTimer(NPC,6000, "Drink3")
end

function Drink3(NPC)
    PlayFlavor(NPC,"","","drinking_idle",0,0)
end
