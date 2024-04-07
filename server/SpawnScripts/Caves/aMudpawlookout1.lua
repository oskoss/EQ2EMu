--[[
    Script Name    : SpawnScripts/Caves/aMudpawlookout1.lua
    Script Author  : Dorbin
    Script Date    : 2022.10.10 04:10:16
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BaseGnoll1.lua")
require "SpawnScripts/Generic/CombatModule"

function spawn(NPC, Spawn)
    combatModule(NPC, Spawn)

end


function respawn(NPC)
	spawn(NPC)
end