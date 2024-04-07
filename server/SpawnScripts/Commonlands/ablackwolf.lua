--[[
    Script Name    : SpawnScripts/Commonlands/ablackwolf.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.03 05:01:11
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    class(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end

function class(NPC, Spawn)
    setclass = MakeRandomInt(1,3)
    if setclass == 1 then 
        SpawnSet(NPC, "class", 2) --Warrior
    elseif setclass == 2 then
        SpawnSet(NPC, "class", 15) -- Druid
    elseif setclass == 3 then
        SpawnSet(NPC, "class", 38) -- Predator
    end
    
end