--[[
    Script Name    : SpawnScripts/Antonica/aCaltorsisknightHeroic.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.02.02 08:02:15
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