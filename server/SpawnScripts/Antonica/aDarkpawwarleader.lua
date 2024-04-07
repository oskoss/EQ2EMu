--[[
    Script Name    : SpawnScripts/Antonica/aDarkpawwarleader.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.09.24 04:09:20
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    IdleAggressive(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end