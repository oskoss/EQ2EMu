--[[
    Script Name    : SpawnScripts/SunkenCity_Classic/aFreeportraiderDarkElf.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.10.28 08:10:33
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BaseDarkElf1.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    IdleAlert(NPC)
    darkelf(NPC)
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end
