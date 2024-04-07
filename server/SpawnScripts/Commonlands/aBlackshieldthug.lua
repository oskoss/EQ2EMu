--[[
    Script Name    : SpawnScripts/Commonlands/aBlackshieldthug.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.04 03:01:59
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    race(NPC)
    class(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function race(NPC, Spawn)
    setrace = MakeRandomInt(1,2)
    if setrace == 2 then
        human(NPC)
    elseif setrace == 2 then
        halfelf(NPC)
    end
end

function class (NPC, Spawn)
    class = MakeRandomInt(1,3)
    if class == 1 then
        SpawnSet(NPC, "class", 5)
    elseif class == 2 then
        SpawnSet(NPC, "class", 2)
    elseif class == 3 then
        SpawnSet(NPC, "class", 38)
    end
end