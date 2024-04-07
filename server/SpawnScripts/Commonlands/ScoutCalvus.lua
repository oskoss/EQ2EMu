--[[
    Script Name    : SpawnScripts/Commonlands/ScoutCalvus.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.16 03:01:49
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