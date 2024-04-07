--[[
    Script Name    : SpawnScripts/Commonlands/agrovewisp.lua
    Script Author  : gloat
    Script Date    : 2019.01.31 02:01:55
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovementFlight(NPC, Spawn, -8, -8, 4, 0, 2, 8, 15)
    
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end

function respawn(NPC)

end

