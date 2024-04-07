--[[
    Script Name    : SpawnScripts/TheGraveyard_Classic/anundeadlancerHeroic.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.08.14 04:08:24
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BaseSkeleton2.lua")
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