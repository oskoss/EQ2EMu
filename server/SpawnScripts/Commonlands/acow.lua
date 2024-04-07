--[[
    Script Name    : SpawnScripts/Commonlands/acow.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.04 07:01:36
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 15, -15, 1, 15, 25)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end