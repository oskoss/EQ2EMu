--[[
    Script Name    : SpawnScripts/Caves/aRockpawstonemaster.lua
    Script Author  : Dorbin
    Script Date    : 2022.10.05 11:10:34
    Script Purpose : 
                   : 
--]]

dofile("SpawnScripts/Generic/MonsterCallouts/BaseGnoll1.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)

end


function respawn(NPC)
	spawn(NPC)
end