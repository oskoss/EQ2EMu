--[[
    Script Name    : SpawnScripts/TheThievesWay_Classic/atrashhopper.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.12.24 06:12:12
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, -3, 3, 2, 8, 15)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end