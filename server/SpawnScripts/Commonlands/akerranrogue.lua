--[[
    Script Name    : SpawnScripts/Commonlands/akerranrogue.lua
    Script Author  : gloat
    Script Date    : 2019.01.31 02:01:38
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    kerra(NPC)
end
function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end

function respawn(NPC)

end

