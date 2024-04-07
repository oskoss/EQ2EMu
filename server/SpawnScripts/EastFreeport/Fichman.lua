--[[
    Script Name    : SpawnScripts/EastFreeport/Fichman.lua
    Script Author  : Dorbin
    Script Date    : 2023.10.11 05:10:54
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/GenericEcologyVoiceOvers.lua")

function spawn(NPC)
    SetInfoStructString(NPC, "action_state", "drinking_idle")
SetPlayerProximityFunction(NPC, 5, "InRange", "LeaveRange")	
end

function InRange(NPC, Spawn) 
    GenericDrunkCallout(NPC, Spawn, faction)    
    end


function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
GenericDrunkHail(NPC, Spawn, faction)
end