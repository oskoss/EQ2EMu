--[[
    Script Name    : SpawnScripts/DownBelow_Classic/aBloodsabermeddlerRoam.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.12.27 10:12:35
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 6, -6, 2, 5, 10)
    ratonga(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end