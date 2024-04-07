--[[
    Script Name    : SpawnScripts/TheGraveyard_Classic/anundeadbattlepriestNarrowPath.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.08.14 04:08:14
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BaseSkeleton2.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    SetSpawnAnimation(NPC, 13016)
    RandomMovement(NPC, Spawn, 3, -3, 2, 8, 15)
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