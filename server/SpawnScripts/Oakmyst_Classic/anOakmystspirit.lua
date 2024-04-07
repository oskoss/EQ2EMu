--[[
    Script Name    : SpawnScripts/Oakmyst_Classic/anOakmystspirit.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.10.19 03:10:13
    Script Purpose : 
                   : 
--]]
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovementFlight(NPC, Spawn, 5, -5, 2, -2, 2, 8, 15)
end


function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end