--[[
    Script Name    : SpawnScripts/Antonica/aDarkpawmystic.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.07.12 02:07:57
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/DarkpawGnoll1.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    IdlePriest(NPC)
end

function hailed(NPC, Spawn)
end

function aggro(NPC, Spawn)
    
end

function respawn(NPC)
	spawn(NPC)
end