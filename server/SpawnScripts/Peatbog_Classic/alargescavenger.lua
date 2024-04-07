--[[
    Script Name    : SpawnScripts/Peatbog_Classic/alargescavenger.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.11.01 04:11:20
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end