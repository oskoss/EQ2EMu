--[[
    Script Name    : SpawnScripts/Antonica/HighwaymanHighMelee.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.07.07 09:07:17
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/HighwaymanAntonica.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    IdleAggressive(NPC)
    barbarian(NPC)
end

function respawn(NPC)
	spawn(NPC)
end