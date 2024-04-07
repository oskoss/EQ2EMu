--[[
    Script Name    : SpawnScripts/Commonlands/asavannadeer.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.23 12:01:39
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 10, -10, 2, 8, 15)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end