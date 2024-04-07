--[[
    Script Name    : SpawnScripts/Commonlands/abadlandsnomad.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.02.14 09:02:26
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    human(NPC)
    Beggar(NPC)
    AddTimer(NPC, 1500, "movement")
end

function movement(NPC, Spawn)
    if IsHeroic(NPC) == false then
        RandomMovement(NPC, Spawn, 12, -12, 2, 8, 15)
    end
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end