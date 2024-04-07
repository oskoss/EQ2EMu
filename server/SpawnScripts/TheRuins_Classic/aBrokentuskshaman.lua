--[[
    Script Name    : SpawnScripts/TheRuins_Classic/aBrokentuskshaman.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.07.30 09:07:58
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
