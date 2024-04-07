--[[
    Script Name    : SpawnScripts/Antonica/awitherstrawscarecrow.lua
    Script Author  : Dorbin
    Script Date    : 2023.05.27 12:05:42
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/WitherstrawScarecrows.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
end



function respawn(NPC)
	spawn(NPC)
end