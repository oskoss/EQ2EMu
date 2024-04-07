--[[
    Script Name    : SpawnScripts/TheGraveyard_Classic/acontagiousratRoam.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.08.19 09:08:51
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 3.5, -3.5, 2, 8, 15)
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end
