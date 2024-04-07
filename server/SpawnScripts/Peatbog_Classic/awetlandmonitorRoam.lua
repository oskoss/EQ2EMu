--[[
    Script Name    : SpawnScripts/Peatbog_Classic/awetlandmonitorRoam.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.11.03 04:11:52
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