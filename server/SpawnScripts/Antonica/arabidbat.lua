--[[
    Script Name    : SpawnScripts/Antonica/arabidbat.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.01.18 08:01:54
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovementFlight(NPC, Spawn, 20, -20, 4, -4, 2, 8, 15)
end
function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end