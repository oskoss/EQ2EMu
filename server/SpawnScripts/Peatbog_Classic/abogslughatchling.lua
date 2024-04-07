--[[
    Script Name    : SpawnScripts/Peatbog_Classic/abogslughatchling.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.12.27 04:12:49
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 7, -7, 2, 8, 15)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end