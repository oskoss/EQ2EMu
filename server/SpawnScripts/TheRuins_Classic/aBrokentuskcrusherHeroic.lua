--[[
    Script Name    : SpawnScripts/TheRuins_Classic/aBrokentuskcrusherHeroic.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.08.05 06:08:25
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BrokenTusk1.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomWeapons(NPC)
    OrcArmorCommon(NPC)
    Brokentusk(NPC)
    IdleAggressive(NPC)
end

function respawn(NPC)
    spawn(NPC)
end

function hailed(NPC, Spawn)
	FaceTarget(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end