--[[
    Script Name    : SpawnScripts/TheGraveyard_Classic/anundeadbattlepriestHeroic.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.08.14 03:08:49
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BaseSkeleton2.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    SetSpawnAnimation(NPC, 13016)
    Appearance(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function Appearance(NPC)
    if GetGender(NPC)==2 then
    SpawnSet(NPC,"model_type",1521)    
    else
    SpawnSet(NPC,"model_type",140)    
    end
end