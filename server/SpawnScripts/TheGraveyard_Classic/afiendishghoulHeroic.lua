--[[
    Script Name    : SpawnScripts/TheGraveyard_Classic/afiendishghoulHeroic.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.08.14 07:08:40
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