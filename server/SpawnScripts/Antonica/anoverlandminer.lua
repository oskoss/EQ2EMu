--[[
    Script Name    : SpawnScripts/Antonica/anoverlandminer.lua
    Script Author  : Dorbin
    Script Date    : 2023.05.26 11:05:24
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BaseDwarf1.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    dwarf(NPC)
    SetInfoStructString(NPC, "action_state", "mining_digging")
end

function hailed(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end