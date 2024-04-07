--[[
    Script Name    : SpawnScripts/Antonica/GuardWaters.lua
    Script Author  : Dorbin
    Script Date    : 2023.05.12 11:05:11
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/GenericGuardVoiceOvers.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
    if GetFactionAmount(Spawn,11)<0 then
        else
    FaceTarget(NPC, Spawn)
    GenericGuardHail(NPC,Spawn)
end
end

function respawn(NPC)
	spawn(NPC)
end