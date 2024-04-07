--[[
    Script Name    : SpawnScripts/TheThievesWay_Classic/adrownedcavalier.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.12.02 04:12:40
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    SetSpawnAnimation(NPC, 13016)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end