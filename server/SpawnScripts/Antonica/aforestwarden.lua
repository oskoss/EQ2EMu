--[[
    Script Name    : SpawnScripts/Antonica/aforestwarden.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.07.09 01:07:35
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/ForestersAntonica.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    human(NPC)
    RandomMovement(NPC, Spawn, 20, -20, 2, 8, 15)
end
function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end

