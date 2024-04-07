--[[
    Script Name    : SpawnScripts/Commonlands/aplainselephant.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.15 04:01:57
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