--[[
    Script Name    : SpawnScripts/IsleRefuge1/aGruttoothsentry.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.09.09 04:09:16
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BaseGoblin2.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
end



function respawn(NPC)
	spawn(NPC)
end