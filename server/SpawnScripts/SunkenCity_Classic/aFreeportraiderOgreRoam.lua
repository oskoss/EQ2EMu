--[[
    Script Name    : SpawnScripts/SunkenCity_Classic/aFreeportraiderOgreRoam.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.10.28 08:10:25
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BaseOgre1.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 5, -5, 2, 8, 15)
    ogre(NPC)
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end

