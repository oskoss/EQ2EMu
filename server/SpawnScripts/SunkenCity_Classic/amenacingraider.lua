--[[
    Script Name    : SpawnScripts/SunkenCity_Classic/amenacingraider.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.10.24 11:10:38
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    race(NPC)
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
        dofile("SpawnScripts/Generic/MonsterCallouts/BaseDarkElf1.lua")
        darkelf(NPC)
        SetSeeHide(NPC,1)
        IdleSneaky(NPC)
    elseif race == 2 then
        human(NPC)
        IdleAlert(NPC)
    end
end