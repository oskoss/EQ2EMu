--[[
    Script Name    : SpawnScripts/Antonica/aDarkpawbruteRoam.lua
    Script Author  : LordPazuzu
    Script Date    : 2024.03.26 09:03:42
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/DarkpawGnoll1.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    IdleAggressive(NPC)
    RandomMovement(NPC, Spawn, 12, -12, 2, 8, 15)
end


function respawn(NPC)
	spawn(NPC)
end