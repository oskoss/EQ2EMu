--[[
    Script Name    : SpawnScripts/Commonlands/anelephantcalf.lua
    Script Author  : gloat
    Script Date    : 2019.01.31 01:01:42
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
