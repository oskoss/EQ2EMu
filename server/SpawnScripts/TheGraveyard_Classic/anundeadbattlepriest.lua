--[[
    Script Name    : SpawnScripts/TheGraveyard_Classic/anundeadbattlepriest.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.08.14 03:08:14
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BaseSkeleton2.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 8, -8, 2, 8, 15)
    SetSpawnAnimation(NPC, 13016)
    Appearance(NPC)
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end

function Appearance(NPC)
    if GetGender(NPC)==2 then
    SpawnSet(NPC,"model_type",1521)    
    else
    SpawnSet(NPC,"model_type",140)    
    end
end