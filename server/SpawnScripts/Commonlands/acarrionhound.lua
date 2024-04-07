--[[
    Script Name    : SpawnScripts/Commonlands/acarrionhound.lua
    Script Author  : gloat
    Script Date    : 2019.01.31 12:01:33
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

