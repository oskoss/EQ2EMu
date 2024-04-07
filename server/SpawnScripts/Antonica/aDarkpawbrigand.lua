--[[
    Script Name    : SpawnScripts/Antonica/aDarkpawbrigand.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.09.24 04:09:21
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    IdleThreaten(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end