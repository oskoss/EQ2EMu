--[[
    Script Name    : SpawnScripts/Classic_forest/aFireyforgottenguardian.lua
    Script Author  : Dorbin
    Script Date    : 2022.10.14 06:10:22
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BaseFireElemental1.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 6, -6, 2, 8, 15)
end

function respawn(NPC, Spawn)
    spawn(NPC)
end
