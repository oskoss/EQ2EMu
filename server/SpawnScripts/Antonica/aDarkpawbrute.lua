--[[
    Script Name    : SpawnScripts/Antonica/aDarkpawbrute.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.07.11 10:07:07
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/DarkpawGnoll1.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    IdleAggressive(NPC)
end


function respawn(NPC)
	spawn(NPC)
end