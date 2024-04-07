--[[
    Script Name    : SpawnScripts/SunkenCity_Classic/aFreeportraiderTrollRoam.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.10.28 08:10:17
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BaseTroll1.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 5, -5, 2, 8, 15)
    troll(NPC)
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end
