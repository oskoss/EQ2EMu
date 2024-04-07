--[[
    Script Name    : SpawnScripts/TheGraveyard_Classic/arottingzombieHeroic.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.08.15 02:08:27
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