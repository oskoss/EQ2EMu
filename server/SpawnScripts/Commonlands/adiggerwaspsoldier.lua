--[[
    Script Name    : SpawnScripts/Commonlands/adiggerwaspsoldier.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.02.13 01:02:57
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovementFlight(NPC, Spawn, 12, -12, 4, -4, 2, 8, 15)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end