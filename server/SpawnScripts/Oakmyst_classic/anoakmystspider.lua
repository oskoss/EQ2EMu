--[[
    Script Name    : SpawnScripts/Oakmyst_classic/anoakmystspider.lua
    Script Author  : Dorbin
    Script Date    : 2022.10.21 01:10:59
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
end

function hailed(NPC, Spawn)
end

function respawn(NPC)
	spawn(NPC)
end