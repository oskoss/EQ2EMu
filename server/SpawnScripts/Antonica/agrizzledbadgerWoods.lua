--[[
    Script Name    : SpawnScripts/Antonica/agrizzledbadgerWoods.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.03.27 08:03:29
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    AddTimer(NPC, 6000, "movement")
end

function movement(NPC, Spawn)
    RandomMovement(NPC, Spawn, 12, -12, 2, 8, 15)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end