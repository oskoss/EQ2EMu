--[[
    Script Name    : SpawnScripts/Commonlands/ABerserkGolem.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.03 05:01:39
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