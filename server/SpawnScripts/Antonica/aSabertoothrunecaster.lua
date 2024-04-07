--[[
    Script Name    : SpawnScripts/Antonica/aSabertoothrunecaster.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.07.12 10:07:45
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/SabertoothGnoll1.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomWeapons(NPC)
    IdlePriest(NPC)
    
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end