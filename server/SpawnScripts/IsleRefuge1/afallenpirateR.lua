--[[
    Script Name    : SpawnScripts/IsleRefuge1/afallenpirateR.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.09.13 04:09:24
    Script Purpose : 
                   : 
--]]

dofile("SpawnScripts/Generic/MonsterCallouts/BaseSkeleton1.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 7, -7, 2, 8, 15)
    SetSpawnAnimation(NPC, 13016)
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end