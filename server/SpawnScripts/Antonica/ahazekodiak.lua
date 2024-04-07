--[[
    Script Name    : SpawnScripts/Antonica/ahazekodiak.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.07.12 10:07:33
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, -11, 11, 2, 7, 12)
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end