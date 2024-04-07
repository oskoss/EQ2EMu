--[[
    Script Name    : SpawnScripts/Peatbog_Classic/agreaterbogfaerie.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.11.03 03:11:21
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