--[[
    Script Name    : SpawnScripts/Oakmyst_Classic/AmbassadorJalanderra.lua
    Script Author  : Dorbin
    Script Date    : 2022.10.22 01:10:43
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BaseFairy1.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
end

function hailed(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end