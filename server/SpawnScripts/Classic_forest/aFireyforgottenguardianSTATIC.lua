--[[
    Script Name    : SpawnScripts/Classic_forest/aFireyforgottenguardianSTATIC.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.10.14 09:10:22
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BaseFireElemental1.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end