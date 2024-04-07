--[[
    Script Name    : SpawnScripts/Commonlands/aDervishheretic.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.09 11:01:16
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