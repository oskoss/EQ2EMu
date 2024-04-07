--[[
    Script Name    : SpawnScripts/Commonlands/afallendefender.lua
    Script Author  : gloat
    Script Date    : 2019.01.31 02:01:44
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end

function respawn(NPC)

end

