--[[
    Script Name    : SpawnScripts/IsleRefuge1/atimberwolfpup1.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.09.05 08:09:31
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 9, -9, 2, 8, 15)
end


function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end