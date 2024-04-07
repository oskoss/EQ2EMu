--[[
    Script Name    : SpawnScripts/DownBelow_Classic/atombforager.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.01.12 08:01:22
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 2.5, 2.5, 2, 5, 10)
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end