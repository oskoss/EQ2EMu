--[[
    Script Name    : SpawnScripts/Commonlands/amoonwisp.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.01.27 04:01:51
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovementFlight(NPC, Spawn, -8, -8, 4, 0, 2, 8, 15)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end