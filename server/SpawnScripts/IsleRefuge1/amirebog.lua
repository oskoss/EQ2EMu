--[[
    Script Name    : SpawnScripts/IsleRefuge1/amirebog.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.09.05 07:09:34
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 12, -12, 2, 8, 15)
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
end