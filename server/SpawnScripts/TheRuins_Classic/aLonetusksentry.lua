--[[
    Script Name    : SpawnScripts/TheRuins_Classic/aLonetusksentry.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.07.02 02:07:43
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
