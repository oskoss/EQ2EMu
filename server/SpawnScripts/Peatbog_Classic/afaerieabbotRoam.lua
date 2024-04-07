--[[
    Script Name    : SpawnScripts/Peatbog_Classic/afaerieabbotRoam.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.11.04 05:11:03
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovementFlight(NPC, Spawn, 7, -7, 4, 0, 2, 8, 15)
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end