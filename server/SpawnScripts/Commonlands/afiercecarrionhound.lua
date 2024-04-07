--[[
    Script Name    : SpawnScripts/Commonlands/afiercecarrionhound.lua
    Script Author  : gloat
    Script Date    : 2019.01.31 02:01:21
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 12, -12, 2, 8, 15)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end

function respawn(NPC)

end

