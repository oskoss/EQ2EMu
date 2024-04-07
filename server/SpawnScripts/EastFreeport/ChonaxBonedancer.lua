--[[
    Script Name    : SpawnScripts/EastFreeport/ChonaxBonedancer.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.11 03:10:35
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