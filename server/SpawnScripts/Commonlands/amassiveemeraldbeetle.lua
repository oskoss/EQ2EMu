--[[
    Script Name    : SpawnScripts/Commonlands/amassiveemeraldbeetle.lua
    Script Author  : gloat
    Script Date    : 2019.01.31 12:01:10
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 8, -8, 2, 8, 15)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end

function respawn(NPC)

end

