--[[
    Script Name    : SpawnScripts/Commonlands/adervishnegotiator.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.04 07:01:45
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    setclass(NPC)
    setrace(NPC)
    RandomWeapons(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function setclass(NPC, Spawn)
    class = MakeRandomInt(1,4)
    if class == 1 then
        SpawnSet(NPC, "class", 2) -- Warrior
    elseif class == 2 then 
        SpawnSet(NPC, "class", 38) -- Predator
    elseif class == 3 then
        SpawnSet(NPC, "class", 22) -- Sorcerer
    elseif class == 4 then
        SpawnSet(NPC, "class", 5)  -- Brawler
    end
end

function setrace(NPC, Spawn)
    race = MakeRandomInt(1,3)
    if race == 1 then
        human(NPC)
    elseif race == 2 then
        halfelf(NPC)
    elseif race == 3 then
        darkelf(NPC)
    end
end


