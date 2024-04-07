--[[
    Script Name    : SpawnScripts/Antonica/agiantbat.lua
    Script Author  : LordPazuzu
    Script Date    : 2023.01.31 08:01:09
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovementFlight(NPC, Spawn, 20, -20, 6, -2, 8, 15)
end
function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end