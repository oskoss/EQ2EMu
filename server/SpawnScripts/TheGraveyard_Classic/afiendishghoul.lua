--[[
    Script Name    : SpawnScripts/TheGraveyard_Classic/afiendishghoul.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.08.14 07:08:46
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 4, -4, 2, 8, 15)
    SetSpawnAnimation(NPC, 13016)
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end