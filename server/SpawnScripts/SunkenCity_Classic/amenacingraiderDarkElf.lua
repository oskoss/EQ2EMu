--[[
    Script Name    : SpawnScripts/SunkenCity_Classic/amenacingraiderDarkElf.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.10.27 08:10:09
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
    elseif race == 2 then
        human(NPC)
    end
end

