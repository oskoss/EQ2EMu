--[[
    Script Name    : SpawnScripts/TheSprawl_Classic/awilddogpup.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.11.08 08:11:54
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