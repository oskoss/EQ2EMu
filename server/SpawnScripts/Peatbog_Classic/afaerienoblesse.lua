--[[
    Script Name    : SpawnScripts/Peatbog_Classic/afaerienoblesse.lua
    Script Author  : Dorbin
    Script Date    : 2022.11.05 04:11:44
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/Fairy_PeatBog.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
end


function respawn(NPC)
	spawn(NPC)
end