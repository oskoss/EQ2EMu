--[[
    Script Name    : SpawnScripts/Antonica/aCavemawrockmelter.lua
    Script Author  : Dorbin
    Script Date    : 2023.05.15 12:05:13
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BaseGnoll1.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
end



function respawn(NPC)
	spawn(NPC)
end