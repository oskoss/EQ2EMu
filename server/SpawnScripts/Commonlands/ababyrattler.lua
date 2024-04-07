--[[
    Script Name    : SpawnScripts/Commonlands/ababyrattler.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.17 08:01:13
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