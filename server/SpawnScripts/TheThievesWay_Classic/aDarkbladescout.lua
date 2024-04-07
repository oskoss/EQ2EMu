--[[
    Script Name    : SpawnScripts/TheThievesWay_Classic/aDarkbladescout.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.12.02 04:12:13
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    race(NPC,Spawn)
    IdleAggressive(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function race(NPC, Spawn)
    local race = MakeRandomInt(1,6)
    if race == 1 or race == 2 then
        human(NPC, Spawn)
    elseif race == 3 or race == 4 then
        ratonga(NPC, Spawn)
    elseif race == 5 then
        kerra(NPC, Spawn)
    elseif race == 6 then
        darkelf(NPC, Spawn)
    end
end