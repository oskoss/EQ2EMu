--[[
    Script Name    : SpawnScripts/TheRuins_Classic/aBrokentuskprophetHeroic.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.08.05 06:08:55
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
    IdlePriest(NPC)
end

function respawn(NPC)
    spawn(NPC)
end
