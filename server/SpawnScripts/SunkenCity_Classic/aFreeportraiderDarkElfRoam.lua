--[[
    Script Name    : SpawnScripts/SunkenCity_Classic/aFreeportraiderDarkElfRoam.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.10.28 08:10:29
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BaseDarkElf1.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    SetSeeHide(NPC,1)
    RandomMovement(NPC, Spawn, 5, -5, 2, 8, 15)
    darkelf(NPC)
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end
