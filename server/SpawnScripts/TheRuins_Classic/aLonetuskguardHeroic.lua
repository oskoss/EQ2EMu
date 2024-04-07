--[[
    Script Name    : SpawnScripts/TheRuins_Classic/aLonetuskguardHeroic.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.07.01 08:07:18
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/LoneTusk2.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomWeapons(NPC)
    OrcArmorCommon(NPC)
    Lonetusk(NPC)
    IdleAlert(NPC)
end

function respawn(NPC)
    spawn(NPC)
end
