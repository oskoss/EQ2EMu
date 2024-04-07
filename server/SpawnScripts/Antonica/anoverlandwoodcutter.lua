--[[
    Script Name    : SpawnScripts/Antonica/anoverlandwoodcutter.lua
    Script Author  : Dorbin
    Script Date    : 2023.06.20 04:06:16
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/ForestersAntonica.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    human(NPC)
    SetInfoStructString(NPC, "action_state", "forestry_chopping")
end

function hailed(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end