--[[
    Script Name    : SpawnScripts/Classic_forest/aDifficultEarthforgottenguardian.lua
    Script Author  : Dorbin
    Script Date    : 2022.10.15 03:10:46
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BaseGolem1.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    SetSpawnAnimation(NPC, 13016)
    RandomMovement(NPC, Spawn, 7, -7, 2, 8, 15)
end 

function respawn(NPC, Spawn)
    spawn(NPC)
end
