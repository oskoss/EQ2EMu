--[[
    Script Name    : SpawnScripts/IsleRefuge1/aGruttoothmysticR.lua
    Script Author  : LordPazuzu
    Script Date    : 2022.09.06 01:09:56
    Script Purpose : 
                   : 
--]]
dofile("SpawnScripts/Generic/MonsterCallouts/BaseGoblin1.lua")
require "SpawnScripts/Generic/NPCModule"

function spawn(NPC, Spawn)
    NPCModule(NPC, Spawn)
    RandomMovement(NPC, Spawn, 9, -9, 2, 8, 15)
end


function respawn(NPC, Spawn)
    spawn(NPC)
end

function hailed(NPC, Spawn)
    FaceTarget(NPC, Spawn)
end