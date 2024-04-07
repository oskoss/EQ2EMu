--[[
    Script Name    : SpawnScripts/TempleSt/Shalvo.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.28 04:10:47
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
    if not HasLanguage(Spawn,26)then
    Garbled(NPC,Spawn)
    else
    GenericEcologyHail(NPC, Spawn, faction)
end
end

function InRange(NPC,Spawn)
if GetFactionAmount(Spawn,12)<0 then
    FactionCheckCallout(NPC,Spawn,faction)
    else
    if not HasLanguage(Spawn,26)then
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
	MovementLoopAddLocation(NPC, 43.26, 3, 85.42, 2, 1)
	MovementLoopAddLocation(NPC, 43.26, 3, 85.42, 2, 25,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 43.99, 3, 78.04, 2, 1,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 43.99, 3, 78.04, 2, 10)
	MovementLoopAddLocation(NPC, 43.34, 3, 76.25, 2, 0)
	MovementLoopAddLocation(NPC, 44.07, 3, 75.74, 2, 1)
	MovementLoopAddLocation(NPC, 44.07, 3, 75.74, 2, 10,"EcologyEmotes")
	MovementLoopAddLocation(NPC, 44.07, 3, 75.74, 2, 0)
	MovementLoopAddLocation(NPC, 43.25, 3, 76.07, 2, 0)
	MovementLoopAddLocation(NPC, 43.17, 3, 76.76, 2, 0)
	MovementLoopAddLocation(NPC, 48.77, 3, 86.87, 2, 1)
	MovementLoopAddLocation(NPC, 48.77, 3, 86.87, 2, 34,"EcologyEmotes")

end

	