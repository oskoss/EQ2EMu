--[[
    Script Name    : SpawnScripts/Antonica/aSabertoothneophyteStatic.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.03.23 03:03:37
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/SabertoothGnoll1.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
end



function respawn(NPC)
	spawn(NPC)
end