--[[
    Script Name    : SpawnScripts/BeggarsCourt/CaiusEbonroot.lua
    Script Author  : Dorbin
    Script Date    : 2023.11.27 02:11:37
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/GenericEcologyVoiceOvers.lua")
dofile("SpawnScripts/Generic/UnknownLanguage.lua")

function spawn(NPC)
SetPlayerProximityFunction(NPC,7, "InRange", "LeaveRange")		
    SetInfoStructString(NPC, "action_state", "tapfoot")
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
    if not HasLanguage(Spawn,7)then
    Garbled(NPC,Spawn)
    else
    GenericEcologyHail(NPC, Spawn, faction)
end
end

function InRange(NPC,Spawn)
if GetFactionAmount(Spawn,12)<0 then
    FactionCheckCallout(NPC,Spawn,faction)
    else
    if not HasLanguage(Spawn,7)then
        if math.random(0,100)<40 then
        Garbled(NPC,Spawn)
        end
    else
end
end
end