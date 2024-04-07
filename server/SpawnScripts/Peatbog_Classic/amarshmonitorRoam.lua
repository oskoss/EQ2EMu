--[[
    Script Name    : SpawnScripts/Peatbog_Classic/amarshmonitorRoam.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.11.02 09:11:49
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 7, -7, 2, 8, 15)
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end