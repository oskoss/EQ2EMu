--[[
    Script Name    : SpawnScripts/IsleRefuge1/agrizzlybearcub.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.09.11 02:09:55
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 6, -6, 2, 8, 15)
end


function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end