--[[
    Script Name    : SpawnScripts/SunkenCity_Classic/amenacingraiderRoamer.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.03 04:01:03
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 6, -6, 2, 8, 15)
    race(NPC)
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end

function race(NPC, Spawn)
    local race = MakeRandomInt(1, 4)
    if race == 1 then
        dofile("SpawnScripts/Generic/MonsterCallouts/BaseDarkElf1.lua")
        darkelf(NPC)
        SetSeeHide(NPC,1)
    elseif race == 2 then
        human(NPC)
    elseif race == 3 then
        ogre(NPC)
    elseif race == 4 then
        troll(NPC)
    end
end