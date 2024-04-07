--[[
    Script Name    : SpawnScripts/TheSprawl_Classic/GuardLUnt.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.11.27 06:11:34
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