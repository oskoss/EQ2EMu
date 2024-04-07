--[[
    Script Name    : SpawnScripts/TheRuins_Classic/GuardGriz.lua
    Script Author  : Dorbin
    Script Date    : 2023.07.04 04:07:47
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/GenericGuardVoiceOvers.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
end

function hailed(NPC, Spawn)
    if GetFactionAmount(Spawn,12)<0 then
        else
	FaceTarget(NPC, Spawn)
    GenericGuardHail(NPC,Spawn)
    end
end

function respawn(NPC)
	spawn(NPC)
end