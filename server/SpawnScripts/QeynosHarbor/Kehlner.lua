--[[
    Script Name    : SpawnScripts/QeynosHarbor/Kehlner.lua
    Script Author  : Dorbin
    Script Date    : 2022.11.03 06:11:10
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/ExpelNonCitizen.lua")

function spawn(NPC)
	SetPlayerProximityFunction(NPC, 10, "InRange", "LeaveRange")
end
function InRange(NPC, Spawn)
    NonCitizen(NPC,Spawn)  
end    
    
function hailed(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end