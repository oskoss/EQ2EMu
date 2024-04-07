--[[
    Script Name    : SpawnScripts/DownBelow_Classic/adustcrawlerhatchlingLocal.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.11.10 07:11:53
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 2.5, 2.5,  1, 3, 5)
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end