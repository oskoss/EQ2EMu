--[[
    Script Name    : SpawnScripts/Antonica/aWindstalkerlumberjack.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.07.22 03:07:58
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/Windstalkers.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    human(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end