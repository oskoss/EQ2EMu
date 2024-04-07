--[[
    Script Name    : SpawnScripts/DownBelow_Classic/avenomspitter.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.01.09 09:01:50
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end