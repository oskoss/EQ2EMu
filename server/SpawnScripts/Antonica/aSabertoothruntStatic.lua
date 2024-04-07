--[[
    Script Name    : SpawnScripts/Antonica/aSabertoothruntStatic.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.03.23 03:03:44
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