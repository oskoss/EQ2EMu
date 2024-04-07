--[[
    Script Name    : SpawnScripts/SunkenCity_Classic/aFreeportraiderHUMAN.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.11.02 08:11:57
    Script Purpose : 
                   : 
--]]

require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 5, -5, 2, 8, 15)
    human(NPC)
end

function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end
