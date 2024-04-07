--[[
    Script Name    : SpawnScripts/Antonica/anearthrumbler.lua
    Script Author  : Dorbin
    Script Date    : 2023.05.15 12:05:46
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    SetSpawnAnimation(NPC, 13016)
    RandomMovement(NPC, Spawn, 6, -6, 2, 8, 15)
end

function respawn(NPC)
	spawn(NPC)
end