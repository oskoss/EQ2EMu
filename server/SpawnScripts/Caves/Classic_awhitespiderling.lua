--[[
    Script Name    : SpawnScripts/Caves/Classic_awhitespiderling.lua
    Script Author  : Dorbin
    Script Date    : 2022.10.13 03:10:46
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    ChooseMovement(NPC)
end

function ChooseMovement(NPC)
    if GetSpawnLocationID(NPC)~= 133778067 or GetSpawnLocationID(NPC)~= 133778068 then
    RandomMovement(NPC, Spawn, 4, -4, 2, 8, 15)
end
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end