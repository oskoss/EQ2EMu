--[[
    Script Name    : SpawnScripts/Commonlands/asandstonegiant.lua
    Script Author  : elluwrath
    Script Date    : 2020.07.23 02:07:36
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

