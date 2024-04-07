--[[
    Script Name    : SpawnScripts/TheSprawl_Classic/awilddogStatic.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.11.26 09:11:09
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