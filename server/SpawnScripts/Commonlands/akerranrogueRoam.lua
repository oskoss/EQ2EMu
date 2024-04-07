--[[
    Script Name    : SpawnScripts/Commonlands/akerranrogueRoam.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.02.09 10:02:47
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 8, -8, 2, 8, 15)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end