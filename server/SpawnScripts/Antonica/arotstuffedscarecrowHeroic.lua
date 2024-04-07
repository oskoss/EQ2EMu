--[[
    Script Name    : SpawnScripts/Antonica/arotstuffedscarecrowHeroic.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.08.29 11:08:06
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
    FaceTarget(NPC, Spawn)
end