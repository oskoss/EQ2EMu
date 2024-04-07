--[[
    Script Name    : SpawnScripts/SunkenCity_Classic/aFreeportraiderOgre.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.10.28 08:10:54
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BaseOgre1.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    IdleAggressive(NPC)
    ogre(NPC)
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end

