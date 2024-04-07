--[[
    Script Name    : SpawnScripts/Commonlands/Graverobber.lua
    Script Author  : gloat
    Script Date    : 2019.01.31 01:01:20
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    human(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end

function respawn(NPC)

end

