--[[
    Script Name    : SpawnScripts/Commonlands/athreshbat.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.09 11:01:47
    Script Purpose : 
                   : 
--]]

require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovementFlight(NPC, Spawn, 4, -4, 4, -4, 1, 8, 15)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end