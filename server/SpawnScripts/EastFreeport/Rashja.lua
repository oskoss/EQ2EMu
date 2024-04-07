--[[
    Script Name    : SpawnScripts/EastFreeport/Rashja.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.11 04:10:38
    Script Purpose : 
                   : 
--]]

dofile("SpawnScripts/Generic/GenericEcologyVoiceOvers.lua")

function spawn(NPC)
    SetPlayerProximityFunction(NPC, 5, "InRange", "LeaveRange")		
end

function hailed(NPC, Spawn)
FaceTarget(NPC, Spawn)
GenericEcology2Hail(NPC, Spawn, faction)
end

function InRange(NPC,Spawn)
GenericEcology2Hail(NPC, Spawn, faction)
end