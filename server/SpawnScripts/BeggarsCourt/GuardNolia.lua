--[[
    Script Name    : SpawnScripts/BeggarsCourt/GuardNolia.lua
    Script Author  : Dorbin
    Script Date    : 2023.11.27 04:11:20
    Script Purpose : 
                   : 
--]]

dofile("SpawnScripts/Generic/GenericGuardVoiceOvers.lua")

function spawn(NPC)
end

function respawn(NPC)
	spawn(NPC)
end

function hailed(NPC, Spawn)
    if GetFactionAmount(Spawn,12)<0 then
        else
    FaceTarget(NPC, Spawn)
    GenericGuardHail(NPC,Spawn)
end
end
