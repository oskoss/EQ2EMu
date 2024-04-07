--[[
    Script Name    : SpawnScripts/EastFreeport/Irena.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.11 03:10:15
    Script Purpose : 
                   : 
--]]

dofile("SpawnScripts/Generic/GenericEcologyVoiceOvers.lua")

function spawn(NPC)
    SetPlayerProximityFunction(NPC, 5, "InRange", "LeaveRange")		
end

function hailed(NPC, Spawn)
FaceTarget(NPC, Spawn)
GenericEcologyHail(NPC, Spawn, faction)
end

function InRange(NPC,Spawn)
GenericEcologyCallout(NPC, Spawn, faction)
end