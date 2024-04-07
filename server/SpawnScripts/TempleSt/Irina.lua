--[[
    Script Name    : SpawnScripts/TempleSt/Irina.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.27 07:10:12
    Script Purpose : 
                   : 
--]]

dofile("SpawnScripts/Generic/GenericEcologyVoiceOvers.lua")
dofile("SpawnScripts/Generic/UnknownLanguage.lua")

function spawn(NPC)
SetPlayerProximityFunction(NPC, 7, "InRange", "LeaveRange")		
    SetInfoStructString(NPC, "action_state", "ponder")
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
end
end
end
    
function respawn(NPC)
		spawn(NPC)
	end
	

