--[[
    Script Name    : SpawnScripts/Peatbog_Classic/agreaterbogfaerieRoam.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.11.03 03:11:19
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/Fairy_PeatBog.lua")
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