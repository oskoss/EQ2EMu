--[[
    Script Name    : SpawnScripts/Antonica/adankfurgnollWarrior.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.03.13 02:03:07
    Script Purpose : 
                   : 
--]]

dofile("SpawnScripts/Generic/MonsterCallouts/DarkpawGnoll1.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    IdleAggressive(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function aggro(NPC, Spawn)
 
end

function respawn(NPC)
	spawn(NPC)
end