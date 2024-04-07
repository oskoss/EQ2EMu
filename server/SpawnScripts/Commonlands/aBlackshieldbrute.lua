--[[
    Script Name    : SpawnScripts/Commonlands/aBlackshieldbrute.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.04 03:01:53
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    race(NPC)
    IdleAggressive(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function race(NPC)
    setrace = MakeRandomInt(1,2)
    if setrace == 1 then
        human(NPC)
    elseif setrace == 2 then
        halfelf(NPC)
    end
end