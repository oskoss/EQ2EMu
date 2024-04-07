--[[
    Script Name    : SpawnScripts/IsleRefuge1/GoliathBeetle.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.09.05 03:09:44
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 4, -4, 2, 8, 15)
end


function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end