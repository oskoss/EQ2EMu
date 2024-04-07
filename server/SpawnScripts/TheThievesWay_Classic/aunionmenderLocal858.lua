--[[
    Script Name    : SpawnScripts/TheThievesWay_Classic/aunionmenderLocal858.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.12.02 04:12:51
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"
dofile("SpawnScripts/Generic/MonsterCallouts/Pipefitters.lua")

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    gnome(NPC, Spawn)
    IdleTinker(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end