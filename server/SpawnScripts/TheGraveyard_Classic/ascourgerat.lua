--[[
    Script Name    : SpawnScripts/TheGraveyard_Classic/ascourgerat.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.08.14 01:08:45
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