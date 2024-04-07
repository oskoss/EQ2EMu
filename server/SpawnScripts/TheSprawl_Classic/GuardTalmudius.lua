--[[
    Script Name    : SpawnScripts/TheSprawl_Classic/GuardTalmudius.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.11.27 06:11:03
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"
dofile("SpawnScripts/Generic/GenericGuardVoiceOvers.lua")

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end