--[[
    Script Name    : SpawnScripts/TheThievesWay_Classic/aunionmenderLocal858Roam.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.12.07 04:12:24
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"
dofile("SpawnScripts/Generic/MonsterCallouts/Pipefitters.lua")

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    gnome(NPC, Spawn)
    RandomMovement(NPC, Spawn, -4, 4, 2, 8, 15)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end