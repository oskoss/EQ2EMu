--[[
    Script Name    : SpawnScripts/SunkenCity_Classic/amenacingraiderLarge.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.03 04:01:11
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    race(NPC)
    IdleAggressive(NPC)
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end

function race(NPC, Spawn)
    local race = MakeRandomInt(1, 2)
    if race == 1 then
        ogre(NPC)
    elseif race == 2 then
        troll(NPC)
    end
end